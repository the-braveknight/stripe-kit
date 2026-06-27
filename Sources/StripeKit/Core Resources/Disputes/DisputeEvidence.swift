//
//  DisputeEvidence.swift
//  Stripe
//
//  Created by Andrew Edwards on 12/7/17.
//

/// The [Dispute Evidence Object](https://stripe.com/docs/api/disputes/evidence_object)
public struct DisputeEvidence: Codable {
    /// Any server or activity logs showing proof that the customer accessed or downloaded the purchased digital product. This information should include IP addresses, corresponding timestamps, and any detailed recorded activity.
    public var accessActivityLog: String?
    /// The billing address provided by the customer.
    public var billingAddress: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your subscription cancellation policy, as shown to the customer.
    @Expandable<File> public var cancellationPolicy: String?
    /// An explanation of how and when the customer was shown your refund policy prior to purchase.
    public var cancellationPolicyDisclosure: String?
    /// A justification for why the customer’s subscription was not canceled.
    public var cancellationRebuttal: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any communication with the customer that you feel is relevant to your case. Examples include emails proving that the customer received the product or service, or demonstrating their use of or satisfaction with the product or service.
    @Expandable<File> public var customerCommunication: String?
    /// The email address of the customer.
    public var customerEmailAddress: String?
    /// The name of the customer.
    public var customerName: String?
    /// The IP address that the customer used when making the purchase.
    public var customerPurchaseIp: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A relevant document or contract showing the customer’s signature.
    @Expandable<File> public var customerSignature: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation for the prior charge that can uniquely identify the charge, such as a receipt, shipping label, work order, etc. This document should be paired with a similar document from the disputed payment that proves the two payments are separate.
    @Expandable<File> public var duplicateChargeDocumentation: String?
    /// An explanation of the difference between the disputed charge versus the prior charge that appears to be a duplicate.
    public var duplicateChargeExplanation: String?
    /// The Stripe ID for the prior charge which appears to be a duplicate of the disputed charge.
    public var duplicateChargeId: String?
    /// The enhanced evidence supplied for an eligibility type that gives the dispute a better chance of being resolved in your favor.
    public var enhancedEvidence: DisputeEvidenceEnhancedEvidence?
    /// A description of the product or service that was sold.
    public var productDescription: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any receipt or message sent to the customer notifying them of the charge.
    @Expandable<File> public var receipt: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your refund policy, as shown to the customer.
    @Expandable<File> public var refundPolicy: String?
    /// Documentation demonstrating that the customer was shown your refund policy prior to purchase.
    public var refundPolicyDisclosure: String?
    /// A justification for why the customer is not entitled to a refund.
    public var refundRefusalExplanation: String?
    /// The date on which the customer received or began receiving the purchased service, in a clear human-readable format.
    public var serviceDate: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a service was provided to the customer. This could include a copy of a signed contract, work order, or other form of written agreement.
    @Expandable<File> public var serviceDocumentation: String?
    /// The address to which a physical product was shipped. You should try to include as complete address information as possible.
    public var shippingAddress: String?
    /// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. If multiple carriers were used for this purchase, please separate them with commas.
    public var shippingCarrier: String?
    /// The date on which a physical product began its route to the shipping address, in a clear human-readable format.
    public var shippingDate: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a product was shipped to the customer at the same address the customer provided to you. This could include a copy of the shipment receipt, shipping label, etc. It should show the customer’s full shipping address, if possible.
    @Expandable<File> public var shippingDocumentation: String?
    /// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
    public var shippingTrackingNumber: String?
    /// (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any additional evidence or statements.
    @Expandable<File> public var uncategorizedFile: String?
    /// Any additional evidence or statements.
    public var uncategorizedText: String?
    
