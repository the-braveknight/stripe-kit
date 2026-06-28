//
//  CreditNoteLineItem.swift
//  
//
//  Created by Andrew Edwards on 3/7/20.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Credit Note Line Item](https://stripe.com/docs/api/credit_notes/line_item)
public struct CreditNoteLineItem: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The integer amount in `cents` representing the total amount being credited for this line item, excluding (exclusive) tax and discounts.
    public var amount: Int?
    /// Description of the item being credited.
    public var description: String?
    /// The integer amount in cents representing the discount being credited for this line item.
    public var discountAmount: Int?
    /// The amount of discount calculated per discount for this line item
    public var discountAmounts: [CreditNoteLineItemDiscountAmount]?
    /// ID of the invoice line item being credited
    public var invoiceLineItem: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The pretax credit amounts (ex: discount, credit grants, etc) for this line item.
    public var pretaxCreditAmounts: [CreditNotePretaxCreditAmount]?
    /// The number of units of product being credited.
    public var quantity: Int?
    /// The tax rates which apply to the line item.
    public var taxRates: [TaxRate]?
    /// The tax information of the line item.
    public var taxes: [CreditNoteLineItemTax]?
    /// The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When the type is `invoice_line_item` there is an additional `invoice_line_item` property on the resource the value of which is the id of the credited line item on the invoice.
    public var type: CreditNoteLineItemType?
    /// The cost of each unit of product being credited.
    public var unitAmount: Int?
    /// Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    public var unitAmountDecimal: String?

    public init(id: String,
                object: String,
                amount: Int? = nil,
                description: String? = nil,
                discountAmount: Int? = nil,
                discountAmounts: [CreditNoteLineItemDiscountAmount]? = nil,
                invoiceLineItem: String? = nil,
                livemode: Bool? = nil,
                metadata: [String: String]? = nil,
                pretaxCreditAmounts: [CreditNotePretaxCreditAmount]? = nil,
                quantity: Int? = nil,
                taxRates: [TaxRate]? = nil,
                taxes: [CreditNoteLineItemTax]? = nil,
                type: CreditNoteLineItemType? = nil,
                unitAmount: Int? = nil,
                unitAmountDecimal: String? = nil) {
        self.id = id
        self.object = object
        self.amount = amount
        self.description = description
        self.discountAmount = discountAmount
        self.discountAmounts = discountAmounts
        self.invoiceLineItem = invoiceLineItem
        self.livemode = livemode
        self.metadata = metadata
        self.pretaxCreditAmounts = pretaxCreditAmounts
        self.quantity = quantity
        self.taxRates = taxRates
        self.taxes = taxes
        self.type = type
        self.unitAmount = unitAmount
        self.unitAmountDecimal = unitAmountDecimal
    }
}

public struct CreditNoteLineItemDiscountAmount: Codable, Sendable {
    /// The amount, in cents, of the discount.
    public var amount: Int?
    /// The discount that was applied to get this discount amount.
    @Expandable<Discount> public var discount: String?
    
    public init(amount: Int? = nil, discount: String? = nil) {
        self.amount = amount
        self._discount = Expandable(id: discount)
    }
}

public struct CreditNoteLineItemTax: Codable, Sendable {
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

public enum CreditNoteLineItemType: String, Codable, Sendable {
    case invoiceLineItem = "invoice_line_item"
    case customLineItem = "custom_line_item"
}

public struct CreditNoteLineItemList: Codable, Sendable {
    /// String representing the object’s type. Objects of the same type share the same value. Always has the value list.
    public var object: String?
    /// Details about each object.
    public var data: [CreditNoteLineItem]?
    /// True if this list has another page of items after this one that can be fetched.
    public var hasMore: Bool?
    /// The URL where this list can be accessed.
    public var url: String?
    
    public init(object: String? = nil,
                data: [CreditNoteLineItem]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}
