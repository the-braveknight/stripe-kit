# StripeKit

A strongly-typed, async/await Swift client for the Stripe API, built on `async-http-client` and `swift-crypto`. Targets macOS 12+, iOS 15+, tvOS 15+, watchOS 8+. Built with `swift-tools-version:6.3` under the **Swift 6 language mode** (full strict-concurrency checking).

## Architecture

- **`Sources/StripeKit/StripeClient.swift`** — top-level entry point; exposes one route handler per resource group as immutable (`let`) properties. It's a `final class` (a shared, long-lived client) and a fully-checked `Sendable`.
- **`Sources/StripeKit/StripeRequest.swift`** — the HTTP layer. Sets the pinned `Stripe-Version` header, auth, and content type, then encodes/decodes every request. **The API version is hard-pinned here** (see migration notes below). `StripeAPIHandler` is `Sendable`; its `JSONDecoder` is a computed property (a non-`Sendable` class, so it can't be stored).
- **`*Routes.swift`** files — protocol + default implementation per resource; build form-encoded request bodies and call `StripeRequest.send`. Route protocols inherit `StripeAPIRoute`, which inherits `Sendable`.
- **Model files** (e.g. `Subscription.swift`, `Charge.swift`) — `Codable, Sendable` structs mirroring Stripe response objects.
- **`Shared Models/StripeExpandable.swift`** — `@Expandable` / `@DynamicExpandable` / `@ExpandableCollection` property wrappers for Stripe's expandable references.
- **`Shared Models/Indirect.swift`** — `@Indirect` property wrapper (an `indirect`-enum box) that adds heap indirection so recursive value types stay structs. Used on `_StripeError.paymentIntent` to break the `StripeError` → `PaymentIntent` → `StripeError` cycle.

### Decoding conventions (important when editing models)

The shared `JSONDecoder` in `StripeRequest.swift` uses:
- `keyDecodingStrategy = .convertFromSnakeCase` → Swift properties are **camelCase**; snake_case API keys map automatically (`current_period_end` → `currentPeriodEnd`). Only add explicit `CodingKeys` when automatic conversion wouldn't produce the right key.
- `dateDecodingStrategy = .secondsSince1970` → all Unix-timestamp fields are `Date` / `Date?`. **Millisecond** timestamps must NOT be typed `Date` (they'd be misread); keep them `Int`.

Other conventions: monetary amounts are `Int`; currency fields use the `Currency` enum; metadata is `[String: String]?`; enums conform to `String, Codable, Sendable`; models are `public` structs with public memberwise initializers.

### Concurrency / Sendable conventions (important when adding types)

The package builds under the Swift 6 language mode, so **every public type must be `Sendable`**:
- New `public struct` models: add `Sendable` to the conformance list (e.g. `public struct Foo: Codable, Sendable`).
- New `public enum`s: add `Sendable` too (public enums aren't implicitly `Sendable` across the module, and the structs that hold them won't compile otherwise).
- Generic types: constrain the parameters (e.g. `<Model: Codable & Sendable>`) or add a conditional `extension … : Sendable where …`.
- A new model that's transitively self-recursive (contains a type that contains it) won't compile as a pure struct — wrap the recursive field with `@Indirect` (see `Indirect.swift`).

## Build & test

```bash
swift build   # Swift 6 language mode — must stay warning-clean
swift test
```

---

## Stripe API version & migration plan

**Currently pinned: `2026-06-24.dahlia`** (in `StripeRequest.swift`). Stripe uses named release trains (acacia → basil → clover → dahlia); see the per-release changelogs at `https://docs.stripe.com/changelog/<release>.md` and the authoritative per-resource object schemas at `https://docs.stripe.com/api/<resource>/object.md`.

### How to upgrade the API version

1. Bump the `Stripe-Version` string in `StripeRequest.swift`.
2. For each changed resource, fetch its current `https://docs.stripe.com/api/<resource>/object.md` schema and reconcile the Swift model field-by-field (add new optional fields, fix renames/type changes, add new enum cases, update nested structs and the memberwise init).
3. `swift build` until clean, then `swift test`.

### Migration history: 2022-11-15 → 2026-06-24.dahlia

All ~96 model/route files were reconciled against the dahlia object schemas using a **conservative strategy**: additive, new fields optional, and *deprecated/removed fields are kept (not deleted)* so they simply decode to `nil` rather than breaking. Build and tests are green.

### ⚠️ Known residual risks / follow-up items

These were intentionally deferred and are worth addressing:

- ✅ **Strict-enum unknown-value crashes — RESOLVED.** `EventType`, `EventObject` (`Core Resources/Events/Event.swift`), and `Currency` (`Shared Models/Currency.swift`) now fall back to an `unknown` case via a custom `init(from:)` instead of throwing, so newer webhook event types / object types / currency codes decode safely. `EventObject` preserves the raw discriminator as `unknown(String)`; `EventType`/`Currency` collapse unrecognized values to `.unknownEvent` / `.unknown`. Covered by `UnknownFallbackTests`. **Note:** these enums are now non-exhaustive — `switch` statements over them require a `default` (or explicit `unknown` handling).
- **Field moves consumers must adopt** (old fields retained but now decode to `nil`):
  - `Subscription.currentPeriodStart/End` moved to the **item** level (`items.data[].currentPeriodStart/End`).
  - `Invoice` top-level `charge`/`paymentIntent`/`subscription`/`tax` → now under the new `parent` / `payments` structures.
  - `Discount` top-level `coupon` → `source.coupon`.
- **Source-breaking rename:** `intervalFailure` → `internalFailure` (old raw value `interval_failure` was a typo that never decoded real responses).
- **Conservatively-typed fields:** several payment-method brand/network/funding fields and new APM sub-hashes were modeled as `String?` or empty structs to avoid decode failures on unanticipated values; they can be strengthened to typed enums/structs later.
- **Not modeled:** legacy `usage_records` schema (Stripe returns 404 for its object reference). (The invoice `payments` list is now modeled — `InvoicePayment` / `InvoicePaymentList`, wired into `Invoice.payments`.)

> Full per-resource change log and the complete list of ~111 logged uncertainties from the migration run are in the workflow output for run `wf_5e3d2643-c7f`.
