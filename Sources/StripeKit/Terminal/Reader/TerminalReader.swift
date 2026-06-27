//
//  TerminalReader.swift
//  StripeKit
//
//  Created by Andrew Edwards on 6/1/19.
//

import Foundation

/// The [Reader Object](https://stripe.com/docs/api/terminal/readers/object)
public struct TerminalReader: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// Type of reader, one of `bbpos_wisepad3`, `stripe_m2`, `bbpos_chipper2x`, `bbpos_wisepos_e`, `verifone_P400`, or `simulated_wisepos_e`.
    public var deviceType: String?
    /// Custom label given to the reader for easier identification.
    public var label: String?
    /// The location identifier of the reader.
    @Expandable<TerminalLocation> public var location: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Serial number of the reader.
    public var serialNumber: String?
    /// The networking status of the reader.
    public var status: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The most recent action performed by the reader.
    public var action: TerminalReaderAction?
    /// The current software version of the reader.
    public var deviceSwVersion: String?
    /// The local IP address of the reader.
    public var ipAddress: String?
    /// The last time this reader reported to Stripe backend.
    public var lastSeenAt: Int?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    
    public init(id: String,
                deviceType: String? = nil,
                label: String? = nil,
                location: String? = nil,
                metadata: [String : String]? = nil,
                serialNumber: String? = nil,
                status: String? = nil,
                object: String,
                action: TerminalReaderAction? = nil,
                deviceSwVersion: String? = nil,
                ipAddress: String? = nil,
                lastSeenAt: Int? = nil,
                livemode: Bool? = nil) {
        self.id = id
        self.deviceType = deviceType
        self.label = label
        self._location = Expandable(id: location)
        self.metadata = metadata
        self.serialNumber = serialNumber
        self.status = status
        self.object = object
        self.action = action
        self.deviceSwVersion = deviceSwVersion
        self.ipAddress = ipAddress
        self.lastSeenAt = lastSeenAt
        self.livemode = livemode
    }
}

public struct TerminalReaderAction: Codable {
    /// An error detailing why the requested action failed. Only set if status is `failed`. (Requires reader software version 2.42 or later.)
    public var apiError: TerminalReaderActionApiError?
    /// Payload required to collect inputs from the reader user. Only present if type is `collect_inputs`.
    public var collectInputs: TerminalReaderActionCollectInputs?
    /// Payload required to collect a payment method. Only present if type is `collect_payment_method`.
    public var collectPaymentMethod: TerminalReaderActionCollectPaymentMethod?
    /// Payload required to confirm a PaymentIntent. Only present if type is `confirm_payment_intent`.
    public var confirmPaymentIntent: TerminalReaderActionConfirmPaymentIntent?
    /// Failure code, only set if status is failed.
    public var failureCode: String?
    /// Detailed failure message, only set if status is failed.
    public var failureMessage: String?
    /// Payload required to print content. Only present if type is `print_content`.
    public var printContent: TerminalReaderActionPrintContent?
    /// Payload required to process a PaymentIntent. Only present if type is `process_payment_intent`.
    public var processPaymentIntent: TerminalReaderActionPaymentIntent?
    /// Payload required to process a SetupIntent. Only present if type is `process_setup_intent`.
    public var processSetupIntent: TerminalReaderActionSetupIntent?
    /// Payload required to refund a payment. Only present if type is `refund_payment`.
    public var refundPayment: TerminalReaderActionRefundPayment?
    /// Payload required to set the reader display. Only present if type is `set_reader_display`.
    public var setReaderDisplay: TerminalReaderActionSetReaderDisplay?
    /// Status of the action performed by the reader.
    public var status: TerminalReaderActionStatus?
    /// Type of action performed by the reader.
    public var type: TerminalReaderActionType?

    public init(apiError: TerminalReaderActionApiError? = nil,
                collectInputs: TerminalReaderActionCollectInputs? = nil,
                collectPaymentMethod: TerminalReaderActionCollectPaymentMethod? = nil,
                confirmPaymentIntent: TerminalReaderActionConfirmPaymentIntent? = nil,
                failureCode: String? = nil,
                failureMessage: String? = nil,
                printContent: TerminalReaderActionPrintContent? = nil,
                processPaymentIntent: TerminalReaderActionPaymentIntent? = nil,
                processSetupIntent: TerminalReaderActionSetupIntent? = nil,
                refundPayment: TerminalReaderActionRefundPayment? = nil,
                setReaderDisplay: TerminalReaderActionSetReaderDisplay? = nil,
                status: TerminalReaderActionStatus? = nil,
                type: TerminalReaderActionType? = nil) {
        self.apiError = apiError
        self.collectInputs = collectInputs
        self.collectPaymentMethod = collectPaymentMethod
        self.confirmPaymentIntent = confirmPaymentIntent
        self.failureCode = failureCode
        self.failureMessage = failureMessage
        self.printContent = printContent
        self.processPaymentIntent = processPaymentIntent
        self.processSetupIntent = processSetupIntent
        self.refundPayment = refundPayment
        self.setReaderDisplay = setReaderDisplay
        self.status = status
        self.type = type
    }
}

