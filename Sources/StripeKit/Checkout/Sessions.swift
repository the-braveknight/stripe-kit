//
//  Sessions.swift
//  Stripe
//
//  Created by Andrew Edwards on 5/4/19.
//
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Session Object.](https://stripe.com/docs/api/checkout/sessions/object)
public struct Session: Codable, Sendable {
    /// Unique identifier for the object. Used to pass to redirectToCheckout in Stripe.js.
    public var id: String
    /// The URL the customer will be directed to if they decide to cancel payment and return to your website.
    public var cancelUrl: String?
    /// A unique string to reference the Checkout Session. This can be a customer ID, a cart ID, or similar, and can be used to reconcile the session with your internal systems.
    public var clientReferenceId: String?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// The ID of the customer for this session. A new customer will be created unless an existing customer was provided in when the session was created.
    @Expandable<Customer> public var customer: String?
    /// If provided, this value will be used when the Customer object is created. If not provided, customers will be asked to enter their email address. Use this parameter to prefill customer data if you already have an email on file. To access information about the customer once a session is complete, use the `customer` field.
    public var customerEmail: String?
    /// The line items purchased by the customer. This field is not included by default. To include it in the response, [expand](https://stripe.com/docs/api/expanding_objects) the `line_items` field.
    public var lineItems: SessionLineItemList?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The mode of the Checkout Session, one of `payment`, `setup`, or `subscription`.
    public var mode: SessionMode?
    /// The ID of the PaymentIntent created if SKUs or line items were provided.
    @Expandable<PaymentIntent> public var paymentIntent: String?
    /// The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`. You can use this value to decide when to fulfill your customer’s order.
    public var paymentStatus: SessionPaymentStatus?
    /// The status of the Checkout Session, one of `open`, `complete`, or `expired`.
    public var status: SessionStatus?
    /// The URL the customer will be directed to after the payment or subscription creation is successful.
    public var successUrl: String?
    /// The URL to the Checkout Session.
    public var url: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String?
    /// When set, provides configuration for actions to take if this Checkout Session expires.
    public var afterExpiration: SessionAfterExpiration?
    /// Enables user redeemable promotion codes.
    public var allowPromotionCodes: Bool?
    /// Total of all items before discounts or taxes are applied.
    public var amountSubtotal: Int?
    /// Total of all items after discounts and taxes are applied.
    public var amountTotal: Int?
    /// Details on the state of automatic tax for the session, including the status of the latest tax calculation.
    public var automaticTax: SessionAutomaticTax?
    /// The value (`auto` or `required`) for whether Checkout collected the customer’s billing address.
    public var billingAddressCollection: SessionBillingAddressCollection?
    /// Results of `consent_collection` for this session.
    public var consent: SessionConsent?
    /// When set, provides configuration for the Checkout Session to gather active consent from customers.
    public var consentCollection: SessionConsentCollection?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// Currency conversion details for automatic currency conversion sessions
    public var currencyConversion: SessionCurrencyConversion?
    /// Collect additional information from your customer using custom fields. Up to 2 fields are supported.
    public var customFields: [SessionCustomField]?
    /// Display additional text for your customers using custom text.
    public var customText: SessionCustomText?
    /// Configure whether a Checkout Session creates a Customer when the Checkout Session completes.
    public var customerCreation: SessionCustomerCreation?
    /// The customer details including the customer’s tax exempt status and the customer’s tax IDs. Only present on Sessions in `payment` or `subscription` mode.
    public var customerDetails: SessionCustomerDetails?
    /// The timestamp at which the Checkout Session will expire
    public var expiresAt: Date?
    /// ID of the invoice created by the Checkout Session, if it exists.
    @Expandable<Invoice> public var invoice: String?
    /// Details on the state of invoice creation for the Checkout Session.
    public var invoiceCreation: SessionInvoiceCreation?
    /// Has the `value` true if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool?
    /// The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser’s locale is used.
    public var locale: SessionLocale?
    /// The ID of the Payment Link that created this Session.
    @Expandable<PaymentLink> public var paymentLink: String?
    /// Configure whether a Checkout Session should collect a payment method.
    public var paymentMethodCollection: SessionPaymentMethodCollection?
    /// Payment-method-specific configuration for the PaymentIntent or SetupIntent of this CheckoutSession.
    public var paymentMethodOptions: SessionPaymentMethodOptions?
    /// A list of the types of payment methods (e.g. card) this Checkout Session is allowed to accept.
    public var paymentMethodTypes: [String]?
    /// Details on the state of phone number collection for the session.
    public var phoneNumberCollection: SessionPhoneNumberCollection?
    /// The ID of the original expired Checkout Session that triggered the recovery flow.
    public var recoveredFrom: String?
    /// The ID of the SetupIntent for Checkout Sessions in setup mode.
    @Expandable<SetupIntent> public var setupIntent: String?
    /// When set, provides configuration for Checkout to collect a shipping address from a customer.
    public var shippingAddressCollection: SessionShippingAddressCollection?
    /// The ID of the ShippingRate for Checkout Sessions in payment mode.
    @Expandable<ShippingRate> public var shippingRate: String?
    /// The details of the customer cost of shipping, including the customer chosen ShippingRate.
    public var shippingCost: SessionShippingCost?
    /// Shipping information for this Checkout Session.
    public var shippingDetails: ShippingLabel?
    /// The shipping rate options applied to this Session.
    public var shipppingOptions: [SessionShippingOption]?
    /// Describes the type of transaction being performed by Checkout in order to customize relevant text on the page, such as the submit button. `submit_type` can only be specified on Checkout Sessions in `payment` mode, but not Checkout Sessions in `subscription` or `setup` mode.
    public var submitType: SessionSubmitType?
    /// The ID of the subscription created if one or more plans were provided.
    @Expandable<Subscription> public var subscription: String?
    /// Details on the state of tax ID collection for the session.
    public var taxIdCollection: SessionTaxIdCollection?
    /// Tax and discount details for the computed total amount.
    public var totalDetails: SessionTotalDetails?
    /// Settings related to Adaptive Pricing.
    public var adaptivePricing: SessionAdaptivePricing?
    /// Branding settings for the Checkout Session.
    public var brandingSettings: SessionBrandingSettings?
    /// The client secret of the Session. Use this with [initStripe’s `clientSecret`](https://stripe.com/docs/js/initializing#init_stripe_js-options-clientSecret) on your front end. This value should be passed to your front end. The client secret can be used to complete a payment from your front end. It should not be stored, logged, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret. Applies to Checkout Sessions with `ui_mode: embedded` or `ui_mode: custom`.
    public var clientSecret: String?
    /// Information about the customer collected within the Checkout Session.
    public var collectedInformation: SessionCollectedInformation?
    /// The ID of the account for this Session.
    public var customerAccount: String?
    /// List of coupons and promotion codes attached to the Checkout Session.
    public var discounts: [SessionDiscount]?
    /// The payment method types excluded from this Checkout Session.
    public var excludedPaymentMethodTypes: [String]?
    /// A unique string to reference the Checkout Session. This can be a customer ID, a cart ID, or similar, and can be used to reconcile the Session with your internal systems.
    public var integrationIdentifier: String?
    /// Settings related to Managed Payments for this Checkout Session.
    public var managedPayments: SessionManagedPayments?
    /// Settings for collecting the customer's name.
    public var nameCollection: SessionNameCollection?
    /// The optional items presented to the customer at checkout.
    public var optionalItems: [SessionOptionalItem]?
    /// Where the user is coming from. This informs the optimizations that are applied to the session.
    public var originContext: SessionOriginContext?
    /// Information about the payment method configuration used for this Checkout Session if one was specified.
    public var paymentMethodConfigurationDetails: SessionPaymentMethodConfigurationDetails?
    /// Permissions for actions that may be taken on this Checkout Session.
    public var permissions: SessionPermissions?
    /// Details on the state of presentment for the session.
    public var presentmentDetails: SessionPresentmentDetails?
    /// This parameter applies to `ui_mode: embedded`. Learn more about the `redirect_on_completion` behavior.
    public var redirectOnCompletion: SessionRedirectOnCompletion?
    /// Applies to Checkout Sessions with `ui_mode: embedded`. The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site.
    public var returnUrl: String?
    /// Controls saved payment method settings for the session. Only available in `payment` and `subscription` mode.
    public var savedPaymentMethodOptions: SessionSavedPaymentMethodOptions?
    /// The UI mode of the Session. Can be `hosted` (default), `embedded`, or `custom`.
    public var uiMode: SessionUIMode?

    public init(id: String,
                cancelUrl: String? = nil,
                clientReferenceId: String? = nil,
                currency: Currency? = nil,
                customer: String? = nil,
                customerEmail: String? = nil,
                lineItems: SessionLineItemList? = nil,
                metadata: [String : String]? = nil,
                mode: SessionMode? = nil,
                paymentIntent: String? = nil,
                paymentStatus: SessionPaymentStatus? = nil,
                status: SessionStatus? = nil,
                successUrl: String? = nil,
                url: String? = nil,
                object: String? = nil,
                afterExpiration: SessionAfterExpiration? = nil,
                allowPromotionCodes: Bool? = nil,
                amountSubtotal: Int? = nil,
                amountTotal: Int? = nil,
                automaticTax: SessionAutomaticTax? = nil,
                billingAddressCollection: SessionBillingAddressCollection? = nil,
                consent: SessionConsent? = nil,
                consentCollection: SessionConsentCollection? = nil,
                created: Date,
                currencyConversion: SessionCurrencyConversion? = nil,
                customFields: [SessionCustomField]? = nil,
                customText: SessionCustomText? = nil,
                customerCreation: SessionCustomerCreation? = nil,
                customerDetails: SessionCustomerDetails? = nil,
                expiresAt: Date? = nil,
                invoice: String? = nil,
                invoiceCreation: SessionInvoiceCreation? = nil,
                livemode: Bool? = nil,
                locale: SessionLocale? = nil,
                paymentLink: String? = nil,
                paymentMethodCollection: SessionPaymentMethodCollection? = nil,
                paymentMethodOptions: SessionPaymentMethodOptions? = nil,
                paymentMethodTypes: [String]? = nil,
                phoneNumberCollection: SessionPhoneNumberCollection? = nil,
                recoveredFrom: String? = nil,
                setupIntent: String? = nil,
                shippingAddressCollection: SessionShippingAddressCollection? = nil,
                shippingRate: String? = nil,
                shippingCost: SessionShippingCost? = nil,
                shippingDetails: ShippingLabel? = nil,
                shipppingOptions: [SessionShippingOption]? = nil,
                submitType: SessionSubmitType? = nil,
                subscription: String? = nil,
                taxIdCollection: SessionTaxIdCollection? = nil,
                totalDetails: SessionTotalDetails? = nil,
                adaptivePricing: SessionAdaptivePricing? = nil,
                brandingSettings: SessionBrandingSettings? = nil,
                clientSecret: String? = nil,
                collectedInformation: SessionCollectedInformation? = nil,
                customerAccount: String? = nil,
                discounts: [SessionDiscount]? = nil,
                excludedPaymentMethodTypes: [String]? = nil,
                integrationIdentifier: String? = nil,
                managedPayments: SessionManagedPayments? = nil,
                nameCollection: SessionNameCollection? = nil,
                optionalItems: [SessionOptionalItem]? = nil,
                originContext: SessionOriginContext? = nil,
                paymentMethodConfigurationDetails: SessionPaymentMethodConfigurationDetails? = nil,
                permissions: SessionPermissions? = nil,
                presentmentDetails: SessionPresentmentDetails? = nil,
                redirectOnCompletion: SessionRedirectOnCompletion? = nil,
                returnUrl: String? = nil,
                savedPaymentMethodOptions: SessionSavedPaymentMethodOptions? = nil,
                uiMode: SessionUIMode? = nil) {
        self.id = id
        self.cancelUrl = cancelUrl
        self.clientReferenceId = clientReferenceId
        self.currency = currency
        self._customer = Expandable(id: customer)
        self.customerEmail = customerEmail
        self.lineItems = lineItems
        self.metadata = metadata
        self.mode = mode
        self._paymentIntent = Expandable(id: paymentIntent)
        self.paymentStatus = paymentStatus
        self.status = status
        self.successUrl = successUrl
        self.url = url
        self.object = object
        self.afterExpiration = afterExpiration
        self.allowPromotionCodes = allowPromotionCodes
        self.amountSubtotal = amountSubtotal
        self.amountTotal = amountTotal
        self.automaticTax = automaticTax
        self.billingAddressCollection = billingAddressCollection
        self.consent = consent
        self.consentCollection = consentCollection
        self.created = created
        self.currencyConversion = currencyConversion
        self.customFields = customFields
        self.customText = customText
        self.customerCreation = customerCreation
        self.customerDetails = customerDetails
        self.expiresAt = expiresAt
        self._invoice = Expandable(id: invoice)
        self.invoiceCreation = invoiceCreation
        self.livemode = livemode
        self.locale = locale
        self._paymentLink = Expandable(id: paymentLink)
        self.paymentMethodCollection = paymentMethodCollection
        self.paymentMethodOptions = paymentMethodOptions
        self.paymentMethodTypes = paymentMethodTypes
        self.phoneNumberCollection = phoneNumberCollection
        self.recoveredFrom = recoveredFrom
        self._setupIntent = Expandable(id: setupIntent)
        self.shippingAddressCollection = shippingAddressCollection
        self._shippingRate = Expandable(id: shippingRate)
        self.shippingCost = shippingCost
        self.shippingDetails = shippingDetails
        self.shipppingOptions = shipppingOptions
        self.submitType = submitType
        self._subscription = Expandable(id: subscription)
        self.taxIdCollection = taxIdCollection
        self.totalDetails = totalDetails
        self.adaptivePricing = adaptivePricing
        self.brandingSettings = brandingSettings
        self.clientSecret = clientSecret
        self.collectedInformation = collectedInformation
        self.customerAccount = customerAccount
        self.discounts = discounts
        self.excludedPaymentMethodTypes = excludedPaymentMethodTypes
        self.integrationIdentifier = integrationIdentifier
        self.managedPayments = managedPayments
        self.nameCollection = nameCollection
        self.optionalItems = optionalItems
        self.originContext = originContext
        self.paymentMethodConfigurationDetails = paymentMethodConfigurationDetails
        self.permissions = permissions
        self.presentmentDetails = presentmentDetails
        self.redirectOnCompletion = redirectOnCompletion
        self.returnUrl = returnUrl
        self.savedPaymentMethodOptions = savedPaymentMethodOptions
        self.uiMode = uiMode
    }
}

public struct SessionCustomField: Codable, Sendable {
    /// Configuration for `type=dropdown` fields.
    public var dropdown: SessionCustomFieldDropdown?
    /// String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters.
    public var key: String?
    /// The label for the field, displayed to the customer.
    public var label: SessionCustomFieldLabel?
    /// Configuration for `type=numeric` fields.
    public var numeric: SessionCustomFieldNumeric?
    /// Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
    public var optional: Bool?
    /// Configuration for `type=text` fields.
    public var text: SessionCustomFieldText?
    /// The type of the field.
    public var type: SessionCustomFieldType?
    
    public init(dropdown: SessionCustomFieldDropdown? = nil,
                key: String? = nil,
                label: SessionCustomFieldLabel? = nil,
                numeric: SessionCustomFieldNumeric? = nil,
                optional: Bool? = nil,
                text: SessionCustomFieldText? = nil,
                type: SessionCustomFieldType? = nil) {
        self.dropdown = dropdown
        self.key = key
        self.label = label
        self.numeric = numeric
        self.optional = optional
        self.text = text
        self.type = type
    }
}

public struct SessionCustomFieldDropdown: Codable, Sendable {
    /// The options available for the customer to select. Up to 200 options allowed
    public var options: [SessionCustomFieldDropdownOption]?
    /// The option selected by the customer. This will be the `value` for the option.
    public var value: String?
    
    public init(options: [SessionCustomFieldDropdownOption]? = nil,
                value: String? = nil) {
        self.options = options
        self.value = value
    }
}

public struct SessionCustomFieldDropdownOption: Codable, Sendable {
    /// The label for the option, displayed to the customer. Up to 100 characters.
    public var label: String?
    /// The value for this option, not displayed to the customer, used by your integration to reconcile the option selected by the customer. Must be unique to this option, alphanumeric, and up to 100 characters.
    public var value: String?
    
    public init(label: String? = nil, value: String? = nil) {
        self.label = label
        self.value = value
    }
}

public struct SessionCustomFieldLabel: Codable, Sendable {
    /// Custom text for the label, displayed to the customer. Up to 50 characters.
    public var custom: String?
    ///The type of the label.
    public var type: SessionCustomFieldLabelType?
    
    public init(custom: String? = nil, type: SessionCustomFieldLabelType? = nil) {
        self.custom = custom
        self.type = type
    }
}

public enum SessionCustomFieldLabelType: String, Codable, Sendable {
    /// Set a custom label for the field.
    case custom
}

public struct SessionCustomFieldNumeric: Codable, Sendable {
    /// The maximum character length constraint for the customer’s input.
    public var maximumLength: Int?
    /// The minimum character length requirement for the customer’s input.
    public var minimumLength: Int?
    /// The value entered by the customer, containing only digits.
    public var value: String?
    
    public init(maximumLength: Int? = nil,
                minimumLength: Int? = nil,
                value: String? = nil) {
        self.maximumLength = maximumLength
        self.minimumLength = minimumLength
        self.value = value
    }
}

public struct SessionCustomFieldText: Codable, Sendable {
    /// The maximum character length constraint for the customer’s input.
    public var maximumLength: Int?
    /// The minimum character length requirement for the customer’s input.
    public var minimumLength: Int?
    /// The value entered by the customer.
    public var value: String?
    
    public init(maximumLength: Int? = nil,
                minimumLength: Int? = nil,
                value: String? = nil) {
        self.maximumLength = maximumLength
        self.minimumLength = minimumLength
        self.value = value
    }
}

public enum SessionCustomFieldType: String, Codable, Sendable {
    /// Collect a string field from your customer.
    case text
    /// Collect a numbers-only field from your customer.
    case numeric
    /// Provide a list of options for your customer to select.
    case dropdown
}

public struct SessionCustomText: Codable, Sendable {
    /// Custom text that should be displayed after the payment confirmation button.
    public var afterSubmit: SessionCustomTextAfterSubmit?
    /// Custom text that should be displayed alongside shipping address collection.
    public var shippingAddress: SessionCustomTextShippingAddress?
    /// Custom text that should be displayed alongside the payment confirmation button.
    public var submit: SessionCustomTextSubmit?
    /// Custom text that should be displayed in place of the default terms of service agreement text.
    public var termsOfServiceAcceptance: SessionCustomTextTermsOfServiceAcceptance?

    public init(afterSubmit: SessionCustomTextAfterSubmit? = nil,
                shippingAddress: SessionCustomTextShippingAddress? = nil,
                submit: SessionCustomTextSubmit? = nil,
                termsOfServiceAcceptance: SessionCustomTextTermsOfServiceAcceptance? = nil) {
        self.afterSubmit = afterSubmit
        self.shippingAddress = shippingAddress
        self.submit = submit
        self.termsOfServiceAcceptance = termsOfServiceAcceptance
    }
}

public struct SessionCustomTextAfterSubmit: Codable, Sendable {
    /// Text may be up to 1200 characters in length.
    public var message: String?

    public init(message: String? = nil) {
        self.message = message
    }
}

public struct SessionCustomTextTermsOfServiceAcceptance: Codable, Sendable {
    /// Text may be up to 1200 characters in length.
    public var message: String?

    public init(message: String? = nil) {
        self.message = message
    }
}

public struct SessionCustomTextShippingAddress: Codable, Sendable {
    /// Text may be up to 1000 characters in length.
    public var message: String?
    
    public init(message: String? = nil) {
        self.message = message
    }
}

public struct SessionCustomTextSubmit: Codable, Sendable {
    /// Text may be up to 1000 characters in length.
    public var message: String?
    
    public init(message: String? = nil) {
        self.message = message
    }
}

public enum SessionCustomerCreation: String, Codable, Sendable {
    /// The Checkout Session will only create a Customer if it is required for Session confirmation. Currently, only `subscription` mode Sessions require a Customer.
    case ifRequired = "if_required"
    /// The Checkout Session will always create a Customer when a Session confirmation is attempted.
    case always
}
public struct SessionInvoiceCreation: Codable, Sendable {
    /// Indicates whether invoice creation is enabled for the Checkout Session.
    public var enabled: Bool?
    /// Parameters passed when creating invoices for payment-mode Checkout Sessions.
    public var invoiceData: SessionInvoiceCreationInvoiceData?
    
    public init(enabled: Bool? = nil, invoiceData: SessionInvoiceCreationInvoiceData? = nil) {
        self.enabled = enabled
        self.invoiceData = invoiceData
    }
}

public struct SessionInvoiceCreationInvoiceData: Codable, Sendable {
    /// The account tax IDs associated with the invoice
    @ExpandableCollection<TaxID> public var accountTaxIds: [String]?
    /// Custom fields displayed on the invoice.
    public var customFields: [SessionInvoiceCreationInvoiceDataCustomFields]?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// Footer displayed on the invoice.
    public var footer: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Options for invoice PDF rendering.
    public var renderingOptions: SessionInvoiceCreationInvoiceDataRenderingOptions?
    
    public init(accountTaxIds: [String]? = nil,
                customFields: [SessionInvoiceCreationInvoiceDataCustomFields]? = nil,
                description: String? = nil,
                footer: String? = nil,
                metadata: [String : String]? = nil,
                renderingOptions: SessionInvoiceCreationInvoiceDataRenderingOptions? = nil) {
        self._accountTaxIds = ExpandableCollection(ids: accountTaxIds)
        self.customFields = customFields
        self.description = description
        self.footer = footer
        self.metadata = metadata
        self.renderingOptions = renderingOptions
    }
}

public struct SessionInvoiceCreationInvoiceDataCustomFields: Codable, Sendable {
    /// The name of the custom field.
    public var name: String?
    /// The value of the custom field.
    public var value: String?
    
    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }
}

