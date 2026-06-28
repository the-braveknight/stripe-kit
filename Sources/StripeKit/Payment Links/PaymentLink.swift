//
//  PaymentLink.swift
//  
//
//  Created by Andrew Edwards on 5/7/23.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct PaymentLink: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// Whether the payment link’s `url` is active. If `false`, customers visiting the URL will be shown a page saying that the link has been deactivated.
    public var active: Bool?
    /// The line items representing what is being sold. This field is not included by default. To include it in the response, expand the `line_items` field.
    public var lineItems: PaymentLinkLineItemList?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The public URL that can be shared with customers.
    public var url: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Behavior after the purchase is complete.
    public var afterCompletion: PaymentLinkAfterCompletion?
    /// Whether user redeemable promotion codes are enabled.
    public var allowPromotionCodes: Bool?
    /// The ID of the Connect application that created the Payment Link.
    @Expandable<ConnectApplication> public var application: String?
    /// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner’s Stripe account.
    public var applicationFeeAmount: Int?
    /// This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner’s Stripe account.
    public var applicationFeePercent: Decimal?
    /// Configuration details for automatic tax collection.
    public var automaticTax: PaymentLinkAutomaticTax?
    /// Configuration for collecting the customer’s billing address.
    public var billingAddressCollection: PaymentLinkBillingAddressCollection?
    /// When set, provides configuration to gather active consent from customers.
    public var consentCollection: PaymentLinkConsentCollection?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// Collect additional information from your customer using custom fields. Up to 2 fields are supported.
    public var customFields: [PaymentLinkCustomField]?
    /// Display additional text for your customers using custom text.
    public var customText: PaymentLinkCustomText?
    /// Configuration for Customer creation during checkout.
    public var customerCreation: PaymentLinkCustomerCreation?
    /// The custom message to be displayed to a customer when a payment link is no longer active.
    public var inactiveMessage: String?
    /// Configuration for creating invoice for payment mode payment links.
    public var invoiceCreation: PaymentLinkInvoiceCreation?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// Settings related to Managed Payments.
    public var managedPayments: PaymentLinkManagedPayments?
    /// Details on the collection of the customer's name.
    public var nameCollection: PaymentLinkNameCollection?
    /// The account on behalf of which to charge. See the Connect documentation for details.
    @Expandable<ConnectAccount> public var onBehalfOf: String?
    /// The optional items presented to the customer at checkout.
    public var optionalItems: [PaymentLinkOptionalItem]?
    /// Indicates the parameters to be passed to PaymentIntent creation during checkout.
    public var paymentIntentData: PaymentLinkPaymentIntentData?
    /// Configuration for collecting a payment method during checkout.
    public var paymentMethodCollection: PaymentLinkPaymentMethodCollection?
    /// Payment-method-specific configuration.
    public var paymentMethodOptions: PaymentLinkPaymentMethodOptions?
    /// The list of payment method types that customers can use. When `null`, Stripe will dynamically show relevant payment methods you’ve enabled in your payment method settings.
    public var paymentMethodTypes: [String]?
    /// Controls phone number collection settings during checkout.
    public var phoneNumberCollection: PaymentLinkPhoneNumberCollection?
    /// Settings that restrict the usage of a payment link.
    public var restrictions: PaymentLinkRestrictions?
    /// Configuration for collecting the customer’s shipping address.
    public var shippingAddressCollection: PaymentLinkShippingAddressCollection?
    /// The shipping rate options applied to the session.
    public var shippingOptions: [PaymentLinkShippingOption]?
    /// Indicates the type of transaction being performed which customizes relevant text on the page, such as the submit button.
    public var submitType: PaymentLinkSubmitType?
    /// When creating a subscription, the specified configuration data will be used. There must be at least one line item with a recurring price to use `subscription_data`.
    public var subscriptionData: PaymentLinkSubscriptionData?
    /// Details on the state of tax ID collection for the payment link.
    public var taxIdCollection: PaymentLinkTaxIdCollection?
    /// The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to.
    public var transferData: PaymentLinkTransferData?
    
    public init(id: String,
                active: Bool? = nil,
                lineItems: PaymentLinkLineItemList? = nil,
                metadata: [String : String]? = nil,
                url: String? = nil,
                object: String,
                afterCompletion: PaymentLinkAfterCompletion? = nil,
                allowPromotionCodes: Bool? = nil,
                application: String? = nil,
                applicationFeeAmount: Int? = nil,
                applicationFeePercent: Decimal? = nil,
                automaticTax: PaymentLinkAutomaticTax? = nil,
                billingAddressCollection: PaymentLinkBillingAddressCollection? = nil,
                consentCollection: PaymentLinkConsentCollection? = nil,
                currency: Currency? = nil,
                customFields: [PaymentLinkCustomField]? = nil,
                customText: PaymentLinkCustomText? = nil,
                customerCreation: PaymentLinkCustomerCreation? = nil,
                inactiveMessage: String? = nil,
                invoiceCreation: PaymentLinkInvoiceCreation? = nil,
                livemode: Bool? = nil,
                managedPayments: PaymentLinkManagedPayments? = nil,
                nameCollection: PaymentLinkNameCollection? = nil,
                onBehalfOf: String? = nil,
                optionalItems: [PaymentLinkOptionalItem]? = nil,
                paymentIntentData: PaymentLinkPaymentIntentData? = nil,
                paymentMethodCollection: PaymentLinkPaymentMethodCollection? = nil,
                paymentMethodOptions: PaymentLinkPaymentMethodOptions? = nil,
                paymentMethodTypes: [String]? = nil,
                phoneNumberCollection: PaymentLinkPhoneNumberCollection? = nil,
                restrictions: PaymentLinkRestrictions? = nil,
                shippingAddressCollection: PaymentLinkShippingAddressCollection? = nil,
                shippingOptions: [PaymentLinkShippingOption]? = nil,
                submitType: PaymentLinkSubmitType? = nil,
                subscriptionData: PaymentLinkSubscriptionData? = nil,
                taxIdCollection: PaymentLinkTaxIdCollection? = nil,
                transferData: PaymentLinkTransferData? = nil) {
        self.id = id
        self.active = active
        self.lineItems = lineItems
        self.metadata = metadata
        self.url = url
        self.object = object
        self.afterCompletion = afterCompletion
        self.allowPromotionCodes = allowPromotionCodes
        self._application = Expandable(id: application)
        self.applicationFeeAmount = applicationFeeAmount
        self.applicationFeePercent = applicationFeePercent
        self.automaticTax = automaticTax
        self.billingAddressCollection = billingAddressCollection
        self.consentCollection = consentCollection
        self.currency = currency
        self.customFields = customFields
        self.customText = customText
        self.customerCreation = customerCreation
        self.inactiveMessage = inactiveMessage
        self.invoiceCreation = invoiceCreation
        self.livemode = livemode
        self.managedPayments = managedPayments
        self.nameCollection = nameCollection
        self._onBehalfOf = Expandable(id: onBehalfOf)
        self.optionalItems = optionalItems
        self.paymentIntentData = paymentIntentData
        self.paymentMethodCollection = paymentMethodCollection
        self.paymentMethodOptions = paymentMethodOptions
        self.paymentMethodTypes = paymentMethodTypes
        self.phoneNumberCollection = phoneNumberCollection
        self.restrictions = restrictions
        self.shippingAddressCollection = shippingAddressCollection
        self.shippingOptions = shippingOptions
        self.submitType = submitType
        self.subscriptionData = subscriptionData
        self.taxIdCollection = taxIdCollection
        self.transferData = transferData
    }
}

