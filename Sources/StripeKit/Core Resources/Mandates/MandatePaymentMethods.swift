//
//  MandatePaymentMethods.swift
//  
//
//  Created by Andrew Edwards on 3/7/23.
//

import Foundation

// MARK: - ACSSDebit
public struct MandatePaymentMethodDetailsACSSDebit: Codable {
    /// List of Stripe products where this mandate can be selected automatically.
    public var defaultFor: [MandatePaymentMethodDetailsACSSDebitDefaultFor]?
    /// Description of the interval. Only required if the `‘payment_schedule’` parameter is `‘interval’` or`‘combined’`.
    public var intervalDescription: String?
    /// Payment schedule for the mandate.
    public var paymentSchedule: MandatePaymentMethodDetailsACSSDebitPaymentSchedule?
    /// Transaction type of the mandate.
    public var transactionType: MandatePaymentMethodDetailsACSSDebitTransactionType?

    public init(defaultFor: [MandatePaymentMethodDetailsACSSDebitDefaultFor]? = nil,
                intervalDescription: String? = nil,
                paymentSchedule: MandatePaymentMethodDetailsACSSDebitPaymentSchedule? = nil,
                transactionType: MandatePaymentMethodDetailsACSSDebitTransactionType? = nil) {
        self.defaultFor = defaultFor
        self.intervalDescription = intervalDescription
        self.paymentSchedule = paymentSchedule
        self.transactionType = transactionType
    }
}

public enum MandatePaymentMethodDetailsACSSDebitDefaultFor: String, Codable {
    /// Enables payments for Stripe Invoices. ‘subscription’ must also be provided.
    case invoice
    /// Enables payments for Stripe Subscriptions. ‘invoice’ must also be provided.
    case subscription
}

public enum MandatePaymentMethodDetailsACSSDebitPaymentSchedule: String, Codable {
    /// Payments are initiated at a regular pre-defined interval
    case interval
    /// Payments are initiated sporadically
    case sporadic
    /// Payments can be initiated at a pre-defined interval or sporadically
    case combined
}

public enum MandatePaymentMethodDetailsACSSDebitTransactionType: String, Codable {
    /// Transactions are made for personal reasons
    case personal
    /// Transactions are made for business reasons
    case business
}

// MARK: - AUBecsDebit
public struct MandatePaymentMethodDetailsAuBecsDebit: Codable {
    /// The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
    public var url: String?
    
    public init(url: String? = nil) {
        self.url = url
    }
}

// MARK: - BacsDebit
public struct MandatePaymentMethodDetailsBacsDebit: Codable {
    /// The account name that the mandate is for, which is displayed on the bank account statement.
    public var displayName: String?
    /// The status of the mandate on the Bacs network. Can be one of  `pending`, `revoked`,`refused`, or `accepted`.
    public var networkStatus: MandatePaymentMethodDetailsBacsDebitnetworkStatus?
    /// The unique reference identifying the mandate on the Bacs network.
    public var reference: String?
    /// When the mandate is revoked on the Bacs network this field displays the reason for the revocation.
    public var revocationReason: MandatePaymentMethodDetailsBacsDebitRevocationReason?
    /// The Service User Number used by the merchant on the Bacs network.
    public var serviceUserNumber: String?
    /// The URL that will contain the mandate that the customer has signed.
    public var url: String?

    public init(displayName: String? = nil,
                networkStatus: MandatePaymentMethodDetailsBacsDebitnetworkStatus? = nil,
                reference: String? = nil,
                revocationReason: MandatePaymentMethodDetailsBacsDebitRevocationReason? = nil,
                serviceUserNumber: String? = nil,
                url: String? = nil) {
        self.displayName = displayName
        self.networkStatus = networkStatus
        self.reference = reference
        self.revocationReason = revocationReason
        self.serviceUserNumber = serviceUserNumber
        self.url = url
    }
}

public enum MandatePaymentMethodDetailsBacsDebitnetworkStatus: String, Codable {
    case pending
    case revoked
    case refused
    case accepted
}

public enum MandatePaymentMethodDetailsBacsDebitRevocationReason: String, Codable {
    case accountClosed = "account_closed"
    case bankAccountRestricted = "bank_account_restricted"
    case bankOwnershipChanged = "bank_ownership_changed"
    case couldNotProcess = "could_not_process"
    case debitNotAuthorized = "debit_not_authorized"
}

// MARK: - Blik
public struct MandatePaymentMethodDetailsBlik: Codable {
    /// Date at which the mandate expires.
    public var expiresAfter: Date?
    /// Details for off-session mandates.
    public var offSession: MandatePaymentMethodDetailsBlikOffSession?
    /// Type of the mandate.
    public var type: MandatePaymentMethodDetailsBlikType?
    
