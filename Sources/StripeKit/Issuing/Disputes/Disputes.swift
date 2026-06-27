//
//  Disputes.swift
//  Stripe
//
//  Created by Andrew Edwards on 5/29/19.
//

import Foundation

/// The [Dispte Object](https://stripe.com/docs/api/issuing/disputes/object)
public struct IssuingDispute: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// Disputed amount. Usually the amount of the `disputed_transaction`, but can differ (usually because of currency fluctuation or because only part of the order is disputed).
    public var amount: Int?
    /// List of balance transactions associated with the dispute. This field is not included by default. To include it in the response, expand the `balance_transactions` field.
    public var balanceTransactions: [BalanceTransaction]?
    /// The currency the disputed_transaction was made in.
    public var currency: Currency?
    /// Evidence related to the dispute. This hash will contain exactly one non-null value, containing an evidence object that matches its `reason`
    public var evidence: IssuingDisputeEvidence?
    /// The enum that describes the dispute loss outcome. If the dispute is not lost, this field will be absent. New enum values may be added in the future, so be sure to handle unknown values.
    public var lossReason: IssuingDisputeLossReason?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to metadata.
    public var metadata: [String: String]?
    /// Current status of dispute. One of `unsubmitted`, `under_review`, `won`, or `lost`.
    public var status: IssuingDisputeStatus?
    /// The transaction being disputed.
    @Expandable<Transaction> public var transaction: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    
    public init(id: String,
                amount: Int? = nil,
                balanceTransactions: [BalanceTransaction]? = nil,
                currency: Currency? = nil,
                evidence: IssuingDisputeEvidence? = nil,
                lossReason: IssuingDisputeLossReason? = nil,
                metadata: [String : String]? = nil,
                status: IssuingDisputeStatus? = nil,
                transaction: String? = nil,
                object: String,
                created: Date,
                livemode: Bool? = nil) {
        self.id = id
        self.amount = amount
        self.balanceTransactions = balanceTransactions
        self.currency = currency
        self.evidence = evidence
        self.lossReason = lossReason
        self.metadata = metadata
        self.status = status
        self._transaction = Expandable(id: transaction)
        self.object = object
        self.created = created
        self.livemode = livemode
    }
}

public struct IssuingDisputeList: Codable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [IssuingDispute]?
    
    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [IssuingDispute]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}

public struct IssuingDisputeEvidence: Codable {
    /// Evidence provided when `reason` is `‘canceled’`.
    public var canceled: IssuingDisputeEvidenceCanceled?
    /// Evidence provided when `reason` is `‘duplicate’`.
    public var duplicate: IssuingDisputeEvidenceDuplicate?
    /// Evidence to support a fraudulent dispute. This will only be present if your dispute’s `reason` is `fraudulent`.
    public var fraudulent: IssuingDisputeEvidenceFraudulent?
    /// Evidence provided when `reason` is `‘merchandise_not_as_described'`.
    public var merchandiseNotAsDescribed: IssuingDisputeEvidenceMerchandiseNotAsDescribed?
    /// Evidence provided when `reason` is `‘no_valid_authorization’`.
    public var noValidAuthorization: IssuingDisputeEvidenceNoValidAuthorization?
    /// Evidence provided when `reason` is `‘not_received’`.
    public var notReceived: IssuingDisputeEvidenceNotReceived?
    /// Evidence to support an uncategorized dispute. This will only be present if your dispute’s `reason` is `other`.
    public var other: IssuingDisputeEvidenceOther?
    /// The reason for filing the dispute. Its value will match the field containing the evidence.
    public var reason: IssuingDisputeEvidenceReason?
    /// Evidence provided when `reason` is `‘service_not_as_described’`.
    public var serviceNotAsDescribed: IssuingDisputeEvidenceServiceNotAsDescribed?
}