public struct PaymentLinkLineItem: Codable, Sendable {
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
    public var discounts: [PaymentLinkLineItemDiscount]?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The price used to generate the line item.
    public var price: Price?
    /// The quantity of products being purchased.
    public var quantity: Int?
    /// The taxes applied to the line item. This field is not included by default. To include it in the response, expand the `taxes` field.
    public var taxes: [PaymentLinkLineItemTax]?

    public init(id: String,
                object: String,
                amountDiscount: Int? = nil,
                amountSubtotal: Int? = nil,
                amountTax: Int? = nil,
                amountTotal: Int? = nil,
                currency: Currency? = nil,
                description: String? = nil,
                discounts: [PaymentLinkLineItemDiscount]? = nil,
                metadata: [String: String]? = nil,
                price: Price? = nil,
                quantity: Int? = nil,
                taxes: [PaymentLinkLineItemTax]? = nil) {
        self.id = id
        self.object = object
        self.amountDiscount = amountDiscount
        self.amountSubtotal = amountSubtotal
        self.amountTax = amountTax
        self.amountTotal = amountTotal
        self.currency = currency
        self.description = description
        self.discounts = discounts
        self.metadata = metadata
        self.price = price
        self.quantity = quantity
        self.taxes = taxes
    }
}

public struct PaymentLinkLineItemDiscount: Codable, Sendable {
    /// The amount discounted.
    public var amount: Int?
    /// The discount applied.
    public var discount: Discount?
    
    public init(amount: Int? = nil, discount: Discount? = nil) {
        self.amount = amount
        self.discount = discount
    }
}

