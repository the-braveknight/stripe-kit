//
//  PortalSession.swift
//  
//
//  Created by Andrew Edwards on 11/28/20.
//

import Foundation

public struct PortalSession: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The configuration used by this session, describing the features available.
    @Expandable<PortalConfiguration> public var configuration: String?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// The ID of the customer for this session.
    public var customer: String?
    /// The ID of the account for this session.
    public var customerAccount: String?
    /// Information about a specific flow for the customer to go through. See the docs to learn more about using customer portal deep links and flows.
    public var flow: PortalSessionFlow?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used.
    public var locale: String?
    /// The account for which the session was created on behalf of. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the docs. Use the Accounts API to modify the `on_behalf_of` account’s branding settings, which the portal displays.
    public var onBehalfOf: String?
    /// The URL to which Stripe should send customers when they click on the link to return to your website.
    public var returnUrl: String?
    /// The short-lived URL of the session giving customers access to the customer portal.
    public var url: String?
    
    public init(id: String,
                object: String,
                configuration: String? = nil,
                created: Date,
                customer: String? = nil,
                customerAccount: String? = nil,
                flow: PortalSessionFlow? = nil,
                livemode: Bool? = nil,
                locale: String? = nil,
                onBehalfOf: String? = nil,
                returnUrl: String? = nil,
                url: String? = nil) {
        self.id = id
        self.object = object
        self._configuration = Expandable(id: configuration)
        self.created = created
        self.customer = customer
        self.customerAccount = customerAccount
        self.flow = flow
        self.livemode = livemode
        self.locale = locale
        self.onBehalfOf = onBehalfOf
        self.returnUrl = returnUrl
        self.url = url
    }
}

public struct PortalSessionFlow: Codable {
    /// Behavior after the flow is completed.
    public var afterCompletion: PortalSessionFlowAfterCompletion?
    /// Configuration when `flow.type=subscription_cancel`.
    public var subscriptionCancel: PortalSessionFlowSubscriptionCancel?
    /// Configuration when `flow.type=subscription_update`.
    public var subscriptionUpdate: PortalSessionFlowSubscriptionUpdate?
    /// Configuration when `flow.type=subscription_update_confirm`.
    public var subscriptionUpdateConfirm: PortalSessionFlowSubscriptionUpdateConfirm?
    /// Type of flow that the customer will go through.
    public var type: PortalSessionFlowType?

    public init(afterCompletion: PortalSessionFlowAfterCompletion? = nil,
                subscriptionCancel: PortalSessionFlowSubscriptionCancel? = nil,
                subscriptionUpdate: PortalSessionFlowSubscriptionUpdate? = nil,
                subscriptionUpdateConfirm: PortalSessionFlowSubscriptionUpdateConfirm? = nil,
                type: PortalSessionFlowType? = nil) {
        self.afterCompletion = afterCompletion
        self.subscriptionCancel = subscriptionCancel
        self.subscriptionUpdate = subscriptionUpdate
        self.subscriptionUpdateConfirm = subscriptionUpdateConfirm
        self.type = type
    }
}

public struct PortalSessionFlowAfterCompletion: Codable {
    /// Configuration when `after_completion=hosted_confirmation`
    public var hostedConfirmation: PortalSessionFlowAfterCompletionHostedConfirmation?
    /// Configuration when `after_completion=redirect`
    public var redirect: PortalSessionFlowAfterCompletionRedirect?
    /// The specified behavior after the purchase is complete.
    public var type: PortalSessionFlowAfterCompletionType?
    
    public init(hostedConfirmation: PortalSessionFlowAfterCompletionHostedConfirmation? = nil,
                redirect: PortalSessionFlowAfterCompletionRedirect? = nil,
                type: PortalSessionFlowAfterCompletionType? = nil) {
        self.hostedConfirmation = hostedConfirmation
        self.redirect = redirect
        self.type = type
    }
}

public struct PortalSessionFlowAfterCompletionHostedConfirmation: Codable {
    /// A custom message to display to the customer after the flow is completed.
    public var customMessage: String?
    
    public init(customMessage: String? = nil) {
        self.customMessage = customMessage
    }
}

public struct PortalSessionFlowAfterCompletionRedirect: Codable {
    /// The URL the customer will be redirected to after the purchase is complete
    public var returnUrl: String?
    
    public init(returnUrl: String? = nil) {
        self.returnUrl = returnUrl
    }
}