    public init(expiresAfter: Date? = nil,
                offSession: MandatePaymentMethodDetailsBlikOffSession? = nil,
                type: MandatePaymentMethodDetailsBlikType? = nil) {
        self.expiresAfter = expiresAfter
        self.offSession = offSession
        self.type = type
    }
}

public struct MandatePaymentMethodDetailsBlikOffSession: Codable {
    /// Amount of each recurring payment.
    public var amount: Int?
    /// Currency of each recurring payment.
    public var currency: Currency?
    /// Frequency interval of each recurring payment.
    public var interval: MandatePaymentMethodDetailsBlikOffSessionInterval?
    
    public init(amount: Int? = nil,
                currency: Currency? = nil,
                interval: MandatePaymentMethodDetailsBlikOffSessionInterval? = nil) {
        self.amount = amount
        self.currency = currency
        self.interval = interval
    }
}

public enum MandatePaymentMethodDetailsBlikOffSessionInterval: String, Codable {
    /// Payments recur every day.
    case day
    /// Payments recur every week.
    case week
    /// Payments recur every month.
    case month
    /// Payments recur every year.
    case year
}

public enum MandatePaymentMethodDetailsBlikType: String, Codable {
    /// Mandate for on-session payments.
    case onSession = "on_session"
    /// Mandate for off-session payments.
    case offSession = "off_session"
}

// MARK: - Card
public struct MandatePaymentMethodDetailsCard: Codable {
    public init() { }
}

// MARK: - Link
public struct MandatePaymentMethodDetailsLink: Codable {
    public init() { }
}

// MARK: - SepaDebit
public struct MandatePaymentMethodDetailsSepaDebit: Codable {
    /// The unique reference of the mandate.
    public var reference: String?
    /// The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
    public var url: String?
    
    public init(reference: String? = nil, url: String? = nil) {
        self.reference = reference
        self.url = url
    }
}

// MARK: - US Bank Account
public struct MandatePaymentMethodDetailsUsBankAccount: Codable {
    /// Mandate collection method.
    public var collectionMethod: MandatePaymentMethodDetailsUsBankAccountCollectionMethod?

    public init(collectionMethod: MandatePaymentMethodDetailsUsBankAccountCollectionMethod? = nil) {
        self.collectionMethod = collectionMethod
    }
}

public enum MandatePaymentMethodDetailsUsBankAccountCollectionMethod: String, Codable {
    case paper
}

// MARK: - Amazon Pay
public struct MandatePaymentMethodDetailsAmazonPay: Codable {
    public init() { }
}

// MARK: - Cash App
public struct MandatePaymentMethodDetailsCashapp: Codable {
    public init() { }
}

// MARK: - Kakao Pay
public struct MandatePaymentMethodDetailsKakaoPay: Codable {
    public init() { }
}

// MARK: - Klarna
public struct MandatePaymentMethodDetailsKlarna: Codable {
    public init() { }
}

// MARK: - KR Card
public struct MandatePaymentMethodDetailsKrCard: Codable {
    public init() { }
}

// MARK: - Naver Pay
public struct MandatePaymentMethodDetailsNaverPay: Codable {
    public init() { }
}

// MARK: - NZ Bank Account
public struct MandatePaymentMethodDetailsNzBankAccount: Codable {
    public init() { }
}

// MARK: - Revolut Pay
public struct MandatePaymentMethodDetailsRevolutPay: Codable {
    public init() { }
}

// MARK: - Twint
public struct MandatePaymentMethodDetailsTwint: Codable {
    public init() { }
}

// MARK: - PayPal
public struct MandatePaymentMethodDetailsPaypal: Codable {
    /// The PayPal Billing Agreement ID (BAID). This is an ID generated by PayPal which represents the mandate between the merchant and the customer.
    public var billingAgreementId: String?
    /// PayPal account PayerID. This identifier uniquely identifies the PayPal customer.
    public var payerId: String?

    public init(billingAgreementId: String? = nil, payerId: String? = nil) {
        self.billingAgreementId = billingAgreementId
        self.payerId = payerId
    }
}