public struct SessionInvoiceCreationInvoiceDataRenderingOptions: Codable, Sendable {
    /// How line-item prices and amounts will be displayed with respect to tax on invoice PDFs.
    public var amountTaxDisplay: String?
    
    public init(amountTaxDisplay: String? = nil) {
        self.amountTaxDisplay = amountTaxDisplay
    }
}

public struct SessionAfterExpiration: Codable, Sendable {
    /// When set, configuration used to recover the Checkout Session on expiry.
    public var recovery: SessionAfterExpirationRecovery?
    
    public init(recovery: SessionAfterExpirationRecovery? = nil) {
        self.recovery = recovery
    }
}

public struct SessionAfterExpirationRecovery: Codable, Sendable {
    /// Enables user redeemable promotion codes on the recovered Checkout Sessions. Defaults to `false`
    public var allowPromotionCodes: Bool?
    /// If `true`, a recovery url will be generated to recover this Checkout Session if it expires before a transaction is completed. It will be attached to the Checkout Session object upon expiration.
    public var enabled: Bool?
    /// The timestamp at which the recovery URL will expire.
    public var expiresAt: Date?
    /// URL that creates a new Checkout Session when clicked that is a copy of this expired Checkout Session
    public var url: String?
    
    public init(allowPromotionCodes: Bool? = nil,
                enabled: Bool? = nil,
                expiresAt: Date? = nil,
                url: String? = nil) {
        self.allowPromotionCodes = allowPromotionCodes
        self.enabled = enabled
        self.expiresAt = expiresAt
        self.url = url
    }
}

