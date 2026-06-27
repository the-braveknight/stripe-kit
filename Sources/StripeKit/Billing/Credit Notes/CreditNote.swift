//
//  CreditNote.swift
//  Stripe
//
//  Created by Andrew Edwards on 5/13/19.
//

import Foundation

/// The [Credit Note Object](https://stripe.com/docs/api/credit_notes/object) .
public struct CreditNote: Codable {
    /// Unique identifier for the object.
    public var id: String?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// ID of the invoice.
    @Expandable<Invoice> public var invoice: String?
    /// Line items that make up the credit note
    public var lines: CreditNoteLineItemList?
    /// Customer-facing text that appears on the credit note PDF.
    public var memo: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory`
    public var reason: CreditNoteReason?
    /// Status of this credit note, one of issued or void. Learn more about [voiding credit notes](https://stripe.com/docs/billing/invoices/credit-notes#voiding).
    public var status: CreditNoteStatus?
    /// The integer amount in `cents` representing the amount of the credit note, excluding tax and discount.
    public var subtotal: Int?
    /// The integer amount in `cents` representing the total amount of the credit note, including tax and discount.
    public var total: Int?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The integer amount in cents representing the total amount of the credit note.
    public var amount: Int?
    /// This is the sum of all the shipping amounts.
    public var amountShipping: Int?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// ID of the customer.
    @Expandable<Customer> public var customer: String?
    /// The ID of the account representing the customer that the credit note belongs to.
    public var customerAccount: String?
    /// Customer balance transaction related to this credit note.
    @Expandable<CustomerBalanceTransaction> public var customerBalanceTransaction: String?
    /// The integer amount in cents representing the total amount of discount that was credited.
    public var discountAmount: Int?
    /// The aggregate amounts calculated per discount for all line items.
    public var discountAmounts: [CreditNoteDiscountAmount]?
    /// The date when this credit note is in effect. Same as `created` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the credit note PDF.
    public var effectiveAt: Date?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// A unique number that identifies this particular credit note and appears on the PDF of the credit note and its associated invoice.
    public var number: String?
    /// Amount that was credited outside of Stripe.
    public var outOfBandAmount: Int?
    /// The link to download the PDF of the credit note.
    public var pdf: String?
    /// The amount of the credit note that was refunded to the customer, credited to the customer's balance, or refunded outside of Stripe, after the invoice was paid.
    public var postPaymentAmount: Int?
    /// The amount of the credit note by which the invoice's `amount_remaining` and `amount_due` were reduced, before the invoice was paid.
    public var prePaymentAmount: Int?
    /// The pretax credit amounts (ex: discount, credit grants, etc) for all line items.
    public var pretaxCreditAmounts: [CreditNotePretaxCreditAmount]?
    /// Refunds related to this credit note.
    public var refunds: [CreditNoteRefund]?
    /// The details of the cost of shipping, including the ShippingRate applied to the invoice.
    public var shippingCost: CreditNoteShippingCost?
    /// The integer amount in cents representing the amount of the credit note, excluding all tax and invoice level discounts.
    public var subtotalExcludingTax: Int?
    /// The integer amount in cents representing the total amount of the credit note, excluding tax, but including discounts.
    public var totalExcludingTax: Int?
    /// The aggregate tax information for all line items.
    public var totalTaxes: [CreditNoteTotalTax]?
    /// Type of this credit note, one of `pre_payment`, `post_payment`, or `mixed`. A `pre_payment` credit note means it was issued when the invoice was open. A `post_payment` credit note means it was issued when the invoice was paid. A `mixed` credit note has both pre-payment and post-payment amounts.
    public var type: CreditNoteType?
    /// The time that the credit note was voided.
    public var voidedAt: Date?

    public init(id: String? = nil,
                currency: Currency? = nil,
                invoice: String? = nil,
                lines: CreditNoteLineItemList? = nil,
                memo: String? = nil,
                metadata: [String : String]? = nil,
                reason: CreditNoteReason? = nil,
                status: CreditNoteStatus? = nil,
                subtotal: Int? = nil,
                total: Int? = nil,
                object: String,
                amount: Int? = nil,
                amountShipping: Int? = nil,
                created: Date,
                customer: String? = nil,
                customerAccount: String? = nil,
                customerBalanceTransaction: String? = nil,
                discountAmount: Int? = nil,
                discountAmounts: [CreditNoteDiscountAmount]? = nil,
                effectiveAt: Date? = nil,
                livemode: Bool? = nil,
                number: String? = nil,
                outOfBandAmount: Int? = nil,
                pdf: String? = nil,
                postPaymentAmount: Int? = nil,
                prePaymentAmount: Int? = nil,
                pretaxCreditAmounts: [CreditNotePretaxCreditAmount]? = nil,
                refunds: [CreditNoteRefund]? = nil,
                shippingCost: CreditNoteShippingCost? = nil,
                subtotalExcludingTax: Int? = nil,
                totalExcludingTax: Int? = nil,
                totalTaxes: [CreditNoteTotalTax]? = nil,
                type: CreditNoteType? = nil,
                voidedAt: Date? = nil) {
        self.id = id
        self.currency = currency
        self._invoice = Expandable(id: invoice)
        self.lines = lines
        self.memo = memo
        self.metadata = metadata
        self.reason = reason
        self.status = status
        self.subtotal = subtotal
        self.total = total
        self.object = object
        self.amount = amount
        self.amountShipping = amountShipping
        self.created = created
        self._customer = Expandable(id: customer)
        self.customerAccount = customerAccount
        self._customerBalanceTransaction = Expandable(id: customerBalanceTransaction)
        self.discountAmount = discountAmount
        self.discountAmounts = discountAmounts
        self.effectiveAt = effectiveAt
        self.livemode = livemode
        self.number = number
        self.outOfBandAmount = outOfBandAmount
        self.pdf = pdf
        self.postPaymentAmount = postPaymentAmount
        self.prePaymentAmount = prePaymentAmount
        self.pretaxCreditAmounts = pretaxCreditAmounts
        self.refunds = refunds
        self.shippingCost = shippingCost
        self.subtotalExcludingTax = subtotalExcludingTax
        self.totalExcludingTax = totalExcludingTax
        self.totalTaxes = totalTaxes
        self.type = type
        self.voidedAt = voidedAt
    }
}

public enum CreditNoteReason: String, Codable {
    case duplicate
    case fraudulent
    case orderChange = "order_change"
    case productUnsatisfactory = "product_unsatisfactory"
}

public enum CreditNoteStatus: String, Codable {
    case issued
    case void
}

public struct CreditNoteShippingCost: Codable {
    /// Total shipping cost before any taxes are applied.
    public var amountSubtotal: Int?
    /// Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
    public var amountTax: Int?
    /// Total shipping cost after taxes are applied.
    public var amountTotal: Int?
    /// The ID of the ShippingRate for this invoice.
    @Expandable<ShippingRate> public var shippingRate: String?
    /// The taxes applied to the shipping rate. This field is not included by default. To include it in the response, [expand](https://stripe.com/docs/api/expanding_objects) the `taxes` field.
    public var taxes: [CreditNoteShippingCostTax]?
    
    public init(amountSubtotal: Int? = nil,
                amountTax: Int? = nil,
                amountTotal: Int? = nil,
                shippingRate: String? = nil,
                taxes: [CreditNoteShippingCostTax]? = nil) {
        self.amountSubtotal = amountSubtotal
        self.amountTax = amountTax
        self.amountTotal = amountTotal
        self._shippingRate = Expandable(id: shippingRate)
        self.taxes = taxes
    }
}

public struct CreditNoteShippingCostTax: Codable {
    /// Amount of tax applied for this rate.
    public var amount: Int?
    /// The tax rate applied.
    public var rate: TaxRate?
    /// The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported.
    public var taxabilityReason: CreditNoteTaxabilityReason?
    /// The amount on which tax is calculated, in cents.
    public var taxableAmount: Int?

    public init(amount: Int? = nil,
                rate: TaxRate? = nil,
                taxabilityReason: CreditNoteTaxabilityReason? = nil,
                taxableAmount: Int? = nil) {
        self.amount = amount
        self.rate = rate
        self.taxabilityReason = taxabilityReason
        self.taxableAmount = taxableAmount
    }
}

public struct CreditNoteTaxAmount: Codable {
    /// The amount, in cents, of the tax.
    public var amount: Int?
    /// Whether this tax amount is inclusive or exclusive.
    public var inclusive: Bool?
    /// The tax rate that was applied to get this tax amount.
    @Expandable<TaxRate> public var taxRate: String?
    
    public init(amount: Int? = nil,
                inclusive: Bool? = nil,
                taxRate: String? = nil) {
        self.amount = amount
        self.inclusive = inclusive
        self._taxRate = Expandable(id: taxRate)
    }
}

public enum CreditNoteType: String, Codable {
    case postPayment = "post_payment"
    case prePayment = "pre_payment"
    case mixed
}

public struct CreditNoteDiscountAmount: Codable {
    /// The amount, in cents, of the discount.
    public var amount: Int?
    /// The discount that was applied to get this discount amount.
    @Expandable<Discount> public var discount: String?

    public init(amount: Int? = nil, discount: String? = nil) {
        self.amount = amount
        self._discount = Expandable(id: discount)
    }
}

public struct CreditNotePretaxCreditAmount: Codable {
    /// The amount, in cents, of the pretax credit amount.
    public var amount: Int?
    /// The credit balance transaction that was applied to get this pretax credit amount.
    public var creditBalanceTransaction: String?
    /// The discount that was applied to get this pretax credit amount.
    @Expandable<Discount> public var discount: String?
    /// Type of the pretax credit amount referenced.
    public var type: CreditNotePretaxCreditAmountType?

    public init(amount: Int? = nil,
                creditBalanceTransaction: String? = nil,
                discount: String? = nil,
                type: CreditNotePretaxCreditAmountType? = nil) {
        self.amount = amount
        self.creditBalanceTransaction = creditBalanceTransaction
        self._discount = Expandable(id: discount)
        self.type = type
    }
}

public enum CreditNotePretaxCreditAmountType: String, Codable {
    /// The pretax credit amount is from a credit balance transaction.
    case creditBalanceTransaction = "credit_balance_transaction"
    /// The pretax credit amount is from a discount.
    case discount
}

public struct CreditNoteRefund: Codable {
    /// Amount of the refund that applies to this credit note, in cents.
    public var amountRefunded: Int?
    /// The payment record refund related to this credit note.
    public var paymentRecordRefund: CreditNoteRefundPaymentRecordRefund?
    /// ID of the refund.
    @Expandable<Refund> public var refund: String?
    /// Type of the refund referenced.
    public var type: CreditNoteRefundType?

    public init(amountRefunded: Int? = nil,
                paymentRecordRefund: CreditNoteRefundPaymentRecordRefund? = nil,
                refund: String? = nil,
                type: CreditNoteRefundType? = nil) {
        self.amountRefunded = amountRefunded
        self.paymentRecordRefund = paymentRecordRefund
        self._refund = Expandable(id: refund)
        self.type = type
    }
}

public struct CreditNoteRefundPaymentRecordRefund: Codable {
    /// The ID of the payment record.
    public var paymentRecord: String?
    /// The ID of the refund group.
    public var refundGroup: String?

    public init(paymentRecord: String? = nil, refundGroup: String? = nil) {
        self.paymentRecord = paymentRecord
        self.refundGroup = refundGroup
    }
}

public enum CreditNoteRefundType: String, Codable {
    case refund
    case paymentRecordRefund = "payment_record_refund"
}

public struct CreditNoteTotalTax: Codable {
    /// The amount of the tax, in cents.
    public var amount: Int?
    /// Whether this tax is inclusive or exclusive.
    public var taxBehavior: CreditNoteTaxBehavior?
    /// Additional details about the tax rate. Only present when `type` is `tax_rate_details`.
    public var taxRateDetails: CreditNoteTotalTaxRateDetails?
    /// The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported.
    public var taxabilityReason: CreditNoteTaxabilityReason?
    /// The amount on which tax is calculated, in cents.
    public var taxableAmount: Int?
    /// The type of tax information.
    public var type: CreditNoteTotalTaxType?

    public init(amount: Int? = nil,
                taxBehavior: CreditNoteTaxBehavior? = nil,
                taxRateDetails: CreditNoteTotalTaxRateDetails? = nil,
                taxabilityReason: CreditNoteTaxabilityReason? = nil,
                taxableAmount: Int? = nil,
                type: CreditNoteTotalTaxType? = nil) {
        self.amount = amount
        self.taxBehavior = taxBehavior
        self.taxRateDetails = taxRateDetails
        self.taxabilityReason = taxabilityReason
        self.taxableAmount = taxableAmount
        self.type = type
    }
}

public struct CreditNoteTotalTaxRateDetails: Codable {
    /// The ID of the tax rate.
    @Expandable<TaxRate> public var taxRate: String?

    public init(taxRate: String? = nil) {
        self._taxRate = Expandable(id: taxRate)
    }
}

public enum CreditNoteTotalTaxType: String, Codable {
    case taxRateDetails = "tax_rate_details"
}

public enum CreditNoteTaxBehavior: String, Codable {
    case exclusive
    case inclusive
}

public enum CreditNoteTaxabilityReason: String, Codable {
    case customerExempt = "customer_exempt"
    case notAvailable = "not_available"
    case notCollecting = "not_collecting"
    case notSubjectToTax = "not_subject_to_tax"
    case notSupported = "not_supported"
    case portionProductExempt = "portion_product_exempt"
    case portionReducedRated = "portion_reduced_rated"
    case portionStandardRated = "portion_standard_rated"
    case productExempt = "product_exempt"
    case productExemptHoliday = "product_exempt_holiday"
    case proportionallyRated = "proportionally_rated"
    case reducedRated = "reduced_rated"
    case reverseCharge = "reverse_charge"
    case standardRated = "standard_rated"
    case taxableBasisReduced = "taxable_basis_reduced"
    case zeroRated = "zero_rated"
}

public enum CreditNoteEmailType: String, Codable {
    /// Send the credit note PDF to the customer.
    case creditNote = "credit_note"
    /// Do not send a credit note email.
    case none
}

public struct CreditNoteList: Codable {
    public var object: String
    public var data: [CreditNote]?
    public var hasMore: Bool?
    public var url: String?
    
    public init(object: String,
                data: [CreditNote]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}
