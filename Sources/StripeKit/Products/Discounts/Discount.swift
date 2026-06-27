//
//  Discount.swift
//  Stripe
//
//  Created by Andrew Edwards on 6/7/17.
//
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Discount Object](https://stripe.com/docs/api/discounts/object)
public struct Discount: Codable {
    /// The ID of the discount object. Discounts cannot be fetched by ID. Use expand[]=discounts in API calls to expand discount IDs in an array.
    public var id: String
    /// Hash describing the coupon applied to create this discount.
    public var coupon: Coupon?
    /// The source of the discount, describing what was redeemed to create this discount (for example, a coupon).
    public var source: DiscountSource?
    /// The id of the customer this discount is associated with.
    @Expandable<Customer> public var customer: String?
    /// The ID of the account representing the customer associated with this discount.
    public var customerAccount: String?
    /// If the coupon has a duration of repeating, the date that this discount will end. If the coupon has a duration of once or forever, this attribute will be null.
    public var end: Date?
    /// Date that the coupon was applied.
    public var start: Date?
    /// The subscription that this coupon is applied to, if it is applied to a particular subscription.
    public var subscription: String?
    /// The subscription item that this coupon is applied to, if it is applied to a particular subscription item.
    public var subscriptionItem: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
    public var checkoutSession: String?
    /// The invoice that the discount’s coupon was applied to, if it was applied directly to a particular invoice.
    public var invoice: String?
    /// The invoice item id (or invoice line item id for invoice line items of type=‘subscription’) that the discount’s coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
    public var invoiceItem: String?
    /// The promotion code applied to create this discount.
    @Expandable<PromotionCode> public var promotionCode: String?
    
    public init(id: String,
                coupon: Coupon? = nil,
                source: DiscountSource? = nil,
                customer: String? = nil,
                customerAccount: String? = nil,
                end: Date? = nil,
                start: Date? = nil,
                subscription: String? = nil,
                subscriptionItem: String? = nil,
                object: String,
                checkoutSession: String? = nil,
                invoice: String? = nil,
                invoiceItem: String? = nil,
                promotionCode: String? = nil) {
        self.id = id
        self.coupon = coupon
        self.source = source
        self._customer = Expandable(id: customer)
        self.customerAccount = customerAccount
        self.end = end
        self.start = start
        self.subscription = subscription
        self.subscriptionItem = subscriptionItem
        self.object = object
        self.checkoutSession = checkoutSession
        self.invoice = invoice
        self.invoiceItem = invoiceItem
        self._promotionCode = Expandable(id: promotionCode)
    }
}

/// The source of a ``Discount``, describing what was redeemed to create the discount.
public struct DiscountSource: Codable {
    /// The type of the source of the discount.
    public var type: DiscountSourceType?
    /// The coupon that was redeemed to create this discount.
    @Expandable<Coupon> public var coupon: String?

    public init(type: DiscountSourceType? = nil,
                coupon: String? = nil) {
        self.type = type
        self._coupon = Expandable(id: coupon)
    }
}

public enum DiscountSourceType: String, Codable {
    /// The discount was created by redeeming a coupon.
    case coupon
}
