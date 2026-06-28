//
//  BalanceTransactionItem.swift
//  Stripe
//
//  Created by Anthony Castelli on 4/15/17.
//
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Balance Transaction Object](https://stripe.com/docs/api/balance/balance_transaction)
public struct BalanceTransaction: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Gross amount of the transaction, in cents.
    public var amount: Int?
    /// The date the transaction’s net funds will become available in the Stripe balance.
    public var availableOn: Date?
    /// The balance that this transaction impacts.
    public var balanceType: BalanceTransactionBalanceType?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// The exchange rate used, if applicable, for this transaction. Specifically, if money was converted from currency A to currency B, then the `amount` in currency A, times `exchange_rate`, would be the amount in currency B. For example, suppose you charged a customer 10.00 EUR. Then the PaymentIntent’s `amount` would be `1000` and `currency` would be `eur`. Suppose this was converted into 12.34 USD in your Stripe account. Then the BalanceTransaction’s `amount` would be `1234`, `currency` would be `usd`, and `exchange_rate` would be `1.234`.
    public var exchangeRate: Double?
    /// Fees (in cents) paid for this transaction.
    public var fee: Int?
    /// Detailed breakdown of fees (in cents) paid for this transaction.
    public var feeDetails: [BalanceTransactionFeeDetails]?
    /// Net amount of the transaction, in cents.
    public var net: Int?
    /// [Learn more](https://stripe.com/docs/reports/reporting-categories) about how reporting categories can help you understand balance transactions from an accounting perspective.
    public var reportingCategory: String?
    /// The Stripe object to which this transaction is related.
    public var source: String?
    /// If the transaction’s net funds are available in the Stripe balance yet. Either `available` or `pending`.
    public var status: BalanceTransactionStatus?
    /// Transaction type: `adjustment`, `advance`, `advance_funding`, `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_transaction`, `payment`, `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`. Learn more about balance transaction types and what they represent.
    public var type: BalanceTransactionType?
    
    public init(id: String,
                object: String,
                amount: Int? = nil,
                availableOn: Date? = nil,
                balanceType: BalanceTransactionBalanceType? = nil,
                created: Date,
                currency: Currency? = nil,
                description: String? = nil,
                exchangeRate: Double? = nil,
                fee: Int? = nil,
                feeDetails: [BalanceTransactionFeeDetails]? = nil,
                net: Int? = nil,
                reportingCategory: String? = nil,
                source: String? = nil,
                status: BalanceTransactionStatus? = nil,
                type: BalanceTransactionType? = nil) {
        self.id = id
        self.object = object
        self.amount = amount
        self.availableOn = availableOn
        self.balanceType = balanceType
        self.created = created
        self.currency = currency
        self.description = description
        self.exchangeRate = exchangeRate
        self.fee = fee
        self.feeDetails = feeDetails
        self.net = net
        self.reportingCategory = reportingCategory
        self.source = source
        self.status = status
        self.type = type
    }
}

public struct BalanceTransactionFeeDetails: Codable, Sendable {
    /// Amount of the fee, in cents.
    public var amount: Int?
    /// ID of the Connect application that earned the fee.
    public var application: String?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public var description: String?
    /// Type of the fee, one of: `application_fee`, `stripe_fee` or `tax`.
    public var type: BalanceTransactionFeeDetailsType?
    
    public init(amount: Int? = nil,
                application: String? = nil,
                currency: Currency? = nil,
                description: String? = nil,
                type: BalanceTransactionFeeDetailsType? = nil) {
        self.amount = amount
        self.application = application
        self.currency = currency
        self.description = description
        self.type = type
    }
}

public enum BalanceTransactionFeeDetailsType: String, Codable, Sendable {
    case applicationFee = "application_fee"
    case paymentMethodPassthroughFee = "payment_method_passthrough_fee"
    case stripeFee = "stripe_fee"
    case tax
    case withheldTax = "withheld_tax"
}

public enum BalanceTransactionStatus: String, Codable, Sendable {
    case available
    case pending
}

public enum BalanceTransactionBalanceType: String, Codable, Sendable {
    case issuing
    case payments
    case refundAndDisputePrefunding = "refund_and_dispute_prefunding"
    case riskReserved = "risk_reserved"
}

public enum BalanceTransactionType: String, Codable, Sendable {
    case adjustment
    case advance
    case advanceFunding = "advance_funding"
    case anticipationRepayment = "anticipation_repayment"
    case applicationFee = "application_fee"
    case applicationFeeRefund = "application_fee_refund"
    case charge
    case climateOrderPurchase = "climate_order_purchase"
    case climateOrderRefund = "climate_order_refund"
    case connectCollectionTransfer = "connect_collection_transfer"
    case contribution
    case feeCreditFunding = "fee_credit_funding"
    case inboundTransfer = "inbound_transfer"
    case inboundTransferReversal = "inbound_transfer_reversal"
    case issuingAuthorizationHold = "issuing_authorization_hold"
    case issuingAuthorizationRelease = "issuing_authorization_release"
    case issuingDispute = "issuing_dispute"
    case issuingTransaction = "issuing_transaction"
    case obligationOutbound = "obligation_outbound"
    case obligationReversalInbound = "obligation_reversal_inbound"
    case payment
    case paymentFailureRefund = "payment_failure_refund"
    case paymentNetworkReserveHold = "payment_network_reserve_hold"
    case paymentNetworkReserveRelease = "payment_network_reserve_release"
    case paymentRefund = "payment_refund"
    case paymentReversal = "payment_reversal"
    case paymentUnreconciled = "payment_unreconciled"
    case payout
    case payoutCancel = "payout_cancel"
    case payoutFailure = "payout_failure"
    case payoutMinimumBalanceHold = "payout_minimum_balance_hold"
    case payoutMinimumBalanceRelease = "payout_minimum_balance_release"
    case refund
    case refundFailure = "refund_failure"
    case reserveHold = "reserve_hold"
    case reserveRelease = "reserve_release"
    case reserveTransaction = "reserve_transaction"
    case reservedFunds = "reserved_funds"
    case stripeBalancePaymentDebit = "stripe_balance_payment_debit"
    case stripeBalancePaymentDebitReversal = "stripe_balance_payment_debit_reversal"
    case stripeFee = "stripe_fee"
    case stripeFxFee = "stripe_fx_fee"
    case taxFee = "tax_fee"
    case taxFund = "tax_fund"
    case topup
    case topupReversal = "topup_reversal"
    case transfer
    case transferCancel = "transfer_cancel"
    case transferFailure = "transfer_failure"
    case transferRefund = "transfer_refund"
}

public struct BalanceTransactionList: Codable, Sendable {
    public var object: String
    public var url: String?
    public var hasMore: Bool?
    public var data: [BalanceTransaction]?
    
    public init(object: String,
                url: String? = nil,
                hasMore: Bool? = nil,
                data: [BalanceTransaction]? = nil) {
        self.object = object
        self.url = url
        self.hasMore = hasMore
        self.data = data
    }
}