public struct PaymentLinkLineItemTax: Codable, Sendable {
    /// Amount of tax applied for this rate.
    public var amount: Int?
    /// The tax rate applied.
    public var rate: TaxRate?
    
    public init(amount: Int? = nil, rate: TaxRate? = nil) {
        self.amount = amount
        self.rate = rate
    }
}

public struct PaymentLinkLineItemList: Codable, Sendable {
    /// String representing the object’s type. Objects of the same type share the same value. Always has the value `list`.
    public var object: String
    /// Details about each object.
    public var data: [PaymentLinkLineItem]?
    /// True if this list has another page of items after this one that can be fetched.
    public var hasMore: Bool?
    /// The URL where this list can be accessed.
    public var url: String?
    
    public init(object: String,
                data: [PaymentLinkLineItem]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}

public struct PaymentLinkAfterCompletion: Codable, Sendable {
    /// Configuration when `type=hosted_confirmation`
    public var hostedConfirmation: PaymentLinkAfterCompletionHostedConfirmation?
    /// Configuration when `type=redirect`
    public var redirect: PaymentLinkAfterCompletionRedirect?
    /// The specified behavior after the purchase is complete.
    public var type: PaymentLinkAfterCompletionType?
    
    public init(hostedConfirmation: PaymentLinkAfterCompletionHostedConfirmation? = nil,
                redirect: PaymentLinkAfterCompletionRedirect? = nil,
                type: PaymentLinkAfterCompletionType? = nil) {
        self.hostedConfirmation = hostedConfirmation
        self.redirect = redirect
        self.type = type
    }
}

public struct PaymentLinkAfterCompletionHostedConfirmation: Codable, Sendable {
    /// The custom message that is displayed to the customer after the purchase is complete.
    public var customMessage: String?

    public init(customMessage: String? = nil) {
        self.customMessage = customMessage
    }
}

public struct PaymentLinkAfterCompletionRedirect: Codable, Sendable {
    /// The URL the customer will be redirected to after the purchase is complete
    public var url: String?
    
    public init(url: String? = nil) {
        self.url = url
    }
}

public enum PaymentLinkAfterCompletionType: String, Codable, Sendable {
    /// Redirects the customer to the specified url after the purchase is complete.
    case redirect
    /// Displays a message on the hosted surface after the purchase is complete.
    case hostedConfirmation = "hosted_confirmation"
}

public struct PaymentLinkAutomaticTax: Codable, Sendable {
    /// If `true`, tax will be calculated automatically using the customer’s location.
    public var enabled: Bool?
    /// The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
    public var liability: PaymentLinkAutomaticTaxLiability?

    public init(enabled: Bool? = nil, liability: PaymentLinkAutomaticTaxLiability? = nil) {
        self.enabled = enabled
        self.liability = liability
    }
}

public struct PaymentLinkAutomaticTaxLiability: Codable, Sendable {
    /// The connected account being referenced when `type` is `account`.
    @Expandable<ConnectAccount> public var account: String?
    /// Type of the account referenced.
    public var type: PaymentLinkAutomaticTaxLiabilityType?

    public init(account: String? = nil, type: PaymentLinkAutomaticTaxLiabilityType? = nil) {
        self._account = Expandable(id: account)
        self.type = type
    }
}

public enum PaymentLinkAutomaticTaxLiabilityType: String, Codable, Sendable {
    /// Indicates that the account being referenced is a connected account which is liable for tax.
    case account
    /// Indicates that the account being referenced is the account making the API request.
    case `self`
}

public enum PaymentLinkBillingAddressCollection: String, Codable, Sendable {
    /// Checkout will only collect the billing address when necessary. When using `automatic_tax`, Checkout will collect the minimum number of fields required for tax calculation
    case auto
    /// Checkout will always collect the customer’s billing address.
    case `required`
}

public struct PaymentLinkConsentCollection: Codable, Sendable {
    /// Settings related to the payment method reuse text shown in the Checkout UI.
    public var paymentMethodReuseAgreement: PaymentLinkConsentCollectionPaymentMethodReuseAgreement?
    /// If set to `auto`, enables the collection of customer consent for promotional communications.
    public var promotions: String?
    /// If set to `required`, it requires cutomers to accept the terms of service before being able to pay. If set to none, customers won’t be shown a checkbox to accept the terms of service.
    public var termsOfService: String?

    public init(paymentMethodReuseAgreement: PaymentLinkConsentCollectionPaymentMethodReuseAgreement? = nil,
                promotions: String? = nil,
                termsOfService: String? = nil) {
        self.paymentMethodReuseAgreement = paymentMethodReuseAgreement
        self.promotions = promotions
        self.termsOfService = termsOfService
    }
}

public struct PaymentLinkConsentCollectionPaymentMethodReuseAgreement: Codable, Sendable {
    /// Determines the position and visibility of the payment method reuse agreement in the UI.
    public var position: PaymentLinkConsentCollectionPaymentMethodReuseAgreementPosition?