public struct SessionAutomaticTax: Codable, Sendable {
    /// Indicates whether automatic tax is enabled for the session.
    public var enabled: Bool?
    /// The tax provider powering automatic tax.
    public var provider: String?
    /// The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
    public var liability: SessionAutomaticTaxLiability?
    /// The status of the most recent automated tax calculation for this session.
    public var status: SessionAutomaticTaxStatus?
}

public struct SessionAutomaticTaxLiability: Codable, Sendable {
    /// The connected account being referenced when `type` is `account`.
    @Expandable<ConnectAccount> public var account: String?
    /// Type of the account referenced.
    public var type: String?

    public init(account: String? = nil, type: String? = nil) {
        self._account = Expandable(id: account)
        self.type = type
    }
}

public enum SessionAutomaticTaxStatus: String, Codable, Sendable {
    /// The location details entered by the customer aren’t valid or don’t provide enough location information to accurately determine tax rates.
    case requiresLocationInputs = "requires_location_inputs"
    /// Stripe successfully calculated tax automatically for this session.
    case complete
    /// The Stripe Tax service failed.
    case failed
}

public enum SessionBillingAddressCollection: String, Codable, Sendable {
    /// Checkout will only collect the billing address when necessary. When using `automatic_tax`, Checkout will collect the minimum number of fields required for tax calculation.
    case auto
    /// Checkout will always collect the customer’s billing address.
    case required
}