public enum PortalSessionFlowAfterCompletionType: String, Codable {
    /// Redirects the customer to the specified `redirect.return_url` after the flow is complete.
    case redirect
    /// Displays a confirmation message on the hosted surface after the flow is complete.
    case hostedConfirmation = "hosted_confirmation"
    /// Redirects to the portal homepage after the flow is complete.
    case portalHomepage = "portal_homepage"
}

public struct PortalSessionFlowSubscriptionCancel: Codable {
    /// Specify a retention strategy to be used in the cancellation flow.
    public var retention: PortalSessionFlowSubscriptionCancelRetention?
    /// The ID of the subscription to be canceled.
    public var subscription: String?

    public init(retention: PortalSessionFlowSubscriptionCancelRetention? = nil,
                subscription: String? = nil) {
        self.retention = retention
        self.subscription = subscription
    }
}

public struct PortalSessionFlowSubscriptionCancelRetention: Codable {
    /// Configuration when `retention.type=coupon_offer`.
    public var couponOffer: PortalSessionFlowSubscriptionCancelRetentionCouponOffer?
    /// Type of retention strategy that will be used.
    public var type: PortalSessionFlowSubscriptionCancelRetentionType?

    public init(couponOffer: PortalSessionFlowSubscriptionCancelRetentionCouponOffer? = nil,
                type: PortalSessionFlowSubscriptionCancelRetentionType? = nil) {
        self.couponOffer = couponOffer
        self.type = type
    }
}

public struct PortalSessionFlowSubscriptionCancelRetentionCouponOffer: Codable {
    /// The ID of the coupon to be offered.
    public var coupon: String?

    public init(coupon: String? = nil) {
        self.coupon = coupon
    }
}

public enum PortalSessionFlowSubscriptionCancelRetentionType: String, Codable {
    /// Offer a coupon to the customer as a retention strategy.
    case couponOffer = "coupon_offer"
}

public struct PortalSessionFlowSubscriptionUpdate: Codable {
    /// The ID of the subscription to be updated.
    public var subscription: String?

    public init(subscription: String? = nil) {
        self.subscription = subscription
    }
}

public struct PortalSessionFlowSubscriptionUpdateConfirm: Codable {
    /// The coupon or promotion code to apply to this subscription update.
    public var discounts: [PortalSessionFlowSubscriptionUpdateConfirmDiscount]?
    /// The subscription item to be updated through this flow.
    public var items: [PortalSessionFlowSubscriptionUpdateConfirmItem]?
    /// The ID of the subscription to be updated.
    public var subscription: String?

    public init(discounts: [PortalSessionFlowSubscriptionUpdateConfirmDiscount]? = nil,
                items: [PortalSessionFlowSubscriptionUpdateConfirmItem]? = nil,
                subscription: String? = nil) {
        self.discounts = discounts
        self.items = items
        self.subscription = subscription
    }
}

public struct PortalSessionFlowSubscriptionUpdateConfirmDiscount: Codable {
    /// The ID of the coupon to apply to this subscription update.
    public var coupon: String?
    /// The ID of a promotion code to apply to this subscription update.
    public var promotionCode: String?

    public init(coupon: String? = nil, promotionCode: String? = nil) {
        self.coupon = coupon
        self.promotionCode = promotionCode
    }
}

public struct PortalSessionFlowSubscriptionUpdateConfirmItem: Codable {
    /// The ID of the subscription item to be updated.
    public var id: String?
    /// The price the customer should subscribe to through this flow. The price must also be included in the configuration's `features.subscription_update.products`.
    public var price: String?
    /// Quantity for this item that the customer should subscribe to through this flow.
    public var quantity: Int?

    public init(id: String? = nil, price: String? = nil, quantity: Int? = nil) {
        self.id = id
        self.price = price
        self.quantity = quantity
    }
}

public enum PortalSessionFlowType: String, Codable {
    /// Customer will be able to cancel their subscription
    case subscriptionCancel = "subscription_cancel"
    /// Customer will be able to add a new payment method. The payment method will be set as the `customer.invoice_settings.default_payment_method`.
    case paymentMethodUpdate = "payment_method_update"
    /// Customer will be able to initiate an update of a particular subscription.
    case subscriptionUpdate = "subscription_update"
    /// Customer will be able to confirm a particular update of a subscription.
    case subscriptionUpdateConfirm = "subscription_update_confirm"
}