    public init(position: PaymentLinkConsentCollectionPaymentMethodReuseAgreementPosition? = nil) {
        self.position = position
    }
}

public enum PaymentLinkConsentCollectionPaymentMethodReuseAgreementPosition: String, Codable, Sendable {
    /// Uses Stripe defaults to determine the visibility and position of the payment method reuse agreement.
    case auto
    /// Hides the payment method reuse agreement.
    case hidden
}

public struct PaymentLinkCustomField: Codable, Sendable {
    /// Configuration for `type=dropdown` fields.
    public var dropdown: PaymentLinkCustomFieldDropdown?
    /// String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters.
    public var key: String?
    /// The label for the field, displayed to the customer.
    public var label: PaymentLinkCustomFieldLabel?
    /// Configuration for `type=numeric` fields.
    public var numeric: PaymentLinkCustomFieldNumeric?
    /// Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
    public var optional: Bool?
    /// Configuration for `type=text` fields.
    public var text: PaymentLinkCustomFieldText?
    /// The type of the field.
    public var type: PaymentLinkCustomFieldType?
    
    public init(dropdown: PaymentLinkCustomFieldDropdown? = nil,
                key: String? = nil,
                label: PaymentLinkCustomFieldLabel? = nil,
                numeric: PaymentLinkCustomFieldNumeric? = nil,
                optional: Bool? = nil,
                text: PaymentLinkCustomFieldText? = nil,
                type: PaymentLinkCustomFieldType? = nil) {
        self.dropdown = dropdown
        self.key = key
        self.label = label
        self.numeric = numeric
        self.optional = optional
        self.text = text
        self.type = type
    }
}

public struct PaymentLinkCustomFieldDropdown: Codable, Sendable {
    /// The value that will pre-fill the field on the payment page.
    public var defaultValue: String?
    /// The options available for the customer to select. Up to 200 options allowed
    public var options: [PaymentLinkCustomFieldDropdownOption]?
    /// The option selected by the customer. This will be the `value` for the option.
    public var value: String?

    public init(defaultValue: String? = nil,
                options: [PaymentLinkCustomFieldDropdownOption]? = nil,
                value: String? = nil) {
        self.defaultValue = defaultValue
        self.options = options
        self.value = value
    }
}

public struct PaymentLinkCustomFieldDropdownOption: Codable, Sendable {
    /// The label for the option, displayed to the customer. Up to 100 characters.
    public var label: String?
    /// The value for this option, not displayed to the customer, used by your integration to reconcile the option selected by the customer. Must be unique to this option, alphanumeric, and up to 100 characters.
    public var value: String?
    
    public init(label: String? = nil, value: String? = nil) {
        self.label = label
        self.value = value
    }
}

public struct PaymentLinkCustomFieldLabel: Codable, Sendable {
    /// Custom text for the label, displayed to the customer. Up to 50 characters.
    public var custom: String?
    ///The type of the label.
    public var type: PaymentLinkCustomFieldLabelType?
    
    public init(custom: String? = nil, type: PaymentLinkCustomFieldLabelType? = nil) {
        self.custom = custom
        self.type = type
    }
}

public enum PaymentLinkCustomFieldLabelType: String, Codable, Sendable {
    /// Set a custom label for the field.
    case custom
}

public struct PaymentLinkCustomFieldNumeric: Codable, Sendable {
    /// The value that will pre-fill the field on the payment page.
    public var defaultValue: String?
    /// The maximum character length constraint for the customer’s input.
    public var maximumLength: Int?
    /// The minimum character length requirement for the customer’s input.
    public var minimumLength: Int?
    /// The value entered by the customer, containing only digits.
    public var value: String?

    public init(defaultValue: String? = nil,
                maximumLength: Int? = nil,
                minimumLength: Int? = nil,
                value: String? = nil) {
        self.defaultValue = defaultValue
        self.maximumLength = maximumLength
        self.minimumLength = minimumLength
        self.value = value
    }
}

public struct PaymentLinkCustomFieldText: Codable, Sendable {
    /// The value that will pre-fill the field on the payment page.
    public var defaultValue: String?
    /// The maximum character length constraint for the customer’s input.
    public var maximumLength: Int?
    /// The minimum character length requirement for the customer’s input.
    public var minimumLength: Int?
    /// The value entered by the customer.
    public var value: String?