public struct SessionConsent: Codable, Sendable {
    /// If `opt_in`, the customer consents to receiving promotional communications from the merchant about this Checkout Session.
    public var promotions: String?
    /// If `accepted`, the customer in this Checkout Session has agreed to the merchant’s terms of service.
    public var termsOfService: SessionConsentTermsOfService?
    
    public init(promotions: String? = nil,
                termsOfService: SessionConsentTermsOfService? = nil) {
        self.promotions = promotions
        self.termsOfService = termsOfService
    }
}

public enum SessionConsentTermsOfService: String, Codable, Sendable {
    /// The customer has accepted the specified terms of service agreement.
    case accepted
}

public struct SessionConsentCollection: Codable, Sendable {
    /// If set to `auto`, enables the collection of customer consent for promotional communications. The Checkout Session will determine whether to display an option to opt into promotional communication from the merchant depending on the customer’s locale. Only available to US merchants.
    public var promotions: String?
    /// If set to `required`, it requires customers to accept the terms of service before being able to pay.
    public var termsOfService: String?
    
    public init(promotions: String? = nil, termsOfService: String? = nil) {
        self.promotions = promotions
        self.termsOfService = termsOfService
    }
}

public struct SessionCurrencyConversion: Codable, Sendable {
    /// Total of all items in source currency before discounts or taxes are applied.
    public var amountSubtotal: Int?
    /// Total of all items in source currency after discounts and taxes are applied.
    public var amountTotal: Int?
    /// Exchange rate used to convert source currency amounts to customer currency amounts
    public var fxRate: String?
    /// Creation currency of the CheckoutSession before localization
    public var sourceCurrency: Currency?
    
