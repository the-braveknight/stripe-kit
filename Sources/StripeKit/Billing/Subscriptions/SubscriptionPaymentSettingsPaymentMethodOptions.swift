//
//  SubscriptionPaymentSettingsPaymentMethodOptions.swift
//  
//
//  Created by Andrew Edwards on 5/13/23.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct SubscriptionPaymentSettingsPaymentMethodOptions: Codable, Sendable {
    /// If paying by `acss_debit`, this sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to the invoice’s PaymentIntent.
    public var acssDebit: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebit?
    /// If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.
    public var bancontact: SubscriptionPaymentSettingsPaymentMethodOptionsBancontact?
    /// If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.
    public var card: SubscriptionPaymentSettingsPaymentMethodOptionsCard?
    /// If paying by `customer_balance`, this sub-hash contains details about the Bank transfer payment method options to pass to the invoice’s PaymentIntent.
    public var customerBalance: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalance?
    /// If paying by `konbini`, this sub-hash contains details about the Konbini payment method options to pass to the invoice’s PaymentIntent.
    public var konbini: SubscriptionPaymentSettingsPaymentMethodOptionsKonbini?
    /// If paying by `payto`, this sub-hash contains details about the PayTo payment method options to pass to the invoice’s PaymentIntent.
    public var payto: SubscriptionPaymentSettingsPaymentMethodOptionsPayto?
    /// If paying by `pix`, this sub-hash contains details about the Pix payment method options to pass to the invoice’s PaymentIntent.
    public var pix: SubscriptionPaymentSettingsPaymentMethodOptionsPix?
    /// If paying by `sepa_debit`, this sub-hash contains details about the SEPA Direct Debit payment method options to pass to the invoice’s PaymentIntent.
    public var sepaDebit: SubscriptionPaymentSettingsPaymentMethodOptionsSepaDebit?
    /// If paying by `upi`, this sub-hash contains details about the UPI payment method options to pass to the invoice’s PaymentIntent.
    public var upi: SubscriptionPaymentSettingsPaymentMethodOptionsUpi?
    /// If paying by `us_bank_account`, this sub-hash contains details about the ACH direct debit payment method options to pass to the invoice’s PaymentIntent.
    public var usBankAccount: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccount?

    public init(acssDebit: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebit? = nil,
                bancontact: SubscriptionPaymentSettingsPaymentMethodOptionsBancontact? = nil,
                card: SubscriptionPaymentSettingsPaymentMethodOptionsCard? = nil,
                customerBalance: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalance? = nil,
                konbini: SubscriptionPaymentSettingsPaymentMethodOptionsKonbini? = nil,
                payto: SubscriptionPaymentSettingsPaymentMethodOptionsPayto? = nil,
                pix: SubscriptionPaymentSettingsPaymentMethodOptionsPix? = nil,
                sepaDebit: SubscriptionPaymentSettingsPaymentMethodOptionsSepaDebit? = nil,
                upi: SubscriptionPaymentSettingsPaymentMethodOptionsUpi? = nil,
                usBankAccount: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccount? = nil) {
        self.acssDebit = acssDebit
        self.bancontact = bancontact
        self.card = card
        self.customerBalance = customerBalance
        self.konbini = konbini
        self.payto = payto
        self.pix = pix
        self.sepaDebit = sepaDebit
        self.upi = upi
        self.usBankAccount = usBankAccount
    }
}

// MARK: ACSS Debit
public struct SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebit: Codable, Sendable {
    /// Additional fields for Mandate creation
    public var mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitManadteOptions?
    /// Bank account verification method.
    public var verificationMethod: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitVerificationMethod?
    