    public init(defaultValue: String? = nil,
                maximumLength: Int? = nil,
                minimumLength: Int? = nil,
                value: String? = nil) {
        self.defaultValue = defaultValue
        self.maximumLength = maximumLength
        self.minimumLength = minimumLength
        self.value = value
    }
}

public enum PaymentLinkCustomFieldType: String, Codable, Sendable {
    /// Collect a string field from your customer.
    case text
    /// Collect a numbers-only field from your customer.
    case numeric
    /// Provide a list of options for your customer to select.
    case dropdown
}

public struct PaymentLinkCustomText: Codable, Sendable {
    /// Custom text that should be displayed after the payment confirmation button.
    public var afterSubmit: PaymentLinkCustomTextAfterSubmit?
    /// Custom text that should be displayed alongside shipping address collection.
    public var shippingAddress: PaymentLinkCustomTextShippingAddress?
    /// Custom text that should be displayed alongside the payment confirmation button.
    public var submit: PaymentLinkCustomTextSubmit?
    /// Custom text that should be displayed in place of the default terms of service agreement text.
    public var termsOfServiceAcceptance: PaymentLinkCustomTextTermsOfServiceAcceptance?

    public init(afterSubmit: PaymentLinkCustomTextAfterSubmit? = nil,
                shippingAddress: PaymentLinkCustomTextShippingAddress? = nil,
                submit: PaymentLinkCustomTextSubmit? = nil,
                termsOfServiceAcceptance: PaymentLinkCustomTextTermsOfServiceAcceptance? = nil) {
        self.afterSubmit = afterSubmit
        self.shippingAddress = shippingAddress
        self.submit = submit
        self.termsOfServiceAcceptance = termsOfServiceAcceptance
    }
}

public struct PaymentLinkCustomTextAfterSubmit: Codable, Sendable {
    /// Text may be up to 1200 characters in length.
    public var message: String?

    public init(message: String? = nil) {
        self.message = message
    }
}

public struct PaymentLinkCustomTextShippingAddress: Codable, Sendable {
    /// Text may be up to 1200 characters in length.
    public var message: String?

    public init(message: String? = nil) {
        self.message = message
    }
}

public struct PaymentLinkCustomTextSubmit: Codable, Sendable {
    /// Text may be up to 1200 characters in length.
    public var message: String?

    public init(message: String? = nil) {
        self.message = message
    }
}

public struct PaymentLinkCustomTextTermsOfServiceAcceptance: Codable, Sendable {
    /// Text may be up to 1200 characters in length.
    public var message: String?

    public init(message: String? = nil) {
        self.message = message
    }
}

public enum PaymentLinkCustomerCreation: String, Codable, Sendable {
    /// The Checkout Session will only create a Customer if it is required for Session confirmation. Currently, only `subscription` mode Sessions require a Customer.
    case ifRequired = "if_required"
    /// The Checkout Session will always create a Customer when a Session confirmation is attempted.
    case always
}
public struct PaymentLinkInvoiceCreation: Codable, Sendable {
    /// Indicates whether invoice creation is enabled for the Checkout Session.
    public var enabled: Bool?
    /// Parameters passed when creating invoices for payment-mode Checkout Sessions.
    public var invoiceData: PaymentLinkInvoiceCreationInvoiceData?
    
    public init(enabled: Bool? = nil, invoiceData: PaymentLinkInvoiceCreationInvoiceData? = nil) {
        self.enabled = enabled
        self.invoiceData = invoiceData
    }
}

public struct PaymentLinkInvoiceCreationInvoiceData: Codable, Sendable {
    /// The account tax IDs associated with the invoice
    @ExpandableCollection<TaxID> public var accountTaxIds: [String]?
    /// Custom fields displayed on the invoice.
    public var customFields: [PaymentLinkInvoiceCreationInvoiceDataCustomFields]?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// Footer displayed on the invoice.
    public var footer: String?
    /// The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
    public var issuer: PaymentLinkInvoiceCreationInvoiceDataIssuer?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Options for invoice PDF rendering.
    public var renderingOptions: PaymentLinkInvoiceCreationInvoiceDataRenderingOptions?

    public init(accountTaxIds: [String]? = nil,
                customFields: [PaymentLinkInvoiceCreationInvoiceDataCustomFields]? = nil,
                description: String? = nil,
                footer: String? = nil,
                issuer: PaymentLinkInvoiceCreationInvoiceDataIssuer? = nil,
                metadata: [String : String]? = nil,
                renderingOptions: PaymentLinkInvoiceCreationInvoiceDataRenderingOptions? = nil) {
        self._accountTaxIds = ExpandableCollection(ids: accountTaxIds)
        self.customFields = customFields
        self.description = description
        self.footer = footer
        self.issuer = issuer
        self.metadata = metadata
        self.renderingOptions = renderingOptions
    }
}

public struct PaymentLinkInvoiceCreationInvoiceDataIssuer: Codable, Sendable {
    /// The connected account being referenced when `type` is `account`.
    @Expandable<ConnectAccount> public var account: String?
    /// Type of the account referenced.
    public var type: PaymentLinkInvoiceCreationInvoiceDataIssuerType?