/// An error detailing why a reader action failed.
public struct TerminalReaderActionApiError: Codable {
    /// A short string indicating the error code reported.
    public var code: String?
    /// For card errors resulting from a card issuer decline, a short string indicating the card issuer’s reason for the decline if they provide one.
    public var declineCode: String?
    /// A URL to more information about the error code reported.
    public var docUrl: String?
    /// A human-readable message providing more details about the error.
    public var message: String?
    /// If the error is parameter-specific, the parameter related to the error.
    public var param: String?
    /// A URL to the request log entry in your dashboard.
    public var requestLogUrl: String?
    /// The type of error returned. One of `api_error`, `card_error`, `idempotency_error`, or `invalid_request_error`.
    public var type: String?

    public init(code: String? = nil,
                declineCode: String? = nil,
                docUrl: String? = nil,
                message: String? = nil,
                param: String? = nil,
                requestLogUrl: String? = nil,
                type: String? = nil) {
        self.code = code
        self.declineCode = declineCode
        self.docUrl = docUrl
        self.message = message
        self.param = param
        self.requestLogUrl = requestLogUrl
        self.type = type
    }
}

public enum TerminalReaderActionStatus: String, Codable {
    case inProgress = "in_progress"
    case succeeded
    case failed
}

public enum TerminalReaderActionType: String, Codable {
    case collectInputs = "collect_inputs"
    case collectPaymentMethod = "collect_payment_method"
    case confirmPaymentIntent = "confirm_payment_intent"
    case printContent = "print_content"
    case processPaymentIntent = "process_payment_intent"
    case processSetupIntent = "process_setup_intent"
    case setReaderDisplay = "set_reader_display"
    case refundPayment = "refund_payment"
}

public struct TerminalReaderActionPaymentIntent: Codable {
    /// Most recent PaymentIntent processed by the reader.
    @Expandable<PaymentIntent> public var paymentIntent: String?
    /// Per-transaction overrides of Terminal reader configurations.
    public var processConfig: TerminalReaderActionPaymentIntentProcessConfig?
    
    public init(paymentIntent: String? = nil,
                processConfig: TerminalReaderActionPaymentIntentProcessConfig? = nil) {
        self._paymentIntent = Expandable(id: paymentIntent)
        self.processConfig = processConfig
    }
}

public struct TerminalReaderActionPaymentIntentProcessConfig: Codable {
    /// Enable customer-initiated cancellation when processing this payment.
    public var enableCustomerCancellation: Bool?
    /// If the customer doesn't abandon authenticating the payment, they're redirected to this URL after completion.
    public var returnUrl: String?
    /// Override showing a tipping selection screen on this transaction.
    public var skipTipping: Bool?
    /// Tipping configuration for this transaction.
    public var tipping: TerminalReaderActionPaymentIntentProcessConfigTipping?

    public init(enableCustomerCancellation: Bool? = nil,
                returnUrl: String? = nil,
                skipTipping: Bool? = nil,
                tipping: TerminalReaderActionPaymentIntentProcessConfigTipping? = nil) {
        self.enableCustomerCancellation = enableCustomerCancellation
        self.returnUrl = returnUrl
        self.skipTipping = skipTipping
        self.tipping = tipping
    }
}

public struct TerminalReaderActionPaymentIntentProcessConfigTipping: Codable {
    /// Amount used to calculate tip suggestions on tipping selection screen for this transaction. Must be a positive integer in the smallest currency unit (e.g., 100 cents to represent $1.00 or 100 to represent ¥100, a zero-decimal currency).
    public var amountEligible: Int?

    public init(amountEligible: Int? = nil) {
        self.amountEligible = amountEligible
    }
}

