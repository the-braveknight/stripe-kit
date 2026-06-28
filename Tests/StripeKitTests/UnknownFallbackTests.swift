import XCTest
@testable import StripeKit

/// Verifies that the forward-compatible enums decode unrecognized API values to
/// their `unknown` fallback instead of throwing — important because Stripe adds
/// new webhook event types, object types, and currencies frequently.
final class UnknownFallbackTests: XCTestCase {

    private func makeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }

    private struct EventTypeBox: Codable { let type: EventType }
    private struct CurrencyBox: Codable { let currency: Currency }

    // MARK: - EventType

    func testEventTypeDecodesKnownValue() throws {
        let data = Data(#"{"type":"invoice.paid"}"#.utf8)
        let box = try makeDecoder().decode(EventTypeBox.self, from: data)
        XCTAssertEqual(box.type, .invoicePaid)
    }

    func testEventTypeFallsBackToUnknown() throws {
        // A type string this SDK version doesn't model must not throw.
        let data = Data(#"{"type":"invoice.some_future_event"}"#.utf8)
        let box = try makeDecoder().decode(EventTypeBox.self, from: data)
        XCTAssertEqual(box.type, .unknownEvent)
    }

    // MARK: - Currency

    func testCurrencyDecodesKnownValue() throws {
        let data = Data(#"{"currency":"usd"}"#.utf8)
        let box = try makeDecoder().decode(CurrencyBox.self, from: data)
        XCTAssertEqual(box.currency, .usd)
    }

    func testCurrencyFallsBackToUnknown() throws {
        let data = Data(#"{"currency":"xbt"}"#.utf8)
        let box = try makeDecoder().decode(CurrencyBox.self, from: data)
        XCTAssertEqual(box.currency, .unknown)
    }

    // MARK: - EventObject

    func testEventObjectFallsBackToUnknownPreservingType() throws {
        let data = Data(#"{"object":"some.future.object","id":"obj_123"}"#.utf8)
        let object = try makeDecoder().decode(EventObject.self, from: data)
        guard case let .unknown(type) = object else {
            return XCTFail("Expected .unknown, got \(object)")
        }
        // The raw discriminator is preserved so callers can inspect it.
        XCTAssertEqual(type, "some.future.object")
    }
}