    public init(account: String? = nil, type: PaymentLinkInvoiceCreationInvoiceDataIssuerType? = nil) {
        self._account = Expandable(id: account)
        self.type = type
    }
}

public enum PaymentLinkInvoiceCreationInvoiceDataIssuerType: String, Codable, Sendable {
    /// Indicates that the account being referenced is a connected account which issues the invoice.
    case account
    /// Indicates that the account being referenced is the account making the API request.
    case `self`
}

public struct PaymentLinkInvoiceCreationInvoiceDataCustomFields: Codable, Sendable {
    /// The name of the custom field.
    public var name: String?
    /// The value of the custom field.
    public var value: String?
    
    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }
}

public struct PaymentLinkInvoiceCreationInvoiceDataRenderingOptions: Codable, Sendable {
    /// How line-item prices and amounts will be displayed with respect to tax on invoice PDFs.
    public var amountTaxDisplay: String?
    /// ID of the invoice rendering template to be used for the generated invoice.
    public var template: String?

    public init(amountTaxDisplay: String? = nil, template: String? = nil) {
        self.amountTaxDisplay = amountTaxDisplay
        self.template = template
    }
}

public struct PaymentLinkPaymentIntentData: Codable, Sendable {
    /// Indicates when the funds will be captured from the customer’s account.
    public var captureMethod: PaymentLinkPaymentIntentDataCaptureMethod?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Indicates that you intend to make future payments with the payment method collected during checkout.
    public var setupFutureUsage: PaymentLinkPaymentIntentDataSetupFutureUsage?
    /// Extra information about the payment. This will appear on your customer’s statement when this payment succeeds in creating a charge.
    public var statementDescriptor: String?
    /// Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor.
    public var statementDescriptorSuffix: String?
    /// A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/connect/separate-charges-and-transfers) for details.
    public var transferGroup: String?

    public init(captureMethod: PaymentLinkPaymentIntentDataCaptureMethod? = nil,
                description: String? = nil,
                metadata: [String: String]? = nil,
                setupFutureUsage: PaymentLinkPaymentIntentDataSetupFutureUsage? = nil,
                statementDescriptor: String? = nil,
                statementDescriptorSuffix: String? = nil,
                transferGroup: String? = nil) {
        self.captureMethod = captureMethod
        self.description = description
        self.metadata = metadata
        self.setupFutureUsage = setupFutureUsage
        self.statementDescriptor = statementDescriptor
        self.statementDescriptorSuffix = statementDescriptorSuffix
        self.transferGroup = transferGroup
    }
}

public enum PaymentLinkPaymentIntentDataCaptureMethod: String, Codable, Sendable {
    /// (Default) Stripe automatically captures funds when the customer authorizes the payment.
    case automatic
    /// Stripe asynchronously captures funds when the customer authorizes the payment. Recommended over `capture_method=automatic` due to improved latency, but [may require additional integration changes](https://stripe.com/docs/payments/payment-intents/asynchronous-capture-automatic-async) .
    case automaticAsync = "automatic_async"
    /// Place a hold on the funds when the customer authorizes the payment, but [don’t capture the funds until later](https://stripe.com/docs/payments/capture-later). (Not all payment methods support this.)
    case manual
}

public enum PaymentLinkPaymentIntentDataSetupFutureUsage: String, Codable, Sendable {
    /// Use `on_session` if you intend to only reuse the payment method when your customer is present in your checkout flow.
    case onSession = "on_session"
    /// Use `off_session` if your customer may or may not be present in your checkout flow.
    case offSession = "off_session"
}

public enum PaymentLinkPaymentMethodCollection: String, Codable, Sendable {
    /// The Checkout Session will always collect a PaymentMethod.
    case always
    /// The Checkout Session will only collect a PaymentMethod if there is an amount due.
    case ifRequired = "if_required"
}

public struct PaymentLinkPhoneNumberCollection: Codable, Sendable {
    /// Indicates whether phone number collection is enabled for the session
    public var enabled: Bool
    
    public init(enabled: Bool) {
        self.enabled = enabled
    }
}