public struct TerminalReaderActionSetupIntent: Codable {
    /// ID of a card PaymentMethod generated from the `card_present` PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.
    public var generatedCard: String?
    /// Most recent SetupIntent processed by the reader.
    @Expandable<SetupIntent> public var setupIntent: String?
    /// Per-transaction overrides of Terminal reader configurations.
    public var processConfig: TerminalReaderActionSetupIntentProcessConfig?

    public init(generatedCard: String? = nil,
                setupIntent: String? = nil,
                processConfig: TerminalReaderActionSetupIntentProcessConfig? = nil) {
        self.generatedCard = generatedCard
        self._setupIntent = Expandable(id: setupIntent)
        self.processConfig = processConfig
    }
}

public struct TerminalReaderActionSetupIntentProcessConfig: Codable {
    /// Enable customer-initiated cancellation when processing this SetupIntent.
    public var enableCustomerCancellation: Bool?

    public init(enableCustomerCancellation: Bool? = nil) {
        self.enableCustomerCancellation = enableCustomerCancellation
    }
}

public struct TerminalReaderActionRefundPayment: Codable {
    /// The amount being refunded.
    public var amount: Int?
    /// Charge that is being refunded.
    @Expandable<Charge> public var charge: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Payment intent that is being refunded.
    @Expandable<PaymentIntent> public var paymentIntent: String?
    /// The reason for the refund.
    public var reason: String?
    /// Unique identifier for the refund object.
    @Expandable<Refund> public var refund: String?
    /// Boolean indicating whether the application fee should be refunded when refunding this charge. If a full charge refund is given, the full application fee will be refunded. Otherwise, the application fee will be refunded in an amount proportional to the amount of the charge refunded. An application fee can be refunded only by the application that created the charge.
    public var refundApplicationFee: Bool?
    /// Boolean indicating whether the transfer should be reversed when refunding this charge. The transfer will be reversed proportionally to the amount being refunded (either the entire or partial amount). A transfer can be reversed only by the application that created the charge.
    public var reverseTransfer: Bool?
    /// Per-transaction overrides of Terminal reader configurations.
    public var refundPaymentConfig: TerminalReaderActionRefundPaymentConfig?

    public init(amount: Int? = nil,
                charge: String? = nil,
                metadata: [String: String]? = nil,
                paymentIntent: String? = nil,
                reason: String? = nil,
                refund: String? = nil,
                refundApplicationFee: Bool? = nil,
                reverseTransfer: Bool? = nil,
                refundPaymentConfig: TerminalReaderActionRefundPaymentConfig? = nil) {
        self.amount = amount
        self._charge = Expandable(id: charge)
        self.metadata = metadata
        self._paymentIntent = Expandable(id: paymentIntent)
        self.reason = reason
        self._refund = Expandable(id: refund)
        self.refundApplicationFee = refundApplicationFee
        self.reverseTransfer = reverseTransfer
        self.refundPaymentConfig = refundPaymentConfig
    }
}

public struct TerminalReaderActionRefundPaymentConfig: Codable {
    /// Enable customer-initiated cancellation when refunding this payment.
    public var enableCustomerCancellation: Bool?

    public init(enableCustomerCancellation: Bool? = nil) {
        self.enableCustomerCancellation = enableCustomerCancellation
    }
}

public struct TerminalReaderActionSetReaderDisplay: Codable {
    /// Cart object to be displayed by the reader.
    public var cart: TerminalReaderActionSetReaderDisplayCart?
    /// Type of information to be displayed by the reader.
    public var type: String?
    
    public init(cart: TerminalReaderActionSetReaderDisplayCart? = nil, type: String? = nil) {
        self.cart = cart
        self.type = type
    }
}

public struct TerminalReaderActionSetReaderDisplayCart: Codable {
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// List of line items in the cart.
    public var lineItems: [TerminalReaderActionSetReaderDisplayCartLineItem]?
    /// Tax amount for the entire cart. A positive integer in the smallest currency unit.
    public var tax: Int?
    /// Total amount for the entire cart, including tax. A positive integer in the smallest currency unit.
    public var total: Int?
    
    public init(currency: Currency? = nil,
                lineItems: [TerminalReaderActionSetReaderDisplayCartLineItem]? = nil,
                tax: Int? = nil,
                total: Int? = nil) {
        self.currency = currency
        self.lineItems = lineItems
        self.tax = tax
        self.total = total
    }
}

public struct TerminalReaderActionSetReaderDisplayCartLineItem: Codable {
    /// The amount of the line item. A positive integer in the smallest currency unit.
    public var amount: Int?
    /// Description of the line item.
    public var description: String?
    /// The quantity of the line item.
    public var quantity: Int?
    
