//
//  Dispute.swift
//  Stripe
//
//  Created by Andrew Edwards on 7/11/17.
//
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Dispute Object](https://stripe.com/docs/api/disputes/object)
public struct Dispute: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// Disputed amount. Usually the amount of the charge, but can differ (usually because of currency fluctuation or because only part of the order is disputed).
    public var amount: Int?
    /// ID of the charge that was disputed.
    @Expandable<Charge> public var charge: String?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// List of eligibility types that are included in `enhanced_evidence`.
    public var enhancedEligibilityTypes: [DisputeEnhancedEligibilityType]?
    /// Evidence provided to respond to a dispute. Updating any field in the hash will submit all fields in the hash for review.
    public var evidence: DisputeEvidence?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// ID of the PaymentIntent that was disputed.
    @Expandable<PaymentIntent> public var paymentIntent: String?
    /// Information about the payment method involved in the dispute.
    public var paymentMethodDetails: DisputePaymentMethodDetails?
    /// Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `noncompliant`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Read more about [dispute reasons](https://stripe.com/docs/disputes/categories).
    public var reason: DisputeReason?
    /// Current status of dispute. Possible values are `warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `won`, `lost`, or `prevented`.
    public var status: DisputeStatus?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// List of zero, one, or two balance transactions that show funds withdrawn and reinstated to your Stripe account as a result of this dispute.
    public var balanceTransactions: [BalanceTransaction]?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// Information about the evidence submission.
    public var evidenceDetails: DisputeEvidenceDetails?
    /// If true, it is still possible to refund the disputed payment. Once the payment has been fully refunded, no further funds will be withdrawn from your Stripe account as a result of this dispute.
    public var isChargeRefundable: Bool?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool?
    
    public init(id: String,
                amount: Int? = nil,
                charge: String? = nil,
                currency: Currency? = nil,
                enhancedEligibilityTypes: [DisputeEnhancedEligibilityType]? = nil,
                evidence: DisputeEvidence? = nil,
                metadata: [String : String]? = nil,
                paymentIntent: String? = nil,
                paymentMethodDetails: DisputePaymentMethodDetails? = nil,
                reason: DisputeReason? = nil,
                status: DisputeStatus? = nil,
                object: String,
                balanceTransactions: [BalanceTransaction]? = nil,
                created: Date,
                evidenceDetails: DisputeEvidenceDetails? = nil,
                isChargeRefundable: Bool? = nil,
                livemode: Bool? = nil) {
        self.id = id
        self.amount = amount
        self._charge = Expandable(id: charge)
        self.currency = currency
        self.enhancedEligibilityTypes = enhancedEligibilityTypes
        self.evidence = evidence
        self.metadata = metadata
        self._paymentIntent = Expandable(id: paymentIntent)
        self.paymentMethodDetails = paymentMethodDetails
        self.reason = reason
        self.status = status
        self.object = object
        self.balanceTransactions = balanceTransactions
        self.created = created
        self.evidenceDetails = evidenceDetails
        self.isChargeRefundable = isChargeRefundable
        self.livemode = livemode
    }
}

public struct DisputeEvidenceDetails: Codable, Sendable {
    /// Date by which evidence must be submitted in order to successfully challenge dispute. Will be null if the customer’s bank or credit card company doesn’t allow a response for this particular dispute.
    public var dueBy: Date?
    /// The field that the dispute will use to determine the enhanced eligibility for the dispute, if any.
    public var enhancedEligibility: DisputeEvidenceDetailsEnhancedEligibility?
    /// Whether evidence has been staged for this dispute.
    public var hasEvidence: Bool?
    /// Whether the last evidence submission was submitted past the due date. Defaults to `false` if no evidence submissions have occurred. If `true`, then delivery of the latest evidence is not guaranteed.
    public var pastDue: Bool?
    /// The number of times evidence has been submitted. Typically, you may only submit evidence once.
    public var submissionCount: Int?

    public init(dueBy: Date? = nil,
                enhancedEligibility: DisputeEvidenceDetailsEnhancedEligibility? = nil,
                hasEvidence: Bool? = nil,
                pastDue: Bool? = nil,
                submissionCount: Int? = nil) {
        self.dueBy = dueBy
        self.enhancedEligibility = enhancedEligibility
        self.hasEvidence = hasEvidence
        self.pastDue = pastDue
        self.submissionCount = submissionCount
    }
}

