//
//  InvoicePaymentMethodOptions.swift
//  
//
//  Created by Andrew Edwards on 5/12/23.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct InvoicePaymentSettingsPaymentMethodOptions: Codable, Sendable {
    /// If paying by `acss_debit`, this sub-hash contains details about the Canadian pre-authorized debit payment method options to pass to the invoice’s PaymentIntent.
    public var acssDebit: InvoicePaymentSettingsPaymentMethodOptionsAcssDebit?
    /// If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.
    public var bancontact: InvoicePaymentSettingsPaymentMethodOptionsBancontact?
    /// If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.
    public var card: InvoicePaymentSettingsPaymentMethodOptionsCard?
    /// If paying by `customer_balance`, this sub-hash contains details about the Bank transfer payment method options to pass to the invoice’s PaymentIntent.
    public var customerBalance: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalance?
    /// If paying by `konbini`, this sub-hash contains details about the Konbini payment method options to pass to the invoice’s PaymentIntent.
    public var konbini: InvoicePaymentSettingsPaymentMethodOptionsKonbini?
    /// If paying by `pix`, this sub-hash contains details about the Pix payment method options to pass to the invoice’s PaymentIntent.
    public var pix: InvoicePaymentSettingsPaymentMethodOptionsPix?
    /// If paying by `sepa_debit`, this sub-hash contains details about the SEPA Direct Debit payment method options to pass to the invoice’s PaymentIntent.
    public var sepaDebit: InvoicePaymentSettingsPaymentMethodOptionsSepaDebit?
    /// If paying by `us_bank_account`, this sub-hash contains details about the ACH direct debit payment method options to pass to the invoice’s PaymentIntent.
    public var usBankAccount: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccount?

    public init(acssDebit: InvoicePaymentSettingsPaymentMethodOptionsAcssDebit? = nil,
                bancontact: InvoicePaymentSettingsPaymentMethodOptionsBancontact? = nil,
                card: InvoicePaymentSettingsPaymentMethodOptionsCard? = nil,
                customerBalance: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalance? = nil,
                konbini: InvoicePaymentSettingsPaymentMethodOptionsKonbini? = nil,
                pix: InvoicePaymentSettingsPaymentMethodOptionsPix? = nil,
                sepaDebit: InvoicePaymentSettingsPaymentMethodOptionsSepaDebit? = nil,
                usBankAccount: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccount? = nil) {
        self.acssDebit = acssDebit
        self.bancontact = bancontact
        self.card = card
        self.customerBalance = customerBalance
        self.konbini = konbini
        self.pix = pix
        self.sepaDebit = sepaDebit
        self.usBankAccount = usBankAccount
    }
}

// MARK: Pix
public struct InvoicePaymentSettingsPaymentMethodOptionsPix: Codable, Sendable {
    /// Determines if the amount includes the IOF tax. One of `always` or `never`.
    public var amountIncludesIof: String?
    /// The number of seconds (between 10 and 1209600) after which Pix payment will expire.
    public var expiresAfterSeconds: Int?

    public init(amountIncludesIof: String? = nil, expiresAfterSeconds: Int? = nil) {
        self.amountIncludesIof = amountIncludesIof
        self.expiresAfterSeconds = expiresAfterSeconds
    }
}

// MARK: SEPA Debit
public struct InvoicePaymentSettingsPaymentMethodOptionsSepaDebit: Codable, Sendable {
    public init() {}
}

// MARK: ACSS Debit
public struct InvoicePaymentSettingsPaymentMethodOptionsAcssDebit: Codable, Sendable {
    /// Additional fields for Mandate creation
    public var mandateOptions: InvoicePaymentSettingsPaymentMethodOptionsAcssDebitManadteOptions?
    /// Bank account verification method.
    public var verificationMethod: InvoicePaymentSettingsPaymentMethodOptionsAcssDebitVerificationMethod?
    
    public init(mandateOptions: InvoicePaymentSettingsPaymentMethodOptionsAcssDebitManadteOptions? = nil,
                verificationMethod: InvoicePaymentSettingsPaymentMethodOptionsAcssDebitVerificationMethod? = nil) {
        self.mandateOptions = mandateOptions
        self.verificationMethod = verificationMethod
    }
}

public struct InvoicePaymentSettingsPaymentMethodOptionsAcssDebitManadteOptions: Codable, Sendable {
    /// Transaction type of the mandate.
    public var transactionType: InvoicePaymentSettingsPaymentMethodOptionsAcssDebitManadteOptionsTransactionType?
    
    public init(transactionType: InvoicePaymentSettingsPaymentMethodOptionsAcssDebitManadteOptionsTransactionType? = nil) {
        self.transactionType = transactionType
    }
}

public enum InvoicePaymentSettingsPaymentMethodOptionsAcssDebitManadteOptionsTransactionType: String, Codable, Sendable {
    /// Transactions are made for personal reasons
    case personal
    /// Transactions are made for business reasons
    case business
}

public enum InvoicePaymentSettingsPaymentMethodOptionsAcssDebitVerificationMethod: String, Codable, Sendable {
    /// Instant verification with fallback to microdeposits.
    case automatic
    /// Instant verification.
    case instant
    /// Verification using microdeposits.
    case microdeposits
}

// MARK: Bancontact
public struct InvoicePaymentSettingsPaymentMethodOptionsBancontact: Codable, Sendable {
    /// Preferred language of the Bancontact authorization page that the customer is redirected to.
    public var preferredLanguage: String?
    
    public init(preferredLanguage: String? = nil) {
        self.preferredLanguage = preferredLanguage
    }
}

// MARK: Card
public struct InvoicePaymentSettingsPaymentMethodOptionsCard: Codable, Sendable {
    /// Installment details for this Invoice (Mexico only). For more information, see the installments integration guide.
    public var installments: InvoicePaymentSettingsPaymentMethodOptionsCardInstallments?
    