    public init(accessActivityLog: String? = nil,
                billingAddress: String? = nil,
                cancellationPolicy: String? = nil,
                cancellationPolicyDisclosure: String? = nil,
                cancellationRebuttal: String? = nil,
                customerCommunication: String? = nil,
                customerEmailAddress: String? = nil,
                customerName: String? = nil,
                customerPurchaseIp: String? = nil,
                customerSignature: String? = nil,
                duplicateChargeDocumentation: String? = nil,
                duplicateChargeExplanation: String? = nil,
                duplicateChargeId: String? = nil,
                enhancedEvidence: DisputeEvidenceEnhancedEvidence? = nil,
                productDescription: String? = nil,
                receipt: String? = nil,
                refundPolicy: String? = nil,
                refundPolicyDisclosure: String? = nil,
                refundRefusalExplanation: String? = nil,
                serviceDate: String? = nil,
                serviceDocumentation: String? = nil,
                shippingAddress: String? = nil,
                shippingCarrier: String? = nil,
                shippingDate: String? = nil,
                shippingDocumentation: String? = nil,
                shippingTrackingNumber: String? = nil,
                uncategorizedFile: String? = nil,
                uncategorizedText: String? = nil) {
        self.accessActivityLog = accessActivityLog
        self.billingAddress = billingAddress
        self._cancellationPolicy = Expandable(id: cancellationPolicy)
        self.cancellationPolicyDisclosure = cancellationPolicyDisclosure
        self.cancellationRebuttal = cancellationRebuttal
        self._customerCommunication = Expandable(id: customerCommunication)
        self.customerEmailAddress = customerEmailAddress
        self.customerName = customerName
        self.customerPurchaseIp = customerPurchaseIp
        self._customerSignature = Expandable(id: customerSignature)
        self._duplicateChargeDocumentation = Expandable(id: duplicateChargeDocumentation)
        self.duplicateChargeExplanation = duplicateChargeExplanation
        self.duplicateChargeId = duplicateChargeId
        self.enhancedEvidence = enhancedEvidence
        self.productDescription = productDescription
        self._receipt = Expandable(id: receipt)
        self._refundPolicy = Expandable(id: refundPolicy)
        self.refundPolicyDisclosure = refundPolicyDisclosure
        self.refundRefusalExplanation = refundRefusalExplanation
        self.serviceDate = serviceDate
        self._serviceDocumentation = Expandable(id: serviceDocumentation)
        self.shippingAddress = shippingAddress
        self.shippingCarrier = shippingCarrier
        self.shippingDate = shippingDate
        self._shippingDocumentation = Expandable(id: shippingDocumentation)
        self.shippingTrackingNumber = shippingTrackingNumber
        self._uncategorizedFile = Expandable(id: uncategorizedFile)
        self.uncategorizedText = uncategorizedText
    }
}

public struct DisputeEvidenceEnhancedEvidence: Codable {
    /// Evidence provided for Mastercard Compliance disputes.
    public var mastercardCompliance: DisputeEvidenceEnhancedEvidenceMastercardCompliance?
    /// Evidence provided for Visa Compelling Evidence 3.0 evidence submission.
    public var visaCompellingEvidence3: DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3?
    /// Evidence provided for Visa Compliance disputes.
    public var visaCompliance: DisputeEvidenceEnhancedEvidenceVisaCompliance?

    public init(mastercardCompliance: DisputeEvidenceEnhancedEvidenceMastercardCompliance? = nil,
                visaCompellingEvidence3: DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3? = nil,
                visaCompliance: DisputeEvidenceEnhancedEvidenceVisaCompliance? = nil) {
        self.mastercardCompliance = mastercardCompliance
        self.visaCompellingEvidence3 = visaCompellingEvidence3
        self.visaCompliance = visaCompliance
    }
}

public struct DisputeEvidenceEnhancedEvidenceMastercardCompliance: Codable {
    /// When set to true, indicates that you have submitted your acknowledgement of the Mastercard compliance dispute fee.
    public var feeAcknowledged: Bool?

    public init(feeAcknowledged: Bool? = nil) {
        self.feeAcknowledged = feeAcknowledged
    }
}

public struct DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3: Codable {
    /// Disputed transaction details for Visa Compelling Evidence 3.0 evidence submission.
    public var disputedTransaction: DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3DisputedTransaction?
    /// List of exactly two prior undisputed transaction objects for Visa Compelling Evidence 3.0 evidence submission.
    public var priorUndisputedTransactions: [DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3PriorUndisputedTransaction]?

