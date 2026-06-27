//
//  InvoiceItem.swift
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

/// The [InvoiceItem Object](https://stripe.com/docs/api/invoiceitems/object)
public struct InvoiceItem: Codable {
    /// Unique identifier for the object.
    public var id: String?
    /// Amount (in the currency specified) of the invoice item. This should always be equal to unit_amount * quantity.
    public var amount: Int?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// The ID of the customer who will be billed when this invoice item is billed.
    @Expandable<Customer> public var customer: String?
    /// The ID of the Account object that represents the customer that will be billed when this invoice item is billed.
    public var customerAccount: String?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The amount of the invoice item, after discounts but before credits and taxes.
    public var netAmount: Int?
    /// The parent that generated this invoice item.
    public var parent: InvoiceItemParent?
    /// The period associated with this invoice item. When set to different values, the period will be rendered on the invoice. If you have Stripe Revenue Recognition enabled, the period will be used to recognize and defer revenue. See the Revenue Recognition documentation for details.
    public var period: InvoiceItemPeriod?
    /// The pricing information of the invoice item.
    public var pricing: InvoiceItemPricing?
    /// Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.
    public var proration: Bool?
    /// Additional details for proration line items.
    public var prorationDetails: InvoiceItemProrationDetails?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var date: Date?
    /// If true, discounts will apply to this invoice item. Always false for prorations.
    public var discountable: Bool?
    /// The discounts which apply to the invoice item. Item discounts are applied before invoice discounts. Use expand[]=discounts to expand each discount.
    @ExpandableCollection<Discount> public var discounts: [String]?
    /// The ID of the invoice this invoice item belongs to.
    @Expandable<Invoice> public var invoice: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// Quantity of units for the invoice item. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.
    public var quantity: Int?
    /// Same as `quantity`, but contains a decimal value with at most 12 decimal places.
    public var quantityDecimal: String?
    /// The tax rates which apply to the invoice item. When set, the default_tax_rates on the invoice do not apply to this invoice item.
    public var taxRates: [TaxRate]?
    /// ID of the test clock this invoice item belongs to.
    @Expandable<TestClock> public var testClock: String?

    public init(id: String? = nil,
                amount: Int? = nil,
                currency: Currency? = nil,
                customer: String? = nil,
                customerAccount: String? = nil,
                description: String? = nil,
                metadata: [String : String]? = nil,
                netAmount: Int? = nil,
                parent: InvoiceItemParent? = nil,
                period: InvoiceItemPeriod? = nil,
                pricing: InvoiceItemPricing? = nil,
                proration: Bool? = nil,
                prorationDetails: InvoiceItemProrationDetails? = nil,
                object: String,
                date: Date? = nil,
                discountable: Bool? = nil,
                discounts: [String]? = nil,
                invoice: String? = nil,
                livemode: Bool? = nil,
                quantity: Int? = nil,
                quantityDecimal: String? = nil,
                taxRates: [TaxRate]? = nil,
                testClock: String? = nil) {
        self.id = id
        self.amount = amount
        self.currency = currency
        self._customer = Expandable(id: customer)
        self.customerAccount = customerAccount
        self.description = description
        self.metadata = metadata
        self.netAmount = netAmount
        self.parent = parent
        self.period = period
        self.pricing = pricing
        self.proration = proration
        self.prorationDetails = prorationDetails
        self.object = object
        self.date = date
        self.discountable = discountable
        self._discounts = ExpandableCollection(ids: discounts)
        self._invoice = Expandable(id: invoice)
        self.livemode = livemode
        self.quantity = quantity
        self.quantityDecimal = quantityDecimal
        self.taxRates = taxRates
        self._testClock = Expandable(id: testClock)
    }
}

public struct InvoiceItemParent: Codable {
    /// The type of parent that generated this invoice item.
    public var type: InvoiceItemParentType?
    /// Details about the subscription that generated this invoice item.
    public var subscriptionDetails: InvoiceItemParentSubscriptionDetails?

    public init(type: InvoiceItemParentType? = nil,
                subscriptionDetails: InvoiceItemParentSubscriptionDetails? = nil) {
        self.type = type
        self.subscriptionDetails = subscriptionDetails
    }
}

public enum InvoiceItemParentType: String, Codable {
    case subscriptionDetails = "subscription_details"
}

public struct InvoiceItemParentSubscriptionDetails: Codable {
    /// The subscription that generated this invoice item.
    @Expandable<Subscription> public var subscription: String?
    /// The subscription item that generated this invoice item.
    public var subscriptionItem: String?

    public init(subscription: String? = nil,
                subscriptionItem: String? = nil) {
        self._subscription = Expandable(id: subscription)
        self.subscriptionItem = subscriptionItem
    }
}

public struct InvoiceItemPricing: Codable {
    /// The type of pricing for this invoice item.
    public var type: InvoiceItemPricingType?
    /// Details about the price used to generate this invoice item.
    public var priceDetails: InvoiceItemPricingPriceDetails?
    /// The unit amount (in the `currency` specified) of the invoice item, with at most 12 decimal places.
    public var unitAmountDecimal: String?

    public init(type: InvoiceItemPricingType? = nil,
                priceDetails: InvoiceItemPricingPriceDetails? = nil,
                unitAmountDecimal: String? = nil) {
        self.type = type
        self.priceDetails = priceDetails
        self.unitAmountDecimal = unitAmountDecimal
    }
}

public enum InvoiceItemPricingType: String, Codable {
    case priceDetails = "price_details"
}

public struct InvoiceItemPricingPriceDetails: Codable {
    /// The ID of the price this invoice item is based on.
    @Expandable<Price> public var price: String?
    /// The ID of the product this invoice item is based on.
    @Expandable<Product> public var product: String?

    public init(price: String? = nil,
                product: String? = nil) {
        self._price = Expandable(id: price)
        self._product = Expandable(id: product)
    }
}

public struct InvoiceItemProrationDetails: Codable {
    /// For a credit proration `line_item`, the original debit `line_items` to which the credit proration applies.
    public var creditedItems: InvoiceItemProrationDetailsCreditedItem?

    public init(creditedItems: InvoiceItemProrationDetailsCreditedItem? = nil) {
        self.creditedItems = creditedItems
    }
}

public struct InvoiceItemProrationDetailsCreditedItem: Codable {
    /// Invoice containing the credited invoice line items.
    public var invoice: String?
    /// Credited invoice line items.
    public var invoiceLineItems: [String]?

    public init(invoice: String? = nil, invoiceLineItems: [String]? = nil) {
        self.invoice = invoice
        self.invoiceLineItems = invoiceLineItems
    }
}

public struct InvoiceItemPeriod: Codable {
    /// The start of the period. This value is inclusive.
    public var start: Date?
    /// The end of the period, which must be greater than or equal to the start. This value is inclusive.
    public var end: Date?
    
    public init(start: Date? = nil, end: Date? = nil) {
        self.start = start
        self.end = end
    }
}

public struct InvoiceItemList: Codable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [InvoiceItem]?
}