public struct DisputeEvidenceDetailsEnhancedEligibility: Codable, Sendable {
    /// Eligibility status for the Mastercard compliance dispute.
    public var mastercardCompliance: DisputeEvidenceDetailsEnhancedEligibilityMastercardCompliance?
    /// Eligibility status for the Visa Compelling Evidence 3.0 evidence submission.
    public var visaCompellingEvidence3: DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3?
    /// Eligibility status for the Visa compliance dispute.
    public var visaCompliance: DisputeEvidenceDetailsEnhancedEligibilityVisaCompliance?

    public init(mastercardCompliance: DisputeEvidenceDetailsEnhancedEligibilityMastercardCompliance? = nil,
                visaCompellingEvidence3: DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3? = nil,
                visaCompliance: DisputeEvidenceDetailsEnhancedEligibilityVisaCompliance? = nil) {
        self.mastercardCompliance = mastercardCompliance
        self.visaCompellingEvidence3 = visaCompellingEvidence3
        self.visaCompliance = visaCompliance
    }
}

public struct DisputeEvidenceDetailsEnhancedEligibilityMastercardCompliance: Codable, Sendable {
    /// Status of the eligibility for the Mastercard compliance dispute.
    public var status: DisputeEvidenceDetailsEnhancedEligibilityMastercardComplianceStatus?

    public init(status: DisputeEvidenceDetailsEnhancedEligibilityMastercardComplianceStatus? = nil) {
        self.status = status
    }
}

public enum DisputeEvidenceDetailsEnhancedEligibilityMastercardComplianceStatus: String, Codable, Sendable {
    case feeAcknowledged = "fee_acknowledged"
    case requiresFeeAcknowledgement = "requires_fee_acknowledgement"
}

public struct DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3: Codable, Sendable {
    /// List of actions required to qualify dispute for Visa Compelling Evidence 3.0 evidence submission.
    public var requiredActions: [DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3RequiredAction]?
    /// Visa Compelling Evidence 3.0 eligibility status.
    public var status: DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3Status?

    public init(requiredActions: [DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3RequiredAction]? = nil,
                status: DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3Status? = nil) {
        self.requiredActions = requiredActions
        self.status = status
    }
}

public enum DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3RequiredAction: String, Codable, Sendable {
    case missingCustomerIdentifiers = "missing_customer_identifiers"
    case missingDisputedTransactionDescription = "missing_disputed_transaction_description"
    case missingMerchandiseOrServices = "missing_merchandise_or_services"
    case missingPriorUndisputedTransactionDescription = "missing_prior_undisputed_transaction_description"
    case missingPriorUndisputedTransactions = "missing_prior_undisputed_transactions"
}

public enum DisputeEvidenceDetailsEnhancedEligibilityVisaCompellingEvidence3Status: String, Codable, Sendable {
    case notQualified = "not_qualified"
    case qualified
    case requiresAction = "requires_action"
}

public struct DisputeEvidenceDetailsEnhancedEligibilityVisaCompliance: Codable, Sendable {
    /// Status of the eligibility for the Visa compliance dispute.
    public var status: DisputeEvidenceDetailsEnhancedEligibilityVisaComplianceStatus?

    public init(status: DisputeEvidenceDetailsEnhancedEligibilityVisaComplianceStatus? = nil) {
        self.status = status
    }
}

public enum DisputeEvidenceDetailsEnhancedEligibilityVisaComplianceStatus: String, Codable, Sendable {
    case feeAcknowledged = "fee_acknowledged"
    case requiresFeeAcknowledgement = "requires_fee_acknowledgement"
}

public enum DisputeEnhancedEligibilityType: String, Codable, Sendable {
    case mastercardCompliance = "mastercard_compliance"
    case visaCompellingEvidence3 = "visa_compelling_evidence_3"
    case visaCompliance = "visa_compliance"
}

public struct DisputePaymentMethodDetails: Codable, Sendable {
    /// Amazon Pay specific dispute details.
    public var amazonPay: DisputePaymentMethodDetailsAmazonPay?
    /// Card specific dispute details.
    public var card: DisputePaymentMethodDetailsCard?
    /// Klarna specific dispute details.
    public var klarna: DisputePaymentMethodDetailsKlarna?
    /// PayPal specific dispute details.
    public var paypal: DisputePaymentMethodDetailsPaypal?
    /// Payment method type.
    public var type: DisputePaymentMethodDetailsType?