    public init(amount: Int? = nil,
                description: String? = nil,
                quantity: Int? = nil) {
        self.amount = amount
        self.description = description
        self.quantity = quantity
    }
}

public struct TerminalReaderActionConfirmPaymentIntent: Codable {
    /// Most recent PaymentIntent processed by the reader.
    @Expandable<PaymentIntent> public var paymentIntent: String?
    /// Per-transaction overrides of Terminal reader configurations.
    public var confirmConfig: TerminalReaderActionConfirmPaymentIntentConfirmConfig?

    public init(paymentIntent: String? = nil,
                confirmConfig: TerminalReaderActionConfirmPaymentIntentConfirmConfig? = nil) {
        self._paymentIntent = Expandable(id: paymentIntent)
        self.confirmConfig = confirmConfig
    }
}

public struct TerminalReaderActionConfirmPaymentIntentConfirmConfig: Codable {
    /// If the customer doesn't abandon authenticating the payment, they're redirected to this URL after completion.
    public var returnUrl: String?

    public init(returnUrl: String? = nil) {
        self.returnUrl = returnUrl
    }
}

public struct TerminalReaderActionCollectPaymentMethod: Codable {
    /// Per-transaction overrides of Terminal reader configurations.
    public var collectConfig: TerminalReaderActionCollectPaymentMethodCollectConfig?
    /// Most recent PaymentIntent processed by the reader.
    @Expandable<PaymentIntent> public var paymentIntent: String?
    /// PaymentMethod objects represent your customer's payment instruments. They can be used with PaymentIntents to collect payments, or saved to Customer objects to store instrument details for future payments.
    public var paymentMethod: PaymentMethod?

    public init(collectConfig: TerminalReaderActionCollectPaymentMethodCollectConfig? = nil,
                paymentIntent: String? = nil,
                paymentMethod: PaymentMethod? = nil) {
        self.collectConfig = collectConfig
        self._paymentIntent = Expandable(id: paymentIntent)
        self.paymentMethod = paymentMethod
    }
}

public struct TerminalReaderActionCollectPaymentMethodCollectConfig: Codable {
    /// Enable customer-initiated cancellation when processing this payment.
    public var enableCustomerCancellation: Bool?
    /// Override showing a tipping selection screen on this transaction.
    public var skipTipping: Bool?
    /// Tipping configuration for this transaction.
    public var tipping: TerminalReaderActionPaymentIntentProcessConfigTipping?

    public init(enableCustomerCancellation: Bool? = nil,
                skipTipping: Bool? = nil,
                tipping: TerminalReaderActionPaymentIntentProcessConfigTipping? = nil) {
        self.enableCustomerCancellation = enableCustomerCancellation
        self.skipTipping = skipTipping
        self.tipping = tipping
    }
}

public struct TerminalReaderActionPrintContent: Codable {
    /// Image to be printed by the reader. Only present if `type` is `image`.
    public var image: TerminalReaderActionPrintContentImage?
    /// Type of content to be printed. One of `image`.
    public var type: String?

    public init(image: TerminalReaderActionPrintContentImage? = nil, type: String? = nil) {
        self.image = image
        self.type = type
    }
}

public struct TerminalReaderActionPrintContentImage: Codable {
    /// Time at which the image was created.
    public var createdAt: Date?
    /// The filename of the image (e.g. `receipt.png`).
    public var filename: String?
    /// The size of the image file in bytes.
    public var size: Int?
    /// The type of the image file.
    public var type: String?

    public init(createdAt: Date? = nil,
                filename: String? = nil,
                size: Int? = nil,
                type: String? = nil) {
        self.createdAt = createdAt
        self.filename = filename
        self.size = size
        self.type = type
    }
}

public struct TerminalReaderActionCollectInputs: Codable {
    /// List of inputs to be collected.
    public var inputs: [TerminalReaderActionCollectInputsInput]?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?

    public init(inputs: [TerminalReaderActionCollectInputsInput]? = nil,
                metadata: [String: String]? = nil) {
        self.inputs = inputs
        self.metadata = metadata
    }
}