    public init(amountSubtotal: Int? = nil,
                amountTotal: Int? = nil,
                fxRate: String? = nil,
                sourceCurrency: Currency? = nil) {
        self.amountSubtotal = amountSubtotal
        self.amountTotal = amountTotal
        self.fxRate = fxRate
        self.sourceCurrency = sourceCurrency
    }
}

public struct SessionCustomerDetails: Codable, Sendable {
    /// The customer’s address after a completed Checkout Session. Note: This property is populated only for sessions on or after March 30, 2022.
    public var address: Address?
    /// The customer’s email at time of checkout.
    public var email: String?
    /// The customer’s name after a completed Checkout Session. Note: This property is populated only for sessions on or after March 30, 2022.
    public var name: String?
    /// The customer’s phone number at the time of checkout
    public var phone: String?
    /// The customer’s tax exempt status at time of checkout.
    public var taxExempt: String?
    /// The customer’s tax IDs at time of checkout.
    public var taxIds: [SessionCustomerDetailsTaxId]?
    
    public init(address: Address? = nil,
                email: String? = nil,
                name: String? = nil,
                phone: String? = nil,
                taxExempt: String? = nil,
                taxIds: [SessionCustomerDetailsTaxId]? = nil) {
        self.address = address
        self.email = email
        self.name = name
        self.phone = phone
        self.taxExempt = taxExempt
        self.taxIds = taxIds
    }
}

public struct SessionCustomerDetailsTaxId: Codable, Sendable {
    /// The type of the tax ID.
    public var type: TaxIDType
    /// The value of the tax ID.
    public var value: String?
    