public struct PaymentLinkShippingAddressCollection: Codable, Sendable {
    /// An array of two-letter ISO country codes representing which countries Checkout should provide as options for shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI`.
    public var allowedCountries: [String]?
    
    public init(allowedCountries: [String]? = nil) {
        self.allowedCountries = allowedCountries
    }
}

public struct PaymentLinkShippingOption: Codable, Sendable {
    /// A non-negative integer in cents representing how much to charge.
    public var shippingAmount: Int?
    /// The shipping rate.
    @Expandable<ShippingRate> public var shippingRate: String?
    
    public init(shippingAmount: Int? = nil, shippingRate: String? = nil) {
        self.shippingAmount = shippingAmount
        self._shippingRate = Expandable(id: shippingRate)
    }
}

public enum PaymentLinkSubmitType: String, Codable, Sendable {
    case auto
    case book
    case donate
    case pay
    case subscribe
}

public struct PaymentLinkSubscriptionData: Codable, Sendable {
    /// The subscription’s description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription.
    public var description: String?
    /// All invoices will be billed using the specified settings.
    public var invoiceSettings: PaymentLinkSubscriptionDataInvoiceSettings?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Integer representing the number of trial period days before the customer is charged for the first time.
    public var trialPeriodDays: Int?
    /// Settings related to subscription trials.
    public var trialSettings: PaymentLinkSubscriptionDataTrialSettings?

    public init(description: String? = nil,
                invoiceSettings: PaymentLinkSubscriptionDataInvoiceSettings? = nil,
                metadata: [String: String]? = nil,
                trialPeriodDays: Int? = nil,
                trialSettings: PaymentLinkSubscriptionDataTrialSettings? = nil) {
        self.description = description
        self.invoiceSettings = invoiceSettings
        self.metadata = metadata
        self.trialPeriodDays = trialPeriodDays
        self.trialSettings = trialSettings
    }
}

public struct PaymentLinkSubscriptionDataInvoiceSettings: Codable, Sendable {
    /// The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
    public var issuer: PaymentLinkSubscriptionDataInvoiceSettingsIssuer?

    public init(issuer: PaymentLinkSubscriptionDataInvoiceSettingsIssuer? = nil) {
        self.issuer = issuer
    }
}

public struct PaymentLinkSubscriptionDataInvoiceSettingsIssuer: Codable, Sendable {
    /// The connected account being referenced when `type` is `account`.
    @Expandable<ConnectAccount> public var account: String?
    /// Type of the account referenced.
    public var type: PaymentLinkSubscriptionDataInvoiceSettingsIssuerType?

    public init(account: String? = nil, type: PaymentLinkSubscriptionDataInvoiceSettingsIssuerType? = nil) {
        self._account = Expandable(id: account)
        self.type = type
    }
}

public enum PaymentLinkSubscriptionDataInvoiceSettingsIssuerType: String, Codable, Sendable {
    /// Indicates that the account being referenced is a connected account which issues the invoice.
    case account
    /// Indicates that the account being referenced is the account making the API request.
    case `self`
}

public struct PaymentLinkSubscriptionDataTrialSettings: Codable, Sendable {
    /// Defines how the subscription should behave when the user's free trial ends.
    public var endBehavior: PaymentLinkSubscriptionDataTrialSettingsEndBehavior?

    public init(endBehavior: PaymentLinkSubscriptionDataTrialSettingsEndBehavior? = nil) {
        self.endBehavior = endBehavior
    }
}

public struct PaymentLinkSubscriptionDataTrialSettingsEndBehavior: Codable, Sendable {
    /// Indicates how the subscription should change when the trial ends if the user did not provide a payment method.
    public var missingPaymentMethod: PaymentLinkSubscriptionDataTrialSettingsEndBehaviorMissingPaymentMethod?

    public init(missingPaymentMethod: PaymentLinkSubscriptionDataTrialSettingsEndBehaviorMissingPaymentMethod? = nil) {
        self.missingPaymentMethod = missingPaymentMethod
    }
}

public enum PaymentLinkSubscriptionDataTrialSettingsEndBehaviorMissingPaymentMethod: String, Codable, Sendable {
    /// Cancel the subscription if a payment method is not attached when the trial ends.
    case cancel
    /// Create an invoice when a payment method is not attached when the trial ends.
    case createInvoice = "create_invoice"
    /// Pause the subscription if a payment method is not attached when the trial ends.
    case pause
}

public struct PaymentLinkTaxIdCollection: Codable, Sendable {
    /// Indicates whether tax ID collection is enabled for the session
    public var enabled: Bool?
    
    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

public struct PaymentLinkTransferData: Codable, Sendable {
    /// The amount in cents that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
    public var amount: Int?
    /// The connected account receiving the transfer.
    @Expandable<ConnectAccount> public var destination: String?
    