    public init(amazonPay: DisputePaymentMethodDetailsAmazonPay? = nil,
                card: DisputePaymentMethodDetailsCard? = nil,
                klarna: DisputePaymentMethodDetailsKlarna? = nil,
                paypal: DisputePaymentMethodDetailsPaypal? = nil,
                type: DisputePaymentMethodDetailsType? = nil) {
        self.amazonPay = amazonPay
        self.card = card
        self.klarna = klarna
        self.paypal = paypal
        self.type = type
    }
}

public struct DisputePaymentMethodDetailsAmazonPay: Codable, Sendable {
    /// The AmazonPay dispute type, chargeback or claim.
    public var disputeType: DisputePaymentMethodDetailsAmazonPayDisputeType?

    public init(disputeType: DisputePaymentMethodDetailsAmazonPayDisputeType? = nil) {
        self.disputeType = disputeType
    }
}

public enum DisputePaymentMethodDetailsAmazonPayDisputeType: String, Codable, Sendable {
    case chargeback
    case claim
}

public struct DisputePaymentMethodDetailsCard: Codable, Sendable {
    /// Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    public var brand: String?
    /// The type of dispute opened. Different case types may have varying fees and financial impact.
    public var caseType: DisputePaymentMethodDetailsCardCaseType?
    /// The card network's specific dispute reason code, which maps to one of Stripe's primary dispute categories to simplify response guidance. The [Network code map](https://stripe.com/docs/disputes/categories#network-code-map) lists all available dispute reason codes by network.
    public var networkReasonCode: String?

    public init(brand: String? = nil,
                caseType: DisputePaymentMethodDetailsCardCaseType? = nil,
                networkReasonCode: String? = nil) {
        self.brand = brand
        self.caseType = caseType
        self.networkReasonCode = networkReasonCode
    }
}

public enum DisputePaymentMethodDetailsCardCaseType: String, Codable, Sendable {
    case block
    case chargeback
    case compliance
    case inquiry
    case resolution
}

public struct DisputePaymentMethodDetailsKlarna: Codable, Sendable {
    /// The reason for the dispute as defined by Klarna.
    public var chargebackLossReasonCode: String?
    /// The reason for the dispute as defined by Klarna.
    public var reasonCode: String?

    public init(chargebackLossReasonCode: String? = nil,
                reasonCode: String? = nil) {
        self.chargebackLossReasonCode = chargebackLossReasonCode
        self.reasonCode = reasonCode
    }
}

public struct DisputePaymentMethodDetailsPaypal: Codable, Sendable {
    /// The ID of the dispute in PayPal.
    public var caseId: String?
    /// The reason for the dispute as defined by PayPal.
    public var reasonCode: String?

    public init(caseId: String? = nil,
                reasonCode: String? = nil) {
        self.caseId = caseId
        self.reasonCode = reasonCode
    }
}

public enum DisputePaymentMethodDetailsType: String, Codable, Sendable {
    case amazonPay = "amazon_pay"
    case card
    case klarna
    case paypal
}

public enum DisputeReason: String, Codable, Sendable {
    case bankCannotProcess = "bank_cannot_process"
    case checkReturned = "check_returned"
    case creditNotProcessed = "credit_not_processed"
    case customerInitiated = "customer_initiated"
    case debitNotAuthorized = "debit_not_authorized"
    case duplicate
    case fraudulent
    case general
    case incorrectAccountDetails = "incorrect_account_details"
    case insufficientFunds = "insufficient_funds"
    case noncompliant
    case productNotReceived = "product_not_received"
    case productUnacceptable = "product_unacceptable"
    case subscriptionCanceled = "subscription_canceled"
    case unrecognized
}

public enum DisputeStatus: String, Codable, Sendable {
    case warningNeedsResponse = "warning_needs_response"
    case warningUnderReview = "warning_under_review"
    case warningClosed = "warning_closed"
    case needsResponse = "needs_response"
    case underReview = "under_review"
    case won
    case lost
    case prevented
}

public struct DisputeList: Codable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [Dispute]?
}
