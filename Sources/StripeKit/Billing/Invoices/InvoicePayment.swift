//
//  InvoicePayment.swift
//  Stripe
//
//  Models the Invoice Payment object introduced in the dahlia API. Each entry
//  in an `Invoice`'s expandable `payments` list is one of these, recording an
//  attempt to pay (or part-pay) the invoice via a charge, payment intent, or
//  payment record.
//  https://docs.stripe.com/api/invoice-payment/object
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Invoice Payment Object.](https://docs.stripe.com/api/invoice-payment/object)
public struct InvoicePayment: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String?
    /// Amount that was actually paid for this invoice, in cents (or local equivalent). This field is `nil` until the payment is `paid`. This amount can be less than the `amountRequested` if the PaymentIntent’s `amount_received` is not sufficient to pay all of the invoices that it is attached to.
    public var amountPaid: Int?
    /// Amount intended to be paid toward this invoice, in cents (or local equivalent).
    public var amountRequested: Int?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// The invoice that was paid.
    @Expandable<Invoice> public var invoice: String?
    /// Whether this `InvoicePayment` is the `invoice`’s default `InvoicePayment`. Always `true` for invoices that have no associated subscriptions and were automatically created.
    public var isDefault: Bool?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool?
    /// The details on the payment for this invoice.
    public var payment: InvoicePaymentPayment?
    /// The status of the payment, one of `open`, `paid`, or `canceled`.
    public var status: InvoicePaymentStatus?
    /// The timestamps when the payment transitioned to its various statuses.
    public var statusTransitions: InvoicePaymentStatusTransitions?

    public init(id: String,
                object: String? = nil,
                amountPaid: Int? = nil,
                amountRequested: Int? = nil,
                created: Date? = nil,
                currency: Currency? = nil,
                invoice: String? = nil,
                isDefault: Bool? = nil,
                livemode: Bool? = nil,
                payment: InvoicePaymentPayment? = nil,
                status: InvoicePaymentStatus? = nil,
                statusTransitions: InvoicePaymentStatusTransitions? = nil) {
        self.id = id
        self.object = object
        self.amountPaid = amountPaid
        self.amountRequested = amountRequested
        self.created = created
        self.currency = currency
        self._invoice = Expandable(id: invoice)
        self.isDefault = isDefault
        self.livemode = livemode
        self.payment = payment
        self.status = status
        self.statusTransitions = statusTransitions
    }
}

public struct InvoicePaymentPayment: Codable, Sendable {
    /// Type of payment object, one of `charge`, `payment_intent`, or `payment_record`.
    public var type: InvoicePaymentType?
    /// ID of the successful charge for this payment when `type` is `charge`. Note: charge is only surfaced if the payment object is not associated with a PaymentIntent.
    @Expandable<Charge> public var charge: String?
    /// ID of the PaymentIntent associated with this payment when `type` is `payment_intent`. Note: This property is only populated for invoices finalized on or after March 15th, 2019.
    @Expandable<PaymentIntent> public var paymentIntent: String?
    /// ID of the PaymentRecord associated with this payment when `type` is `payment_record`.
    public var paymentRecord: String?

    public init(type: InvoicePaymentType? = nil,
                charge: String? = nil,
                paymentIntent: String? = nil,
                paymentRecord: String? = nil) {
        self.type = type
        self._charge = Expandable(id: charge)
        self._paymentIntent = Expandable(id: paymentIntent)
        self.paymentRecord = paymentRecord
    }
}

public enum InvoicePaymentType: String, Codable, Sendable {
    case charge
    case paymentIntent = "payment_intent"
    case paymentRecord = "payment_record"
}

public enum InvoicePaymentStatus: String, Codable, Sendable {
    /// The payment is still in progress.
    case open
    /// The payment was successful.
    case paid
    /// The payment was canceled.
    case canceled
}

public struct InvoicePaymentStatusTransitions: Codable, Sendable {
    /// The time that the payment was canceled.
    public var canceledAt: Date?
    /// The time that the payment succeeded.
    public var paidAt: Date?

    public init(canceledAt: Date? = nil, paidAt: Date? = nil) {
        self.canceledAt = canceledAt
        self.paidAt = paidAt
    }
}

public struct InvoicePaymentList: Codable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var totalCount: Int?
    public var data: [InvoicePayment]?

    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                totalCount: Int? = nil,
                data: [InvoicePayment]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.totalCount = totalCount
        self.data = data
    }
}