    public init(type: TaxIDType, value: String? = nil) {
        self.type = type
        self.value = value
    }
}

public struct SessionLineItem: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Total discount amount applied. If no discounts were applied, defaults to 0.
    public var amountDiscount: Int?
    /// Total before any discounts or taxes is applied.
    public var amountSubtotal: Int?
    /// Total tax amount applied. If no tax was applied, defaults to 0.
    public var amountTax: Int?
    /// Total after discounts and taxes.
    public var amountTotal: Int?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name.
    public var description: String?
    /// The discounts applied to the line item. This field is not included by default. To include it in the response, expand the `discounts` field.
    public var discounts: [SessionLineItemDiscount]?
    /// The price used to generate the line item.
    public var price: Price?
    /// The quantity of products being purchased.
    public var quantity: Int?
    /// The taxes applied to the line item. This field is not included by default. To include it in the response, expand the `taxes` field.
    public var taxes: [SessionLineItemTax]?
    
    public init(id: String,
                object: String,
                amountDiscount: Int? = nil,
                amountSubtotal: Int? = nil,
                amountTax: Int? = nil,
                amountTotal: Int? = nil,
                currency: Currency? = nil,
                description: String? = nil,
                discounts: [SessionLineItemDiscount]? = nil,
                price: Price? = nil,
                quantity: Int? = nil,
                taxes: [SessionLineItemTax]? = nil) {
        self.id = id
        self.object = object
        self.amountDiscount = amountDiscount
        self.amountSubtotal = amountSubtotal
        self.amountTax = amountTax
        self.amountTotal = amountTotal
        self.currency = currency
        self.description = description
        self.discounts = discounts
        self.price = price
        self.quantity = quantity
        self.taxes = taxes
    }
}

public struct SessionLineItemDiscount: Codable, Sendable {
    /// The amount discounted.
    public var amount: Int?
    /// The discount applied.
    public var discount: Discount?
    
    public init(amount: Int? = nil, discount: Discount? = nil) {
        self.amount = amount
        self.discount = discount
    }
}

public struct SessionLineItemTax: Codable, Sendable {
    /// Amount of tax applied for this rate.
    public var amount: Int?
    /// The tax rate applied.
    public var rate: TaxRate?
    
    public init(amount: Int? = nil, rate: TaxRate? = nil) {
        self.amount = amount
        self.rate = rate
    }
}

public struct SessionLineItemList: Codable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [SessionLineItem]?
    
    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [SessionLineItem]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}

public enum SessionLocale: String, Codable, Sendable {
    case auto = "auto"
    case bg = "bg"
    case cs = "cs"
    case da = "da"
    case de = "de"
    case el = "el"
    case en = "en"
    case enGB = "en-GB"
    case es = "es"
    case es419 = "es-419"
    case et = "et"
    case fi = "fi"
    case fil = "fil"
    case fr = "fr"
    case frCA = "fr-CA"
    case hr = "hr"
    case hu = "hu"
    case id = "id"
    case it = "it"
    case ja = "ja"
    case ko = "ko"
    case lt = "lt"
    case lv = "lv"
    case ms = "ms"
    case mt = "mt"
    case nb = "nb"
    case nl = "nl"
    case pl = "pl"
    case pt = "pt"
    case ptBR = "pt-BR"
    case ro = "ro"
    case ru = "ru"
    case sk = "sk"
    case sl = "sl"
    case sv = "sv"
    case th = "th"
    case tr = "tr"
    case vi = "vi"
    case zh = "zh"
    case zhHK = "zh-HK"
    case zhTW = "zh-TW"
}

public enum SessionMode: String, Codable, Sendable {
    /// Accept one-time payments for cards, iDEAL, and more.
    case payment
    /// Save payment details to charge your customers later.
    case setup
    /// Use Stripe Billing to set up fixed-price subscriptions.
    case subscription
}


public enum SessionPaymentMethodCollection: String, Codable, Sendable {
    /// The Checkout Session will always collect a PaymentMethod.
    case always
    /// The Checkout Session will only collect a PaymentMethod if there is an amount due.
    case ifRequired = "if_required"
}

public struct SessionPhoneNumberCollection: Codable, Sendable {
    /// Indicates whether phone number collection is enabled for the session
    public var enabled: Bool
    
    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct SessionShippingAddressCollection: Codable, Sendable {
    /// An array of two-letter ISO country codes representing which countries Checkout should provide as options for shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI`.
    public var allowedCountries: [String]?
    
    public init(allowedCountries: [String]? = nil) {
        self.allowedCountries = allowedCountries
    }
}

public struct SessionShippingCost: Codable, Sendable {
    /// Total shipping cost before any discounts or taxes are applied.
    public var amountSubtotal: Int?
    /// Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
    public var amountTax: Int?
    /// Total shipping cost after discounts and taxes are applied.
    public var amountTotal: Int?
    /// The ID of the ShippingRate for this order.
    @Expandable<ShippingRate> public var shippingRate: String?
    /// The taxes applied to the shipping rate. This field is not included by default. To include it in the response, expand the `taxes` field.
    public var taxes: [SessionShippingCostTaxes]?
    
    public init(amountSubtotal: Int? = nil,
                amountTax: Int? = nil,
                amountTotal: Int? = nil,
                shippingRate: String? = nil,
                taxes: [SessionShippingCostTaxes]? = nil) {
        self.amountSubtotal = amountSubtotal
        self.amountTax = amountTax
        self.amountTotal = amountTotal
        self._shippingRate = Expandable(id: shippingRate)
        self.taxes = taxes
    }
}

public struct SessionShippingCostTaxes: Codable, Sendable {
    /// Amount of tax applied for this rate.
    public var amount: Int?
    /// The tax rate applied.
    public var rate: TaxRate?
    