public struct IssuingDisputeEvidenceCanceled: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// Date when order was canceled.
    public var canceledAt: Date?
    /// Whether the cardholder was provided with a cancellation policy.
    public var cancellationPolicyProvided: Bool?
    /// Reason for canceling the order.
    public var cancellationReason: String?
    /// Date when the cardholder expected to receive the product.
    public var expectedAt: Date?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?
    /// Description of the merchandise or service that was purchased.
    public var productDescription: String?
    /// Whether the product was a merchandise or service.
    public var productType: IssuingDisputeEvidenceCanceledProductType?
    /// Result of cardholder’s attempt to return the product.
    public var returnStatus: IssuingDisputeEvidenceCanceledReturnStatus?
    /// Date when the product was returned or attempted to be returned.
    public var returnedAt: Date?
    
    public init(additionalDocumentation: String? = nil,
                canceledAt: Date? = nil,
                cancellationPolicyProvided: Bool? = nil,
                cancellationReason: String? = nil,
                expectedAt: Date? = nil,
                explanation: String? = nil,
                productDescription: String? = nil,
                productType: IssuingDisputeEvidenceCanceledProductType? = nil,
                returnStatus: IssuingDisputeEvidenceCanceledReturnStatus? = nil,
                returnedAt: Date? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self.canceledAt = canceledAt
        self.cancellationPolicyProvided = cancellationPolicyProvided
        self.cancellationReason = cancellationReason
        self.expectedAt = expectedAt
        self.explanation = explanation
        self.productDescription = productDescription
        self.productType = productType
        self.returnStatus = returnStatus
        self.returnedAt = returnedAt
    }
}

public enum IssuingDisputeEvidenceCanceledProductType: String, Codable {
    /// Tangible goods such as groceries and furniture.
    case merchandise
    /// Intangible goods such as domain name registration, flights and lessons.
    case service
}

public enum IssuingDisputeEvidenceCanceledReturnStatus: String, Codable {
    /// The merchant accepted the return.
    case successful
    /// The merchant rejected the return.
    case merchantRejected = "merchant_rejected"
}

public struct IssuingDisputeEvidenceDuplicate: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// (ID of a file upload) Copy of the card statement showing that the product had already been paid for.
    @Expandable<File> public var cardStatement: String?
    /// (ID of a file upload) Copy of the receipt showing that the product had been paid for in cash.
    @Expandable<File> public var cashReceipt: String?
    /// (ID of a file upload) Image of the front and back of the check that was used to pay for the product.
    @Expandable<File> public var checkImage: String?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?
    /// Transaction (e.g., ipi...) that the disputed transaction is a duplicate of. Of the two or more transactions that are copies of each other, this is original undisputed one.
    public var originalTransaction: String?
    
    public init(additionalDocumentation: String? = nil,
                cardStatement: String? = nil,
                cashReceipt: String? = nil,
                checkImage: String? = nil,
                explanation: String? = nil,
                originalTransaction: String? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self._cardStatement = Expandable(id: cardStatement)
        self._cashReceipt = Expandable(id: cashReceipt)
        self._checkImage = Expandable(id: checkImage)
        self.explanation = explanation
        self.originalTransaction = originalTransaction
    }
}

public struct IssuingDisputeEvidenceFraudulent: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?
    
    public init(additionalDocumentation: String? = nil, explanation: String? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self.explanation = explanation
    }
}

public struct IssuingDisputeEvidenceMerchandiseNotAsDescribed: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?
    /// Date when the product was received.
    public var receivedAt: Date?
    /// Description of the cardholder’s attempt to return the product.
    public var returnDescription: String?
    /// Result of cardholder’s attempt to return the product.
    public var returnStatus: IssuingDisputeEvidenceMerchandiseNotAsDescribedReturnStatus?
    /// Date when the product was returned or attempted to be returned.
    public var returnedAt: Date?
    
    public init(additionalDocumentation: String? = nil,
                explanation: String? = nil,
                receivedAt: Date? = nil,
                returnDescription: String? = nil,
                returnStatus: IssuingDisputeEvidenceMerchandiseNotAsDescribedReturnStatus? = nil,
                returnedAt: Date? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self.explanation = explanation
        self.receivedAt = receivedAt
        self.returnDescription = returnDescription
        self.returnStatus = returnStatus
        self.returnedAt = returnedAt
    }
}

public enum IssuingDisputeEvidenceMerchandiseNotAsDescribedReturnStatus: String, Codable {
    /// The merchant accepted the return.
    case successful
    /// The merchant rejected the return.
    case merchantRejected = "merchant_rejected"
}

public struct IssuingDisputeEvidenceNoValidAuthorization: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?

    public init(additionalDocumentation: String? = nil, explanation: String? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self.explanation = explanation
    }
}

public struct IssuingDisputeEvidenceNotReceived: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// Date when the cardholder expected to receive the product.
    public var expectedAt: Date?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?
    /// Description of the merchandise or service that was purchased.
    public var productDescription: String?
    /// Whether the product was a merchandise or service.
    public var productType: IssuingDisputeEvidenceNotReceivedProductType?
    
    public init(additionalDocumentation: String? = nil,
                expectedAt: Date? = nil,
                explanation: String? = nil,
                productDescription: String? = nil,
                productType: IssuingDisputeEvidenceNotReceivedProductType? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self.expectedAt = expectedAt
        self.explanation = explanation
        self.productDescription = productDescription
        self.productType = productType
    }
}

