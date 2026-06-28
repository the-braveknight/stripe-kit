//
//  InvoiceLineItem.swift
//  Stripe
//
//  Created by Anthony Castelli on 9/5/17.
//
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Invoice Line Item Object](https://stripe.com/docs/api/invoices/line_item) .
public struct InvoiceLineItem: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String?
    /// The amount, in cents.
    public var amount: Int?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Note that for line items with `type=subscription` this will reflect the metadata of the subscription that caused the line item to be created.
    public var metadata: [String: String]?
    /// The timespan covered by this invoice item.
    public var period: InvoiceLineItemPeriod?
    /// The price of the line item.
    public var price: Price?
    /// Whether this is a proration.
    public var proration: Bool?
    /// The quantity of the subscription, if the line item is a subscription or a proration.
    public var quantity: Int?
    /// A string identifying the type of the source of this line item, either an `invoiceitem` or a `subscription`.
    public var type: InvoiceLineItemType?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The integer amount in cents representing the amount for this line item, excluding all tax and discounts.
    public var amountExcludingTax: Int?
    /// The amount of discount calculated per discount for this line item.
    public var discountAmounts: [InvoiceLineItemDiscountAmount]?
    /// If true, discounts will apply to this line item. Always false for prorations.
    public var discountable: Bool?
    @ExpandableCollection<Discount> public var discounts: [String]?
    /// The ID of the invoice item associated with this line item if any.
    @Expandable<InvoiceItem> public var invoiceItem: String?
    /// Whether this is a test line item.
    public var livemode: Bool?
    /// Additional details for proration line items.
    public var prorationDetails: InvoiceLineItemProrationDetails?
    /// The subscription that the invoice item pertains to, if any.
    @Expandable<Subscription> public var subscription: String?
    /// The subscription item that generated this invoice item. Left empty if the line item is not an explicit result of a subscription.
    @Expandable<SubscriptionItem> public var subscriptionItem: String?
    /// The amount of tax calculated per tax rate for this line item
    public var taxAmounts: [InvoiceTotalTaxAmount]?
    /// The tax rates which apply to the line item.
    public var taxRates: [TaxRate]?
    /// The amount in cents representing the unit amount for this line item, excluding all tax and discounts.
    public var unitAmountExcludingTax: String?
    /// The ID of the invoice that contains this line item.
    public var invoice: String?
    /// The amount of the line item before any taxes or discounts are applied, in cents.
    public var subtotal: Int?
    /// The pricing information of the line item.
    public var pricing: InvoiceLineItemPricing?
    /// The quantity of the subscription, if the line item is a subscription or a proration, expressed as a decimal string. This is used for prices with `usage_type=metered`.
    public var quantityDecimal: String?
    /// The tax information of the line item.
    public var taxes: [InvoiceLineItemTax]?
    /// Contains pretax credit amounts (ex: discount, credit grants, etc) that apply to this line item.
    public var pretaxCreditAmounts: [InvoicePretaxCreditAmount]?
    /// The parent that generated this line item.
    public var parent: InvoiceLineItemParent?

    public init(id: String? = nil,
                amount: Int? = nil,
                currency: Currency? = nil,
                description: String? = nil,
                metadata: [String : String]? = nil,
                period: InvoiceLineItemPeriod? = nil,
                price: Price? = nil,
                proration: Bool? = nil,
                quantity: Int? = nil,
                type: InvoiceLineItemType? = nil,
                object: String,
                amountExcludingTax: Int? = nil,
                discountAmounts: [InvoiceLineItemDiscountAmount]? = nil,
                discountable: Bool? = nil,
                discounts: [String]? = nil,
                invoiceItem: String? = nil,
                livemode: Bool? = nil,
                prorationDetails: InvoiceLineItemProrationDetails? = nil,
                subscription: String? = nil,
                subscriptionItem: String? = nil,
                taxAmounts: [InvoiceTotalTaxAmount]? = nil,
                taxRates: [TaxRate]? = nil,
                unitAmountExcludingTax: String? = nil,
                invoice: String? = nil,
                subtotal: Int? = nil,
                pricing: InvoiceLineItemPricing? = nil,
                quantityDecimal: String? = nil,
                taxes: [InvoiceLineItemTax]? = nil,
                pretaxCreditAmounts: [InvoicePretaxCreditAmount]? = nil,
                parent: InvoiceLineItemParent? = nil) {
        self.id = id
        self.amount = amount
        self.currency = currency
        self.description = description
        self.metadata = metadata
        self.period = period
        self.price = price
        self.proration = proration
        self.quantity = quantity
        self.type = type
        self.object = object
        self.amountExcludingTax = amountExcludingTax
        self.discountAmounts = discountAmounts
        self.discountable = discountable
        self._discounts = ExpandableCollection(ids: discounts)
        self._invoiceItem = Expandable(id: invoiceItem)
        self.livemode = livemode
        self.prorationDetails = prorationDetails
        self._subscription = Expandable(id: subscription)
        self._subscriptionItem = Expandable(id: subscriptionItem)
        self.taxAmounts = taxAmounts
        self.taxRates = taxRates
        self.unitAmountExcludingTax = unitAmountExcludingTax
        self.invoice = invoice
        self.subtotal = subtotal
        self.pricing = pricing
        self.quantityDecimal = quantityDecimal
        self.taxes = taxes
        self.pretaxCreditAmounts = pretaxCreditAmounts
        self.parent = parent
    }
}