// MARK: - Payto
public struct MandatePaymentMethodDetailsPayto: Codable {
    /// Amount that will be collected. It is required when `amount_type` is `fixed`.
    public var amount: Int?
    /// The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively.
    public var amountType: MandatePaymentMethodDetailsPaytoAmountType?
    /// Date, in YYYY-MM-DD format, after which payments will not be collected. Defaults to no end date.
    public var endDate: String?
    /// The periodicity at which payments will be collected.
    public var paymentSchedule: MandatePaymentMethodDetailsPaytoPaymentSchedule?
    /// The number of payments that will be made during a payment period. Defaults to 1 except for when `payment_schedule` is `adhoc`. In that case, it defaults to no limit.
    public var paymentsPerPeriod: Int?
    /// The purpose for which payments are made. Defaults to retail.
    public var purpose: MandatePaymentMethodDetailsPaytoPurpose?
    /// Date, in YYYY-MM-DD format, from which payments will be collected. Defaults to confirmation time.
    public var startDate: String?

    public init(amount: Int? = nil,
                amountType: MandatePaymentMethodDetailsPaytoAmountType? = nil,
                endDate: String? = nil,
                paymentSchedule: MandatePaymentMethodDetailsPaytoPaymentSchedule? = nil,
                paymentsPerPeriod: Int? = nil,
                purpose: MandatePaymentMethodDetailsPaytoPurpose? = nil,
                startDate: String? = nil) {
        self.amount = amount
        self.amountType = amountType
        self.endDate = endDate
        self.paymentSchedule = paymentSchedule
        self.paymentsPerPeriod = paymentsPerPeriod
        self.purpose = purpose
        self.startDate = startDate
    }
}

public enum MandatePaymentMethodDetailsPaytoAmountType: String, Codable {
    case fixed
    case maximum
}

public enum MandatePaymentMethodDetailsPaytoPaymentSchedule: String, Codable {
    case adhoc
    case annual
    case daily
    case fortnightly
    case monthly
    case quarterly
    case semiAnnual = "semi_annual"
    case weekly
}

public enum MandatePaymentMethodDetailsPaytoPurpose: String, Codable {
    case dependantSupport = "dependant_support"
    case government
    case loan
    case mortgage
    case other
    case pension
    case personal
    case retail
    case salary
    case tax
    case utility
}

// MARK: - Pix
public struct MandatePaymentMethodDetailsPix: Codable {
    /// Determines if the amount includes the IOF tax.
    public var amountIncludesIof: MandatePaymentMethodDetailsPixAmountIncludesIof?
    /// The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively.
    public var amountType: MandatePaymentMethodDetailsPixAmountType?
    /// Date, in YYYY-MM-DD format, after which payments will not be collected.
    public var endDate: String?
    /// Schedule at which the future payments will be charged.
    public var paymentSchedule: MandatePaymentMethodDetailsPixPaymentSchedule?
    /// Unique identifier for the mandate or subscription.
    public var reference: String?
    /// Date, in YYYY-MM-DD format, from which payments will be collected.
    public var startDate: String?

    public init(amountIncludesIof: MandatePaymentMethodDetailsPixAmountIncludesIof? = nil,
                amountType: MandatePaymentMethodDetailsPixAmountType? = nil,
                endDate: String? = nil,
                paymentSchedule: MandatePaymentMethodDetailsPixPaymentSchedule? = nil,
                reference: String? = nil,
                startDate: String? = nil) {
        self.amountIncludesIof = amountIncludesIof
        self.amountType = amountType
        self.endDate = endDate
        self.paymentSchedule = paymentSchedule
        self.reference = reference
        self.startDate = startDate
    }
}

public enum MandatePaymentMethodDetailsPixAmountIncludesIof: String, Codable {
    case always
    case never
}

public enum MandatePaymentMethodDetailsPixAmountType: String, Codable {
    case fixed
    case maximum
}

public enum MandatePaymentMethodDetailsPixPaymentSchedule: String, Codable {
    case halfyearly
    case monthly
    case quarterly
    case weekly
    case yearly
}

// MARK: - UPI
public struct MandatePaymentMethodDetailsUpi: Codable {
    /// The amount to be charged for future payments.
    public var amount: Int?
    /// The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively.
    public var amountType: MandatePaymentMethodDetailsUpiAmountType?
    /// A short description of the mandate, which is displayed to the customer. Maximum 20 characters.
    public var description: String?
    /// The date at which the mandate expires.
    public var endDate: Date?

    public init(amount: Int? = nil,
                amountType: MandatePaymentMethodDetailsUpiAmountType? = nil,
                description: String? = nil,
                endDate: Date? = nil) {
        self.amount = amount
        self.amountType = amountType
        self.description = description
        self.endDate = endDate
    }
}

public enum MandatePaymentMethodDetailsUpiAmountType: String, Codable {
    case fixed
    case maximum
}