public struct TerminalReaderActionCollectInputsInput: Codable {
    /// Default text of input being collected.
    public var customText: TerminalReaderActionCollectInputsInputCustomText?
    /// Information about a email being collected using a reader.
    public var email: TerminalReaderActionCollectInputsInputValue?
    /// Information about a number being collected using a reader.
    public var numeric: TerminalReaderActionCollectInputsInputValue?
    /// Information about a phone number being collected using a reader.
    public var phone: TerminalReaderActionCollectInputsInputValue?
    /// Indicate that this input is required, disabling the skip button.
    public var required: Bool?
    /// Information about a selection being collected using a reader.
    public var selection: TerminalReaderActionCollectInputsInputSelection?
    /// Information about a signature being collected using a reader.
    public var signature: TerminalReaderActionCollectInputsInputValue?
    /// Indicate that this input was skipped by the user.
    public var skipped: Bool?
    /// Information about text being collected using a reader.
    public var text: TerminalReaderActionCollectInputsInputValue?
    /// List of toggles being collected. Values are present if collection is complete.
    public var toggles: [TerminalReaderActionCollectInputsInputToggle]?
    /// Type of input being collected. One of `email`, `numeric`, `phone`, `selection`, `signature`, or `text`.
    public var type: String?

    public init(customText: TerminalReaderActionCollectInputsInputCustomText? = nil,
                email: TerminalReaderActionCollectInputsInputValue? = nil,
                numeric: TerminalReaderActionCollectInputsInputValue? = nil,
                phone: TerminalReaderActionCollectInputsInputValue? = nil,
                required: Bool? = nil,
                selection: TerminalReaderActionCollectInputsInputSelection? = nil,
                signature: TerminalReaderActionCollectInputsInputValue? = nil,
                skipped: Bool? = nil,
                text: TerminalReaderActionCollectInputsInputValue? = nil,
                toggles: [TerminalReaderActionCollectInputsInputToggle]? = nil,
                type: String? = nil) {
        self.customText = customText
        self.email = email
        self.numeric = numeric
        self.phone = phone
        self.required = required
        self.selection = selection
        self.signature = signature
        self.skipped = skipped
        self.text = text
        self.toggles = toggles
        self.type = type
    }
}

public struct TerminalReaderActionCollectInputsInputCustomText: Codable {
    /// Customize the default description for this input.
    public var description: String?
    /// Customize the default label for this input's skip button.
    public var skipButton: String?
    /// Customize the default label for this input's submit button.
    public var submitButton: String?
    /// Customize the default title for this input.
    public var title: String?

    public init(description: String? = nil,
                skipButton: String? = nil,
                submitButton: String? = nil,
                title: String? = nil) {
        self.description = description
        self.skipButton = skipButton
        self.submitButton = submitButton
        self.title = title
    }
}

/// A simple value (email, numeric, phone, signature or text) collected from a reader.
public struct TerminalReaderActionCollectInputsInputValue: Codable {
    /// The collected value.
    public var value: String?

    public init(value: String? = nil) {
        self.value = value
    }
}

public struct TerminalReaderActionCollectInputsInputSelection: Codable {
    /// The id of the selected choice.
    public var id: String?
    /// List of possible choices to be selected.
    public var choices: [TerminalReaderActionCollectInputsInputSelectionChoice]?
    /// The text of the selected choice.
    public var text: String?

    public init(id: String? = nil,
                choices: [TerminalReaderActionCollectInputsInputSelectionChoice]? = nil,
                text: String? = nil) {
        self.id = id
        self.choices = choices
        self.text = text
    }
}

public struct TerminalReaderActionCollectInputsInputSelectionChoice: Codable {
    /// The id to be selected.
    public var id: String?
    /// The button style for the choice. One of `primary` or `secondary`.
    public var style: String?
    /// The text to be selected.
    public var text: String?

    public init(id: String? = nil, style: String? = nil, text: String? = nil) {
        self.id = id
        self.style = style
        self.text = text
    }
}

public struct TerminalReaderActionCollectInputsInputToggle: Codable {
    /// The default value of the toggle. One of `enabled` or `disabled`.
    public var defaultValue: String?
    /// The description which will be displayed for the toggle.
    public var description: String?
    /// The title which will be displayed for the toggle.
    public var title: String?
    /// The toggle's collected value. One of `enabled` or `disabled`.
    public var value: String?

    public init(defaultValue: String? = nil,
                description: String? = nil,
                title: String? = nil,
                value: String? = nil) {
        self.defaultValue = defaultValue
        self.description = description
        self.title = title
        self.value = value
    }
}

public struct TerminalReaderList: Codable {
    public var object: String
    public var data: [TerminalReader]?
    public var hasMore: Bool?
    public var url: String?
    
    public init(object: String,
                data: [TerminalReader]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}
