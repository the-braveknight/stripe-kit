//
//  Indirect.swift
//
//
//  Adds heap indirection to an otherwise recursive value type so that types
//  such as `StripeError` (which transitively contains a `PaymentIntent`, which
//  in turn contains a `StripeError`) can remain `struct`s instead of classes.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// A property wrapper that stores its optional value behind an `indirect` enum,
/// providing the heap indirection required to break a recursive value-type
/// cycle. It encodes and decodes transparently as the wrapped value.
@propertyWrapper
public struct Indirect<Wrapped: Codable & Sendable>: Codable, Sendable {
    private indirect enum Storage: Sendable {
        case none
        case some(Wrapped)
    }

    private var storage: Storage

    public init(wrappedValue: Wrapped?) {
        storage = wrappedValue.map(Storage.some) ?? .none
    }

    public var wrappedValue: Wrapped? {
        get {
            if case let .some(value) = storage { return value }
            return nil
        }
        set { storage = newValue.map(Storage.some) ?? .none }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            storage = .none
        } else {
            storage = .some(try container.decode(Wrapped.self))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch storage {
        case .none:
            try container.encodeNil()
        case let .some(value):
            try container.encode(value)
        }
    }
}

extension KeyedDecodingContainer {
    /// Defaults a missing key to an empty `Indirect`, mirroring how optional
    /// properties decode when their key is absent.
    public func decode<Wrapped>(_ type: Indirect<Wrapped>.Type, forKey key: Self.Key) throws -> Indirect<Wrapped> {
        try decodeIfPresent(type, forKey: key) ?? Indirect(wrappedValue: nil)
    }
}