    public init(amount: Int? = nil, rate: TaxRate? = nil) {
        self.amount = amount
        self.rate = rate
    }
}

public struct SessionShippingOption: Codable, Sendable {
    /// A non-negative integer in cents representing how much to charge.
    public var shippingAmount: Int?
    /// The shipping rate.
    @Expandable<ShippingRate> public var shippingRate: String?
    
    public init(shippingAmount: Int? = nil, shippingRate: String? = nil) {
        self.shippingAmount = shippingAmount
        self._shippingRate = Expandable(id: shippingRate)
    }
}

public enum SessionSubmitType: String, Codable, Sendable {
    case auto
    case book
    case donate
    case pay
    case subscribe
}

public enum SessionStatus: String, Codable, Sendable {
    /// The checkout session is still in progress. Payment processing has not started
    case open
    /// The checkout session is complete. Payment processing may still be in progress
    case complete
    /// The checkout session has expired. No further processing will occur
    case expired
}

public struct SessionTotalDetails: Codable, Sendable {
    /// This is the sum of all the line item discounts.
    public var amountDiscount: Int?
    /// This is the sum of all the line item shipping amounts.
    public var amountShipping: Int?
    /// This is the sum of all the line item tax amounts.
    public var amountTax: Int?
    /// Breakdown of individual tax and discount amounts that add up to the totals. This field is not included by default. To include it in the response, expand the breakdown field.
    public var breakdown: SessionTotalDetailsBreakdown?
    
    public init(amountDiscount: Int? = nil,
                amountShipping: Int? = nil,
                amountTax: Int? = nil,
                breakdown: SessionTotalDetailsBreakdown? = nil) {
        self.amountDiscount = amountDiscount
        self.amountShipping = amountShipping
        self.amountTax = amountTax
        self.breakdown = breakdown
    }
}

public struct SessionTotalDetailsBreakdown: Codable, Sendable {
    /// The aggregated discounts.
    public var discounts: [SessionTotalDetailsBreakdownDiscount]?
    /// The aggregated tax amounts by rate.
    public var taxes: [SessionTotalDetailsBreakdownTax]?
}

public struct SessionTotalDetailsBreakdownDiscount: Codable, Sendable {
    /// The amount discounted.
    public var amount: Int?
    /// The discount applied.
    public var discount: Discount?
    
    public init(amount: Int? = nil, discount: Discount? = nil) {
        self.amount = amount
        self.discount = discount
    }
}

public struct SessionTotalDetailsBreakdownTax: Codable, Sendable {
    /// Amount of tax applied for this rate.
    public var amount: Int?
    /// The tax rate applied.
    public var rate: TaxRate?
    
    public init(amount: Int? = nil, rate: TaxRate? = nil) {
        self.amount = amount
        self.rate = rate
    }
}

public enum SessionPaymentStatus: String, Codable, Sendable {
    /// The payment funds are available in your account.
    case paid
    /// The payment funds are not yet available in your account.
    case unpaid
    /// The Checkout Session is in setup mode and doesn’t require a payment at this time.
    case noPaymentRequired = "no_payment_required"
}

public struct SessionTaxIdCollection: Codable, Sendable {
    /// Indicates whether tax ID collection is enabled for the session
    public var enabled: Bool?
    
    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

// MARK: Adaptive Pricing
public struct SessionAdaptivePricing: Codable, Sendable {
    /// Whether Adaptive Pricing is enabled.
    public var enabled: Bool?

    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

// MARK: Branding Settings
public struct SessionBrandingSettings: Codable, Sendable {
    /// A hex color value starting with `#` representing the background color for the Checkout Session.
    public var backgroundColor: String?
    /// The border style for the Checkout Session.
    public var borderStyle: String?
    /// A hex color value starting with `#` representing the button color for the Checkout Session.
    public var buttonColor: String?
    /// The display name shown on the Checkout Session.
    public var displayName: String?
    /// The font family for the Checkout Session.
    public var fontFamily: String?
    /// The icon for the Checkout Session.
    public var icon: SessionBrandingSettingsImage?
    /// The logo for the Checkout Session.
    public var logo: SessionBrandingSettingsImage?

    public init(backgroundColor: String? = nil,
                borderStyle: String? = nil,
                buttonColor: String? = nil,
                displayName: String? = nil,
                fontFamily: String? = nil,
                icon: SessionBrandingSettingsImage? = nil,
                logo: SessionBrandingSettingsImage? = nil) {
        self.backgroundColor = backgroundColor
        self.borderStyle = borderStyle
        self.buttonColor = buttonColor
        self.displayName = displayName
        self.fontFamily = fontFamily
        self.icon = icon
        self.logo = logo
    }
}

public struct SessionBrandingSettingsImage: Codable, Sendable {
    /// The type of image.
    public var type: String?
    /// The ID of a File upload.
    public var file: String?
    /// The URL of the image.
    public var url: String?

    public init(type: String? = nil, file: String? = nil, url: String? = nil) {
        self.type = type
        self.file = file
        self.url = url
    }
}

// MARK: Collected Information
public struct SessionCollectedInformation: Codable, Sendable {
    /// The business name collected during the session.
    public var businessName: String?
    /// The individual name collected during the session.
    public var individualName: String?
    /// Shipping information for this Checkout Session.
    public var shippingDetails: ShippingLabel?

    public init(businessName: String? = nil,
                individualName: String? = nil,
                shippingDetails: ShippingLabel? = nil) {
        self.businessName = businessName
        self.individualName = individualName
        self.shippingDetails = shippingDetails
    }
}

// MARK: Discounts
public struct SessionDiscount: Codable, Sendable {
    /// Coupon attached to the Checkout Session.
    @Expandable<Coupon> public var coupon: String?
    /// Promotion code attached to the Checkout Session.
    @Expandable<PromotionCode> public var promotionCode: String?