    public init(mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitManadteOptions? = nil,
                verificationMethod: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitVerificationMethod? = nil) {
        self.mandateOptions = mandateOptions
        self.verificationMethod = verificationMethod
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitManadteOptions: Codable, Sendable {
    /// Transaction type of the mandate.
    public var transactionType: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitManadteOptionsTransactionType?
    
    public init(transactionType: SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitManadteOptionsTransactionType? = nil) {
        self.transactionType = transactionType
    }
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitManadteOptionsTransactionType: String, Codable, Sendable {
    /// Transactions are made for personal reasons
    case personal
    /// Transactions are made for business reasons
    case business
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsAcssDebitVerificationMethod: String, Codable, Sendable {
    /// Instant verification with fallback to microdeposits.
    case automatic
    /// Instant verification.
    case instant
    /// Verification using microdeposits.
    case microdeposits
}

// MARK: Bancontact
public struct SubscriptionPaymentSettingsPaymentMethodOptionsBancontact: Codable, Sendable {
    /// Preferred language of the Bancontact authorization page that the customer is redirected to.
    public var preferredLanguage: String?
    
    public init(preferredLanguage: String? = nil) {
        self.preferredLanguage = preferredLanguage
    }
}

// MARK: Card
public struct SubscriptionPaymentSettingsPaymentMethodOptionsCard: Codable, Sendable {
    /// Installment details for this Invoice (Mexico only). For more information, see the installments integration guide.
    public var mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsCardMandateOptions?
    /// Selected network to process this Subscription on. Depends on the available networks of the card attached to the Subscription. Can be only set confirm-time.
    public var network: String?
    /// We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and other requirements. However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on manually requesting 3D Secure for more information on how this configuration interacts with Radar and our SCA Engine.
    public var requestThreeDSecure: SubscriptionPaymentSettingsPaymentMethodOptionsCardRequestThreedSecure?
    
    public init(mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsCardMandateOptions? = nil,
                network: String? = nil,
                requestThreeDSecure: SubscriptionPaymentSettingsPaymentMethodOptionsCardRequestThreedSecure? = nil) {
        self.mandateOptions = mandateOptions
        self.network = network
        self.requestThreeDSecure = requestThreeDSecure
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsCardMandateOptions: Codable, Sendable {
    /// Amount to be charged for future payments.
    public var amount: Int?
    /// One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be charged in future payments. If `maximum`, the `amount` charged can be up to the value passed for the `amount` param.
    public var amountType: SubscriptionPaymentSettingsPaymentMethodOptionsCardMandateOptionsAmountType?
    /// A description of the mandate or subscription that is meant to be displayed to the customer.
    public var description: String?

    public init(amount: Int? = nil,
                amountType: SubscriptionPaymentSettingsPaymentMethodOptionsCardMandateOptionsAmountType? = nil,
                description: String? = nil) {
        self.amount = amount
        self.amountType = amountType
        self.description = description
    }
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsCardMandateOptionsAmountType: String, Codable, Sendable {
    /// If `fixed`, the `amount` param refers to the exact amount to be charged in future payments.
    case fixed
    /// If `maximum`, the `amount` charged can be up to the value passed for the amount param.
    case maximum
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsCardRequestThreedSecure: String, Codable, Sendable {
    /// Triggers 3D Secure authentication only if it is required.
    case automatic
    /// Requires 3D Secure authentication if it is available.
    case any
    /// Requests that Stripe attempt to challenge the customer for authentication during the transaction.
    case challenge
}

// MARK: Customer Balance
public struct SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalance: Codable, Sendable {
    /// Configuration for the bank transfer funding type, if the `funding_type` is set to `bank_transfer`.
    public var bankTransfer: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransfer?
    /// The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`
    public var fundingType: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceFundingType?
    
    public init(bankTransfer: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransfer? = nil,
                fundingType: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceFundingType? = nil) {
        self.bankTransfer = bankTransfer
        self.fundingType = fundingType
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransfer: Codable, Sendable {
    /// Configuration for `eu_bank_transfer` funding type.
    public var euBankTransfer: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferEUBankTransfer?
    /// The bank transfer type that can be used for funding. Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, or `mx_bank_transfe`.
    public var type: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferType?
    
    public init(euBankTransfer: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferEUBankTransfer? = nil,
                type: SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferType? = nil) {
        self.euBankTransfer = euBankTransfer
        self.type = type
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferEUBankTransfer: Codable, Sendable {
    /// The desired country code of the bank account information. Permitted values include: `BE`, `DE`, `ES`, `FR`, `IE`, or `NL`.
    public var country: String?
    
    public init(country: String? = nil) {
        self.country = country
    }
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferType: String, Codable, Sendable {
    case euBankTransfer = "eu_bank_transfer"
    case gbBankTransfer = "gb_bank_transfer"
    case jpBankTransfer = "jp_bank_transfer"
    case mxBankTransfer = "mx_bank_transfer"
    case usBankTransfer = "us_bank_transfer"
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsCustomerBalanceFundingType: String, Codable, Sendable {
    case bankTransfer = "bank_transfer"
}

// MARK: Konbini
public struct SubscriptionPaymentSettingsPaymentMethodOptionsKonbini: Codable, Sendable {
    public init(){}
}

// MARK: US Bank Account
public struct SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccount: Codable, Sendable {
    /// Additional fields for Financial Connections Session creation
    public var financialConnections: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnections?
    /// Bank account verification method.
    public var verificationMethod: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountVerificationMethod?
    
    public init(financialConnections: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnections? = nil,
                verificationMethod: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountVerificationMethod? = nil) {
        self.financialConnections = financialConnections
        self.verificationMethod = verificationMethod
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnections: Codable, Sendable {
    /// Provide filters for the linked accounts that the customer can select for the payment method.
    public var filters: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFilters?
    /// The list of permissions to request. The `payment_method` permission must be included.
    public var permissions: [SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPermission]?
    /// Data features requested to be retrieved upon account creation.
    public var prefetch: [SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPrefetch]?

    public init(filters: SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFilters? = nil,
                permissions: [SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPermission]? = nil,
                prefetch: [SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPrefetch]? = nil) {
        self.filters = filters
        self.permissions = permissions
        self.prefetch = prefetch
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFilters: Codable, Sendable {
    /// The account subcategories to use to filter for selectable accounts. Valid subcategories are `checking` and `savings`.
    public var accountSubcategories: [SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFiltersAccountSubcategory]?

    public init(accountSubcategories: [SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFiltersAccountSubcategory]? = nil) {
        self.accountSubcategories = accountSubcategories
    }
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFiltersAccountSubcategory: String, Codable, Sendable {
    case checking
    case savings
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPermission: String, Codable, Sendable {
    /// Allows the creation of a payment method from the account.
    case paymentMethod = "payment_method"
    /// Allows accessing balance data from the account.
    case balances
    /// Allows accessing ownership data from the account.
    case ownership
    /// Allows accessing transactions data from the account.
    case transactions
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPrefetch: String, Codable, Sendable {
    /// Requests to prefetch balance data on accounts collected in this session.
    case balances
    /// Requests to prefetch ownership data on accounts collected in this session.
    case ownership
    /// Requests to prefetch transaction data on accounts collected in this session.
    case transactions
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsUSBankAccountVerificationMethod: String, Codable, Sendable {
    /// Instant verification with fallback to microdeposits.
    case automatic
    /// Instant verification only.
    case instant
    /// Verification using microdeposits. Cannot be used with Stripe Checkout or Hosted Invoices.
    case microdeposits
}

// MARK: PayTo
public struct SubscriptionPaymentSettingsPaymentMethodOptionsPayto: Codable, Sendable {
    /// Additional fields for Mandate creation.
    public var mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptions?

    public init(mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptions? = nil) {
        self.mandateOptions = mandateOptions
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptions: Codable, Sendable {
    /// Amount that will be collected. It is required when `amount_type` is `fixed`.
    public var amount: Int?
    /// The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively.
    public var amountType: SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptionsAmountType?
    /// The purpose for which payments are made. Defaults to `retail`.
    public var purpose: SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptionsPurpose?

    public init(amount: Int? = nil,
                amountType: SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptionsAmountType? = nil,
                purpose: SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptionsPurpose? = nil) {
        self.amount = amount
        self.amountType = amountType
        self.purpose = purpose
    }
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptionsAmountType: String, Codable, Sendable {
    case fixed
    case maximum
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsPaytoMandateOptionsPurpose: String, Codable, Sendable {
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

// MARK: Pix
public struct SubscriptionPaymentSettingsPaymentMethodOptionsPix: Codable, Sendable {
    /// Determines the amount of time, in seconds, that the customer has to authorize the payment after the invoice is finalized.
    public var expiresAfterSeconds: Int?
    /// Additional fields for Mandate creation.
    public var mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptions?

    public init(expiresAfterSeconds: Int? = nil,
                mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptions? = nil) {
        self.expiresAfterSeconds = expiresAfterSeconds
        self.mandateOptions = mandateOptions
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptions: Codable, Sendable {
    /// Amount to be charged for future payments.
    public var amount: Int?
    /// Determines if the amount includes the IOF tax.
    public var amountIncludesIof: SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptionsAmountIncludesIof?
    /// Date, in YYYY-MM-DD format, after which payments will not be collected.
    public var endDate: String?
    /// Schedule at which the future payments will be charged.
    public var paymentSchedule: SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptionsPaymentSchedule?

    public init(amount: Int? = nil,
                amountIncludesIof: SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptionsAmountIncludesIof? = nil,
                endDate: String? = nil,
                paymentSchedule: SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptionsPaymentSchedule? = nil) {
        self.amount = amount
        self.amountIncludesIof = amountIncludesIof
        self.endDate = endDate
        self.paymentSchedule = paymentSchedule
    }
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptionsAmountIncludesIof: String, Codable, Sendable {
    /// The amount includes the IOF tax.
    case always
    /// The amount does not include the IOF tax.
    case never
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsPixMandateOptionsPaymentSchedule: String, Codable, Sendable {
    case halfyearly
    case monthly
    case quarterly
    case weekly
    case yearly
}

// MARK: SEPA Debit
public struct SubscriptionPaymentSettingsPaymentMethodOptionsSepaDebit: Codable, Sendable {
    public init() {}
}

// MARK: UPI
public struct SubscriptionPaymentSettingsPaymentMethodOptionsUpi: Codable, Sendable {
    /// Additional fields for Mandate creation.
    public var mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsUpiMandateOptions?

    public init(mandateOptions: SubscriptionPaymentSettingsPaymentMethodOptionsUpiMandateOptions? = nil) {
        self.mandateOptions = mandateOptions
    }
}

public struct SubscriptionPaymentSettingsPaymentMethodOptionsUpiMandateOptions: Codable, Sendable {
    /// Amount to be charged for future payments.
    public var amount: Int?
    /// One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be charged in future payments. If `maximum`, the amount charged can be up to the value passed for the `amount` param.
    public var amountType: SubscriptionPaymentSettingsPaymentMethodOptionsUpiMandateOptionsAmountType?
    /// A description of the mandate or subscription that is meant to be displayed to the customer.
    public var description: String?
    /// End date of the mandate or subscription. If not provided, the mandate will be active until canceled.
    public var endDate: Date?

    public init(amount: Int? = nil,
                amountType: SubscriptionPaymentSettingsPaymentMethodOptionsUpiMandateOptionsAmountType? = nil,
                description: String? = nil,
                endDate: Date? = nil) {
        self.amount = amount
        self.amountType = amountType
        self.description = description
        self.endDate = endDate
    }
}

public enum SubscriptionPaymentSettingsPaymentMethodOptionsUpiMandateOptionsAmountType: String, Codable, Sendable {
    case fixed
    case maximum
}
