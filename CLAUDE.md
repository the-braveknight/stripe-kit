# StripeKit

A strongly-typed, async/await Swift client for the Stripe API, built on `async-http-client` and `swift-crypto`. Targets macOS 12+, iOS 15+, tvOS 15+, watchOS 8+.

## Architecture

- **`Sources/StripeKit/StripeClient.swift`** — top-level entry point; exposes one route handler per resource group.
- **`Sources/StripeKit/StripeRequest.swift`** — the HTTP layer. Sets the pinned `Stripe-Version` header, auth, and content type, then encodes/decodes every request. **The API version is hard-pinned here** (see migration notes below).
- **`*Routes.swift`** files — protocol + default implementation per resource; build form-encoded request bodies and call `StripeRequest.send`.
- **Model files** (e.g. `Subscription.swift`, `Charge.swift`) — `Codable` structs mirroring Stripe response objects.
- **`Shared Models/StripeExpandable.swift`** — `@Expandable` / `@DynamicExpandable` property wrappers for Stripe's expandable references.

### Decoding conventions (important when editing models)

The shared `JSONDecoder` in `StripeRequest.swift` uses:
- `keyDecodingStrategy = .convertFromSnakeCase` → Swift properties are **camelCase**; snake_case API keys map automatically (`current_period_end` → `currentPeriodEnd`). Only add explicit `CodingKeys` when automatic conversion wouldn't produce the right key.
- `dateDecodingStrategy = .secondsSince1970` → all Unix-timestamp fields are `Date` / `Date?`. **Millisecond** timestamps must NOT be typed `Date` (they'd be misread); keep them `Int`.

Other conventions: monetary amounts are `Int`; currency fields use the `Currency` enum; metadata is `[String: String]?`; enums conform to `String, Codable`; models are `public` structs with public memberwise initializers.

## Build & test

```bash
swift build
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

- **Strict enums crash on unknown values** (no `unknown` fallback case + custom decoder):
  - `EventType` and `EventObject` (`Core Resources/Events/Event.swift`) — **highest risk**: Stripe adds webhook event types frequently, and decoding a newer event currently `throw`s. Add a fallback case before relying on webhooks for all event types.
  - `Currency` (`Shared Models/Currency.swift`) — fails to decode any currency code not in the enum.
  - **Recommended fix:** give these enums an `unknown(String)` / default case with a custom `init(from:)`.
- **Field moves consumers must adopt** (old fields retained but now decode to `nil`):
  - `Subscription.currentPeriodStart/End` moved to the **item** level (`items.data[].currentPeriodStart/End`).
  - `Invoice` top-level `charge`/`paymentIntent`/`subscription`/`tax` → now under the new `parent` / `payments` structures.
  - `Discount` top-level `coupon` → `source.coupon`.
- **Source-breaking rename:** `intervalFailure` → `internalFailure` (old raw value `interval_failure` was a typo that never decoded real responses).
- **Conservatively-typed fields:** several payment-method brand/network/funding fields and new APM sub-hashes were modeled as `String?` or empty structs to avoid decode failures on unanticipated values; they can be strengthened to typed enums/structs later.
- **Not modeled:** legacy `usage_records` schema (Stripe returns 404 for its object reference), and a new top-level `payments` (`InvoicePayment` list) object on invoices — no `InvoicePayment` type exists yet.

> Full per-resource change log and the complete list of ~111 logged uncertainties from the migration run are in the workflow output for run `wf_5e3d2643-c7f`.