public struct InvoiceLineItemPricing: Codable, Sendable {
    /// The type of the pricing details. Currently this is always `price_details`.
    public var type: String?
    /// Details about the price the line item is based on.
    public var priceDetails: InvoiceLineItemPricingPriceDetails?
    /// The unit amount (in cents) of the line item, excluding all tax and discounts, as a decimal string with at most 12 decimal places.
    public var unitAmountDecimal: String?

    public init(type: String? = nil,
                priceDetails: InvoiceLineItemPricingPriceDetails? = nil,
                unitAmountDecimal: String? = nil) {
        self.type = type
        self.priceDetails = priceDetails
        self.unitAmountDecimal = unitAmountDecimal
    }
}

public struct InvoiceLineItemPricingPriceDetails: Codable, Sendable {
    /// The ID of the price this item is associated with.
    @Expandable<Price> public var price: String?
    /// The ID of the product this item is associated with.
    @Expandable<Product> public var product: String?

    public init(price: String? = nil, product: String? = nil) {
        self._price = Expandable(id: price)
        self._product = Expandable(id: product)
    }
}

public struct InvoiceLineItemTax: Codable, Sendable {
    /// The amount of the tax, in cents.
    public var amount: Int?
    /// Whether this tax is inclusive or exclusive.
    public var taxBehavior: InvoiceTaxBehavior?
    /// The reasoning behind this tax, for example, if the product is tax exempt.
    public var taxabilityReason: InvoiceTotalTaxAmountTaxabilityReason?
    /// Additional details about the tax rate. Only present when `type` is `tax_rate_details`.
    public var taxRateDetails: InvoiceTotalTaxRateDetails?
    /// The amount on which tax is calculated, in cents.
    public var taxableAmount: Int?
    /// The type of tax information.
    public var type: String?

    public init(amount: Int? = nil,
                taxBehavior: InvoiceTaxBehavior? = nil,
                taxabilityReason: InvoiceTotalTaxAmountTaxabilityReason? = nil,
                taxRateDetails: InvoiceTotalTaxRateDetails? = nil,
                taxableAmount: Int? = nil,
                type: String? = nil) {
        self.amount = amount
        self.taxBehavior = taxBehavior
        self.taxabilityReason = taxabilityReason
        self.taxRateDetails = taxRateDetails
        self.taxableAmount = taxableAmount
        self.type = type
    }
}

public struct InvoiceLineItemParent: Codable, Sendable {
    /// The type of parent that generated this line item.
    public var type: InvoiceLineItemParentType?
    /// Details about the invoice item that generated this line item.
    public var invoiceItemDetails: InvoiceLineItemParentInvoiceItemDetails?
    /// Details about the subscription item that generated this line item.
    public var subscriptionItemDetails: InvoiceLineItemParentSubscriptionItemDetails?

    public init(type: InvoiceLineItemParentType? = nil,
                invoiceItemDetails: InvoiceLineItemParentInvoiceItemDetails? = nil,
                subscriptionItemDetails: InvoiceLineItemParentSubscriptionItemDetails? = nil) {
        self.type = type
        self.invoiceItemDetails = invoiceItemDetails
        self.subscriptionItemDetails = subscriptionItemDetails
    }
}

public enum InvoiceLineItemParentType: String, Codable, Sendable {
    case invoiceItemDetails = "invoice_item_details"
    case subscriptionItemDetails = "subscription_item_details"
}