    public init(coupon: String? = nil, promotionCode: String? = nil) {
        self._coupon = Expandable(id: coupon)
        self._promotionCode = Expandable(id: promotionCode)
    }
}

// MARK: Managed Payments
public struct SessionManagedPayments: Codable, Sendable {
    /// Whether Managed Payments is enabled for this Checkout Session.
    public var enabled: Bool?

    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

// MARK: Name Collection
public struct SessionNameCollection: Codable, Sendable {
    /// Settings for collecting the customer's business name.
    public var business: SessionNameCollectionBusiness?
    /// Settings for collecting the customer's individual name.
    public var individual: SessionNameCollectionIndividual?

    public init(business: SessionNameCollectionBusiness? = nil,
                individual: SessionNameCollectionIndividual? = nil) {
        self.business = business
        self.individual = individual
    }
}

public struct SessionNameCollectionBusiness: Codable, Sendable {
    /// Indicates whether business name collection is enabled for the session.
    public var enabled: Bool?
    /// Whether the customer is required to provide a business name before completing the Checkout Session. Defaults to `false`.
    public var optional: Bool?

    public init(enabled: Bool? = nil, optional: Bool? = nil) {
        self.enabled = enabled
        self.optional = optional
    }
}

public struct SessionNameCollectionIndividual: Codable, Sendable {
    /// Indicates whether individual name collection is enabled for the session.
    public var enabled: Bool?
    /// Whether the customer is required to provide their name before completing the Checkout Session. Defaults to `false`.
    public var optional: Bool?

    public init(enabled: Bool? = nil, optional: Bool? = nil) {
        self.enabled = enabled
        self.optional = optional
    }
}

// MARK: Optional Items
public struct SessionOptionalItem: Codable, Sendable {
    /// Settings for the adjustable quantity behavior for this optional item.
    public var adjustableQuantity: SessionOptionalItemAdjustableQuantity?
    /// The ID of the Price used to generate this optional item.
    public var price: String?
    /// The quantity of the optional item being purchased.
    public var quantity: Int?

    public init(adjustableQuantity: SessionOptionalItemAdjustableQuantity? = nil,
                price: String? = nil,
                quantity: Int? = nil) {
        self.adjustableQuantity = adjustableQuantity
        self.price = price
        self.quantity = quantity
    }
}

public struct SessionOptionalItemAdjustableQuantity: Codable, Sendable {
    /// Set to `true` if the quantity can be adjusted to any non-negative integer.
    public var enabled: Bool?
    /// The maximum quantity of this item the customer can purchase.
    public var maximum: Int?
    /// The minimum quantity of this item the customer must purchase, if they choose to purchase it.
    public var minimum: Int?

    public init(enabled: Bool? = nil, maximum: Int? = nil, minimum: Int? = nil) {
        self.enabled = enabled
        self.maximum = maximum
        self.minimum = minimum
    }
}

// MARK: Origin Context
public enum SessionOriginContext: String, Codable, Sendable {
    case mobileApp = "mobile_app"
    case web
}

// MARK: Payment Method Configuration Details
public struct SessionPaymentMethodConfigurationDetails: Codable, Sendable {
    /// ID of the payment method configuration used.
    public var id: String?
    /// ID of the parent payment method configuration used.
    public var parent: String?

    public init(id: String? = nil, parent: String? = nil) {
        self.id = id
        self.parent = parent
    }
}

// MARK: Permissions
public struct SessionPermissions: Codable, Sendable {
    /// Determines which entity is allowed to update the shipping details.
    public var updateShippingDetails: String?

    public init(updateShippingDetails: String? = nil) {
        self.updateShippingDetails = updateShippingDetails
    }
}

// MARK: Presentment Details
public struct SessionPresentmentDetails: Codable, Sendable {
    /// Amount intended to be collected by this payment, denominated in `presentment_currency`.
    public var presentmentAmount: Int?
    /// Currency presented to the customer during payment.
    public var presentmentCurrency: Currency?

    public init(presentmentAmount: Int? = nil, presentmentCurrency: Currency? = nil) {
        self.presentmentAmount = presentmentAmount
        self.presentmentCurrency = presentmentCurrency
    }
}

// MARK: Redirect On Completion
public enum SessionRedirectOnCompletion: String, Codable, Sendable {
    /// The Session will always redirect to the `return_url` after successful confirmation.
    case always
    /// The Session will only redirect to the `return_url` after a redirect-based payment method is used.
    case ifRequired = "if_required"
    /// The Session will never redirect to the `return_url`, and redirect-based payment methods will be disabled.
    case never
}

// MARK: Saved Payment Method Options
public struct SessionSavedPaymentMethodOptions: Codable, Sendable {
    /// Uses the `allow_redisplay` value of each saved payment method to filter the list of payment methods.
    public var allowRedisplayFilters: [String]?
    /// Enable customers to choose if they wish to remove their saved payment methods.
    public var paymentMethodRemove: String?
    /// Enable customers to choose if they wish to save their payment method for future use.
    public var paymentMethodSave: String?

    public init(allowRedisplayFilters: [String]? = nil,
                paymentMethodRemove: String? = nil,
                paymentMethodSave: String? = nil) {
        self.allowRedisplayFilters = allowRedisplayFilters
        self.paymentMethodRemove = paymentMethodRemove
        self.paymentMethodSave = paymentMethodSave
    }
}

// MARK: UI Mode
public enum SessionUIMode: String, Codable, Sendable {
    /// The Checkout Session will be displayed using embedded UI.
    case embedded
    /// The Checkout Session will be displayed as a hosted page that the customer is redirected to.
    case hosted = "hosted_page"
    /// The Checkout Session will be displayed using embedded components on your website.
    case custom
}

public struct SessionList: Codable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [Session]?
    
    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [Session]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}