    public init(disputedTransaction: DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3DisputedTransaction? = nil,
                priorUndisputedTransactions: [DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3PriorUndisputedTransaction]? = nil) {
        self.disputedTransaction = disputedTransaction
        self.priorUndisputedTransactions = priorUndisputedTransactions
    }
}

public struct DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3DisputedTransaction: Codable {
    /// User Account ID used to log into business platform. Must be recognizable by the user.
    public var customerAccountId: String?
    /// Unique identifier of the cardholder’s device derived from a combination of at least two hardware and software attributes. Must be at least 20 characters.
    public var customerDeviceFingerprint: String?
    /// Unique identifier of the cardholder’s device such as a device serial number (e.g., International Mobile Equipment Identity [IMEI]). Must be at least 15 characters.
    public var customerDeviceId: String?
    /// The email address of the customer.
    public var customerEmailAddress: String?
    /// The IP address that the customer used when making the purchase.
    public var customerPurchaseIp: String?
    /// Categorization of disputed payment.
    public var merchandiseOrServices: DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3MerchandiseOrServices?
    /// A description of the product or service that was sold.
    public var productDescription: String?
    /// The address to which a physical product was shipped. All fields are required for Visa Compelling Evidence 3.0 evidence submission.
    public var shippingAddress: Address?

    public init(customerAccountId: String? = nil,
                customerDeviceFingerprint: String? = nil,
                customerDeviceId: String? = nil,
                customerEmailAddress: String? = nil,
                customerPurchaseIp: String? = nil,
                merchandiseOrServices: DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3MerchandiseOrServices? = nil,
                productDescription: String? = nil,
                shippingAddress: Address? = nil) {
        self.customerAccountId = customerAccountId
        self.customerDeviceFingerprint = customerDeviceFingerprint
        self.customerDeviceId = customerDeviceId
        self.customerEmailAddress = customerEmailAddress
        self.customerPurchaseIp = customerPurchaseIp
        self.merchandiseOrServices = merchandiseOrServices
        self.productDescription = productDescription
        self.shippingAddress = shippingAddress
    }
}

public enum DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3MerchandiseOrServices: String, Codable {
    case merchandise
    case services
}

public struct DisputeEvidenceEnhancedEvidenceVisaCompellingEvidence3PriorUndisputedTransaction: Codable {
    /// Stripe charge ID for the Visa Compelling Evidence 3.0 eligible prior undisputed transaction.
    public var charge: String?
    /// User Account ID used to log into business platform. Must be recognizable by the user.
    public var customerAccountId: String?
    /// Unique identifier of the cardholder’s device derived from a combination of at least two hardware and software attributes. Must be at least 20 characters.
    public var customerDeviceFingerprint: String?
    /// Unique identifier of the cardholder’s device such as a device serial number (e.g., International Mobile Equipment Identity [IMEI]). Must be at least 15 characters.
    public var customerDeviceId: String?
    /// The email address of the customer.
    public var customerEmailAddress: String?
    /// The IP address that the customer used when making the purchase.
    public var customerPurchaseIp: String?
    /// A description of the product or service that was sold.
    public var productDescription: String?
    /// The address to which a physical product was shipped. All fields are required for Visa Compelling Evidence 3.0 evidence submission.
    public var shippingAddress: Address?

    public init(charge: String? = nil,
                customerAccountId: String? = nil,
                customerDeviceFingerprint: String? = nil,
                customerDeviceId: String? = nil,
                customerEmailAddress: String? = nil,
                customerPurchaseIp: String? = nil,
                productDescription: String? = nil,
                shippingAddress: Address? = nil) {
        self.charge = charge
        self.customerAccountId = customerAccountId
        self.customerDeviceFingerprint = customerDeviceFingerprint
        self.customerDeviceId = customerDeviceId
        self.customerEmailAddress = customerEmailAddress
        self.customerPurchaseIp = customerPurchaseIp
        self.productDescription = productDescription
        self.shippingAddress = shippingAddress
    }
}

public struct DisputeEvidenceEnhancedEvidenceVisaCompliance: Codable {
    /// When set to true, indicates that you have submitted your acknowledgement of the Visa compliance dispute fee.
    public var feeAcknowledged: Bool?

    public init(feeAcknowledged: Bool? = nil) {
        self.feeAcknowledged = feeAcknowledged
    }
}