public struct InvoiceLineItemParentInvoiceItemDetails: Codable, Sendable {
    /// The ID of the invoice item associated with this line item.
    @Expandable<InvoiceItem> public var invoiceItem: String?
    /// Whether this is a proration.
    public var proration: Bool?
    /// Additional details for proration line items.
    public var prorationDetails: InvoiceLineItemProrationDetails?
    /// The subscription that the invoice item belongs to, if any.
    @Expandable<Subscription> public var subscription: String?

    public init(invoiceItem: String? = nil,
                proration: Bool? = nil,
                prorationDetails: InvoiceLineItemProrationDetails? = nil,
                subscription: String? = nil) {
        self._invoiceItem = Expandable(id: invoiceItem)
        self.proration = proration
        self.prorationDetails = prorationDetails
        self._subscription = Expandable(id: subscription)
    }
}

public struct InvoiceLineItemParentSubscriptionItemDetails: Codable, Sendable {
    /// The invoice item that generated this line item, if any.
    @Expandable<InvoiceItem> public var invoiceItem: String?
    /// Whether this is a proration.
    public var proration: Bool?
    /// Additional details for proration line items.
    public var prorationDetails: InvoiceLineItemProrationDetails?
    /// The subscription that the line item belongs to.
    @Expandable<Subscription> public var subscription: String?
    /// The subscription item that generated this line item.
    @Expandable<SubscriptionItem> public var subscriptionItem: String?

    public init(invoiceItem: String? = nil,
                proration: Bool? = nil,
                prorationDetails: InvoiceLineItemProrationDetails? = nil,
                subscription: String? = nil,
                subscriptionItem: String? = nil) {
        self._invoiceItem = Expandable(id: invoiceItem)
        self.proration = proration
        self.prorationDetails = prorationDetails
        self._subscription = Expandable(id: subscription)
        self._subscriptionItem = Expandable(id: subscriptionItem)
    }
}

public struct InvoiceLineItemPeriod: Codable, Sendable {
    /// Start of the line item’s billing period
    public var start: Date?
    /// End of the line item’s billing period
    public var end: Date?
    
    public init(start: Date? = nil, end: Date? = nil) {
        self.start = start
        self.end = end
    }
}

public enum InvoiceLineItemType: String, Codable, Sendable {
    case invoiceitem
    case subscription
}

public struct InvoiceLineItemDiscountAmount: Codable, Sendable {
    /// The amount, in cents, of the discount.
    public var amount: Int?
    /// The discount that was applied to get this discount amount.
    @Expandable<Discount> public var discount: String?
    
    public init(amount: Int? = nil, discount: String? = nil) {
        self.amount = amount
        self._discount = Expandable(id: discount)
    }
}

public struct InvoiceLineItemProrationDetails: Codable, Sendable {
    /// For a credit proration `line_item`, the original debit `line_items` to which the credit proration applies.
    public var creditedItems: InvoiceLineItemProrationDetailsCreditedItem?
    
    public init(creditedItems: InvoiceLineItemProrationDetailsCreditedItem? = nil) {
        self.creditedItems = creditedItems
    }
}

public struct InvoiceLineItemProrationDetailsCreditedItem: Codable, Sendable {
    /// Invoice containing the credited invoice line items
    public var invoice: String?
    /// Credited invoice line items
    public var invoiceLineItems: [String]?
    
    public init(invoice: String? = nil, invoiceLineItems: [String]? = nil) {
        self.invoice = invoice
        self.invoiceLineItems = invoiceLineItems
    }
}

public struct InvoiceLineItemList: Codable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [InvoiceLineItem]?
    
    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [InvoiceLineItem]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}

public struct InvoiceSearchResult: Codable, Sendable {
    /// A string describing the object type returned.
    public var object: String
    /// A list of invoices, paginated by any request parameters.
    public var data: [Invoice]?
    /// Whether or not there are more elements available after this set.
    public var hasMore: Bool?
    /// The URL for accessing this list.
    public var url: String?
    /// The URL for accessing the next page in search results.
    public var nextPage: String?
    /// The total count of entries in the search result, not just the current page.
    public var totalCount: Int?
    
    public init(object: String,
                data: [Invoice]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil,
                nextPage: String? = nil,
                totalCount: Int? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
        self.nextPage = nextPage
        self.totalCount = totalCount
    }
}