    /// We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and other requirements. However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on manually requesting 3D Secure for more information on how this configuration interacts with Radar and our SCA Engine.
    public var requestThreeDSecure: InvoicePaymentSettingsPaymentMethodOptionsCardRequestThreedSecure?
    
    public init(installments: InvoicePaymentSettingsPaymentMethodOptionsCardInstallments? = nil,
                requestThreeDSecure: InvoicePaymentSettingsPaymentMethodOptionsCardRequestThreedSecure? = nil) {
        self.installments = installments
        self.requestThreeDSecure = requestThreeDSecure
    }
}

public struct InvoicePaymentSettingsPaymentMethodOptionsCardInstallments: Codable, Sendable {
    /// Whether Installments are enabled for this Invoice.
    public var enabled: Bool?
    
    public init(enabled: Bool? = nil) {
        self.enabled = enabled
    }
}

public enum InvoicePaymentSettingsPaymentMethodOptionsCardRequestThreedSecure: String, Codable, Sendable {
    /// Triggers 3D Secure authentication only if it is required.
    case automatic
    /// Requires 3D Secure authentication if it is available.
    case any
    /// Requests that the customer complete the 3D Secure authentication challenge.
    case challenge
}

// MARK: Customer Balance
public struct InvoicePaymentSettingsPaymentMethodOptionsCustomerBalance: Codable, Sendable {
    /// Configuration for the bank transfer funding type, if the `funding_type` is set to `bank_transfer`.
    public var bankTransfer: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransfer?
    /// The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`
    public var fundingType: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceFundingType?
    
    public init(bankTransfer: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransfer? = nil,
                fundingType: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceFundingType? = nil) {
        self.bankTransfer = bankTransfer
        self.fundingType = fundingType
    }
}

public struct InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransfer: Codable, Sendable {
    /// Configuration for `eu_bank_transfer` funding type.
    public var euBankTransfer: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferEUBankTransfer?
    /// The bank transfer type that can be used for funding. Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, or `mx_bank_transfe`.
    public var type: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferType?
    
    public init(euBankTransfer: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferEUBankTransfer? = nil,
                type: InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferType? = nil) {
        self.euBankTransfer = euBankTransfer
        self.type = type
    }
}

public struct InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferEUBankTransfer: Codable, Sendable {
    /// The desired country code of the bank account information. Permitted values include: `BE`, `DE`, `ES`, `FR`, `IE`, or `NL`.
    public var country: String?
    
    public init(country: String? = nil) {
        self.country = country
    }
}

public enum InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceBankTransferType: String, Codable, Sendable {
    case euBankTransfer = "eu_bank_transfer"
    case gbBankTransfer = "gb_bank_transfer"
    case jpBankTransfer = "jp_bank_transfer"
    case mxBankTransfer = "mx_bank_transfer"
    case usBankTransfer = "us_bank_transfer"
}

public enum InvoicePaymentSettingsPaymentMethodOptionsCustomerBalanceFundingType: String, Codable, Sendable {
    case bankTransfer = "bank_transfer"
}

// MARK: Konbini
public struct InvoicePaymentSettingsPaymentMethodOptionsKonbini: Codable, Sendable {
    public init(){}
}

// MARK: US Bank Account
public struct InvoicePaymentSettingsPaymentMethodOptionsUSBankAccount: Codable, Sendable {
    /// Additional fields for Financial Connections Session creation
    public var financialConnections: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnections?
    /// Bank account verification method.
    public var verificationMethod: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountVerificationMethod?
    
    public init(financialConnections: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnections? = nil,
                verificationMethod: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountVerificationMethod? = nil) {
        self.financialConnections = financialConnections
        self.verificationMethod = verificationMethod
    }
}

public struct InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnections: Codable, Sendable {
    /// Provide filters for the linked accounts that the customer can select for the payment method.
    public var filters: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFilters?
    /// The list of permissions to request. The `payment_method` permission must be included.
    public var permissions: [InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPermission]?
    /// Data features requested to be retrieved upon account creation.
    public var prefetch: [InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPrefetch]?

    public init(filters: InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFilters? = nil,
                permissions: [InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPermission]? = nil,
                prefetch: [InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPrefetch]? = nil) {
        self.filters = filters
        self.permissions = permissions
        self.prefetch = prefetch
    }
}

public struct InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsFilters: Codable, Sendable {
    /// The account subcategories to use to filter for selectable accounts. Valid subcategories are `checking` and `savings`.
    public var accountSubcategories: [String]?

    public init(accountSubcategories: [String]? = nil) {
        self.accountSubcategories = accountSubcategories
    }
}

public enum InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPermission: String, Codable, Sendable {
    /// Allows the creation of a payment method from the account.
    case paymentMethod = "payment_method"
    /// Allows accessing balance data from the account.
    case balances
    /// Allows accessing ownership data from the account.
    case ownership
    /// Allows accessing transactions data from the account.
    case transactions
}

public enum InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountFinancialConnectionsPrefetch: String, Codable, Sendable {
    /// Requests to prefetch balance data on accounts collected in this session.
    case balances
    /// Requests to prefetch ownership data on accounts collected in this session.
    case ownership
    /// Requests to prefetch transaction data on accounts collected in this session.
    case transactions
}

public enum InvoicePaymentSettingsPaymentMethodOptionsUSBankAccountVerificationMethod: String, Codable, Sendable {
    /// Instant verification with fallback to microdeposits.
    case automatic
    /// Instant verification only.
    case instant
    /// Verification using microdeposits. Cannot be used with Stripe Checkout or Hosted Invoices.
    case microdeposits
}