public enum IssuingDisputeEvidenceNotReceivedProductType: String, Codable {
    /// Tangible goods such as groceries and furniture.
    case merchandise
    /// Intangible goods such as domain name registration, flights and lessons.
    case service
}

public struct IssuingDisputeEvidenceOther: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?
    /// Description of the merchandise or service that was purchased.
    public var productDescription: String?
    /// Whether the product was a merchandise or service.
    public var productType: IssuingDisputeEvidenceOtherProductType?
    
    public init(additionalDocumentation: String? = nil,
                explanation: String? = nil,
                productDescription: String? = nil,
                productType: IssuingDisputeEvidenceOtherProductType? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self.explanation = explanation
        self.productDescription = productDescription
        self.productType = productType
    }
}

public enum IssuingDisputeEvidenceOtherProductType: String, Codable {
    /// Tangible goods such as groceries and furniture.
    case merchandise
    /// Intangible goods such as domain name registration, flights and lessons.
    case service
}

public enum IssuingDisputeEvidenceReason: String, Codable {
    /// Merchandise or service was not received.
    case notReceived = "not_received"
    /// The cardholder did not make the transaction.
    case fraudulent
    /// The transaction was not authorized by the cardholder.
    case noValidAuthorization = "no_valid_authorization"
    /// There were multiple copies of a charge for a single purchase, or the charge was paid by other means.
    case duplicate
    /// All other types of disputes.
    case other
    /// The merchandise was not as described.
    case merchandiseNotAsDescribed = "merchandise_not_as_described"
    /// The service was not as described.
    case serviceNotAsDescribed = "service_not_as_described"
    /// Service or merchandise was canceled.
    case canceled
}

public struct IssuingDisputeEvidenceServiceNotAsDescribed: Codable {
    /// (ID of a file upload) Additional documentation supporting the dispute.
    @Expandable<File> public var additionalDocumentation: String?
    /// Date when order was canceled.
    public var canceledAt: Date?
    /// Reason for canceling the order.
    public var cancellationReason: String?
    /// Explanation of why the cardholder is disputing this transaction.
    public var explanation: String?
    /// Date when the product was received.
    public var receivedAt: Date?
    
    public init(additionalDocumentation: String? = nil,
                canceledAt: Date? = nil,
                cancellationReason: String? = nil,
                explanation: String? = nil,
                receivedAt: Date? = nil) {
        self._additionalDocumentation = Expandable(id: additionalDocumentation)
        self.canceledAt = canceledAt
        self.cancellationReason = cancellationReason
        self.explanation = explanation
        self.receivedAt = receivedAt
    }
}

public enum IssuingDisputeStatus: String, Codable {
    /// The dispute is won.
    case won
    /// The dispute is lost.
    case lost
    /// The dispute has been submitted to Stripe.
    case submitted
    /// The dispute is pending submission to Stripe.
    case unsubmitted
    /// The dispute has expired.
    case expired
}

public enum IssuingDisputeLossReason: String, Codable {
    case cardholderAuthenticationIssuerLiability = "cardholder_authentication_issuer_liability"
    case eci5TokenTransactionWithTavv = "eci5_token_transaction_with_tavv"
    case excessDisputesInTimeframe = "excess_disputes_in_timeframe"
    case hasNotMetTheMinimumDisputeAmountRequirements = "has_not_met_the_minimum_dispute_amount_requirements"
    case invalidDuplicateDispute = "invalid_duplicate_dispute"
    case invalidIncorrectAmountDispute = "invalid_incorrect_amount_dispute"
    case invalidNoAuthorization = "invalid_no_authorization"
    case invalidUseOfDisputes = "invalid_use_of_disputes"
    case merchandiseDeliveredOrShipped = "merchandise_delivered_or_shipped"
    case merchandiseOrServiceAsDescribed = "merchandise_or_service_as_described"
    case notCancelled = "not_cancelled"
    case other
    case refundIssued = "refund_issued"
    case submittedBeyondAllowableTimeLimit = "submitted_beyond_allowable_time_limit"
    case transaction3dsRequired = "transaction_3ds_required"
    case transactionApprovedAfterPriorFraudDispute = "transaction_approved_after_prior_fraud_dispute"
    case transactionAuthorized = "transaction_authorized"
    case transactionElectronicallyRead = "transaction_electronically_read"
    case transactionQualifiesForVisaEasyPaymentService = "transaction_qualifies_for_visa_easy_payment_service"
    case transactionUnattended = "transaction_unattended"
}