    public init(amount: Int? = nil, destination: String? = nil) {
        self.amount = amount
        self._destination = Expandable(id: destination)
    }
}

public struct PaymentLinkManagedPayments: Codable, Sendable {
    /// Whether Managed Payments is enabled for this payment link.
    public var enabled: Bool?

    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

public struct PaymentLinkNameCollection: Codable, Sendable {
    /// Controls settings applied for collecting the customer's business name on the payment page.
    public var business: PaymentLinkNameCollectionBusiness?
    /// Controls settings applied for collecting the customer's individual name on the payment page.
    public var individual: PaymentLinkNameCollectionIndividual?

    public init(business: PaymentLinkNameCollectionBusiness? = nil,
                individual: PaymentLinkNameCollectionIndividual? = nil) {
        self.business = business
        self.individual = individual
    }
}

public struct PaymentLinkNameCollectionBusiness: Codable, Sendable {
    /// Indicates whether business name collection is enabled for the session.
    public var enabled: Bool?
    /// Indicates whether business name collection is optional for the session.
    public var optional: Bool?

    public init(enabled: Bool? = nil, optional: Bool? = nil) {
        self.enabled = enabled
        self.optional = optional
    }
}

public struct PaymentLinkNameCollectionIndividual: Codable, Sendable {
    /// Indicates whether individual name collection is enabled for the session.
    public var enabled: Bool?
    /// Indicates whether individual name collection is optional for the session.
    public var optional: Bool?

    public init(enabled: Bool? = nil, optional: Bool? = nil) {
        self.enabled = enabled
        self.optional = optional
    }
}

public struct PaymentLinkOptionalItem: Codable, Sendable {
    /// Settings for the adjustable quantity behavior for this optional item.
    public var adjustableQuantity: PaymentLinkOptionalItemAdjustableQuantity?
    /// The ID of the Price used to generate this optional item.
    public var price: String?
    /// The quantity of the optional item being purchased.
    public var quantity: Int?

    public init(adjustableQuantity: PaymentLinkOptionalItemAdjustableQuantity? = nil,
                price: String? = nil,
                quantity: Int? = nil) {
        self.adjustableQuantity = adjustableQuantity
        self.price = price
        self.quantity = quantity
    }
}

public struct PaymentLinkOptionalItemAdjustableQuantity: Codable, Sendable {
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

public struct PaymentLinkPaymentMethodOptions: Codable, Sendable {
    /// Card-specific payment method options.
    public var card: PaymentLinkPaymentMethodOptionsCard?

    public init(card: PaymentLinkPaymentMethodOptionsCard? = nil) {
        self.card = card
    }
}

public struct PaymentLinkPaymentMethodOptionsCard: Codable, Sendable {
    /// Restrictions applied to the card payment method.
    public var restrictions: PaymentLinkPaymentMethodOptionsCardRestrictions?

    public init(restrictions: PaymentLinkPaymentMethodOptionsCardRestrictions? = nil) {
        self.restrictions = restrictions
    }
}

public struct PaymentLinkPaymentMethodOptionsCardRestrictions: Codable, Sendable {
    /// Specify the card brands to block in the Checkout Session.
    public var brandsBlocked: [String]?

    public init(brandsBlocked: [String]? = nil) {
        self.brandsBlocked = brandsBlocked
    }
}

public struct PaymentLinkRestrictions: Codable, Sendable {
    /// Settings for limiting the number of completed sessions on the payment link.
    public var completedSessions: PaymentLinkRestrictionsCompletedSessions?

    public init(completedSessions: PaymentLinkRestrictionsCompletedSessions? = nil) {
        self.completedSessions = completedSessions
    }
}

public struct PaymentLinkRestrictionsCompletedSessions: Codable, Sendable {
    /// The current number of checkout sessions that have been completed on the payment link which count towards the `completed_sessions` restriction to be met.
    public var count: Int?
    /// The maximum number of checkout sessions that can be completed for the `completed_sessions` restriction to be met.
    public var limit: Int?

    public init(count: Int? = nil, limit: Int? = nil) {
        self.count = count
        self.limit = limit
    }
}

public struct PaymentLinkList: Codable, Sendable {
    /// String representing the object’s type. Objects of the same type share the same value. Always has the value `list`.
    public var object: String
    /// Details about each object.
    public var data: [PaymentLink]?
    /// True if this list has another page of items after this one that can be fetched.
    public var hasMore: Bool?
    /// The URL where this list can be accessed.
    public var url: String?
    
    public init(object: String,
                data: [PaymentLink]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}
