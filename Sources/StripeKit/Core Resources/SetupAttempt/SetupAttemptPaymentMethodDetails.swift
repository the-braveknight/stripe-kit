//
//  SetupAttemptPaymentMethodDetails.swift
//  
//
//  Created by Andrew Edwards on 4/29/23.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct SetupAttemptPaymentMethodDetails: Codable, Sendable {
    /// If this is a `acss_debit` payment method, this hash contains confirmation-specific information for the `acss_debit` payment method.
    public var acssDebit: SetupAttemptPaymentMethodDetailsACSSDebit?
    /// If this is a `amazon_pay` payment method, this hash contains confirmation-specific information for the `amazon_pay` payment method.
    public var amazonPay: SetupAttemptPaymentMethodDetailsAmazonPay?
    /// If this is a `au_becs_debit` payment method, this hash contains confirmation-specific information for the `au_becs_debit` payment method.
    public var auBecsDebit: SetupAttemptPaymentMethodDetailsAuBecsDebit?
    /// If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
    public var bacsDebit: SetupAttemptPaymentMethodDetailsBacsDebit?
    /// If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact payment method.
    public var bancontact: SetupAttemptPaymentMethodDetailsBancontact?
    /// If this is a `blik` payment method, this hash contains confirmation-specific information for the `blik` payment method.
    public var blik: SetupAttemptPaymentMethodDetailsBlik?
    /// If this is a`boleto` payment method, this hash contains confirmation-specific information for the `boleto` payment method.
    public var boleto: SetupAttemptPaymentMethodDetailsBoleto?
    /// If this is a `card` PaymentMethod, this hash contains details about the card.
    public var card: SetupAttemptPaymentMethodDetailsCard?
    /// If this is an `card_present` PaymentMethod, this hash contains details about the Card Present payment method.
    public var cardPresent: SetupAttemptPaymentMethodDetailsCardPresent?
    /// If this is a `cashapp` payment method, this hash contains confirmation-specific information for the `cashapp` payment method.
    public var cashapp: StripeSetupAttemptPaymentMethodDetailsCashapp?
    /// If this is a `ideal` payment method, this hash contains confirmation-specific information for the `ideal` payment method.
    public var ideal: SetupAttemptPaymentMethodDetailsIdeal?
    /// If this is a `kakao_pay` payment method, this hash contains confirmation-specific information for the `kakao_pay` payment method.
    public var kakaoPay: SetupAttemptPaymentMethodDetailsKakaoPay?
    /// If this is a `klarna` payment method, this hash contains confirmation-specific information for the `klarna` payment method.
    public var klarna: SetupAttemptPaymentMethodDetailsKlarna?
    /// If this is a `kr_card` payment method, this hash contains confirmation-specific information for the `kr_card` payment method.
    public var krCard: SetupAttemptPaymentMethodDetailsKrCard?
    /// If this is a `link` payment method, this hash contains confirmation-specific information for the `link` payment method.
    public var link: SetupAttemptPaymentMethodDetailsLink?
    /// If this is a `naver_pay` payment method, this hash contains confirmation-specific information for the `naver_pay` payment method.
    public var naverPay: SetupAttemptPaymentMethodDetailsNaverPay?
    /// If this is a `nz_bank_account` payment method, this hash contains confirmation-specific information for the `nz_bank_account` payment method.
    public var nzBankAccount: SetupAttemptPaymentMethodDetailsNZBankAccount?
    /// If this is a `paypal` payment method, this hash contains confirmation-specific information for the `paypal` payment method.
    public var paypal: SetupAttemptPaymentMethodDetailsPaypal?
    /// If this is a `payto` payment method, this hash contains confirmation-specific information for the `payto` payment method.
    public var payto: SetupAttemptPaymentMethodDetailsPayto?
    /// If this is a `pix` payment method, this hash contains confirmation-specific information for the `pix` payment method.
    public var pix: SetupAttemptPaymentMethodDetailsPix?
    /// If this is a `revolut_pay` payment method, this hash contains confirmation-specific information for the `revolut_pay` payment method.
    public var revolutPay: SetupAttemptPaymentMethodDetailsRevolutPay?
    /// If this is a `satispay` payment method, this hash contains confirmation-specific information for the `satispay` payment method.
    public var satispay: SetupAttemptPaymentMethodDetailsSatispay?
    /// If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
    public var sepaDebit: SetupAttemptPaymentMethodDetailsSepaDebit?
    /// If this is a sofort PaymentMethod, this hash contains details about the SOFORT payment method.
    public var sofort: SetupAttemptPaymentMethodDetailsSofort?
    /// If this is a `twint` payment method, this hash contains confirmation-specific information for the `twint` payment method.
    public var twint: SetupAttemptPaymentMethodDetailsTwint?
    /// The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
    public var type: String?
    /// If this is a `upi` payment method, this hash contains confirmation-specific information for the `upi` payment method.
    public var upi: SetupAttemptPaymentMethodDetailsUpi?
    /// If this is a `us_bank_account` payment method, this hash contains confirmation-specific information for the `us_bank_account` payment method.
    public var usBankAccount: SetupAttemptPaymentMethodDetailsUSBankAccount?

    public init(acssDebit: SetupAttemptPaymentMethodDetailsACSSDebit? = nil,
                amazonPay: SetupAttemptPaymentMethodDetailsAmazonPay? = nil,
                auBecsDebit: SetupAttemptPaymentMethodDetailsAuBecsDebit? = nil,
                bacsDebit: SetupAttemptPaymentMethodDetailsBacsDebit? = nil,
                bancontact: SetupAttemptPaymentMethodDetailsBancontact? = nil,
                blik: SetupAttemptPaymentMethodDetailsBlik? = nil,
                boleto: SetupAttemptPaymentMethodDetailsBoleto? = nil,
                card: SetupAttemptPaymentMethodDetailsCard? = nil,
                cardPresent: SetupAttemptPaymentMethodDetailsCardPresent? = nil,
                cashapp: StripeSetupAttemptPaymentMethodDetailsCashapp? = nil,
                ideal: SetupAttemptPaymentMethodDetailsIdeal? = nil,
                kakaoPay: SetupAttemptPaymentMethodDetailsKakaoPay? = nil,
                klarna: SetupAttemptPaymentMethodDetailsKlarna? = nil,
                krCard: SetupAttemptPaymentMethodDetailsKrCard? = nil,
                link: SetupAttemptPaymentMethodDetailsLink? = nil,
                naverPay: SetupAttemptPaymentMethodDetailsNaverPay? = nil,
                nzBankAccount: SetupAttemptPaymentMethodDetailsNZBankAccount? = nil,
                paypal: SetupAttemptPaymentMethodDetailsPaypal? = nil,
                payto: SetupAttemptPaymentMethodDetailsPayto? = nil,
                pix: SetupAttemptPaymentMethodDetailsPix? = nil,
                revolutPay: SetupAttemptPaymentMethodDetailsRevolutPay? = nil,
                satispay: SetupAttemptPaymentMethodDetailsSatispay? = nil,
                sepaDebit: SetupAttemptPaymentMethodDetailsSepaDebit? = nil,
                sofort: SetupAttemptPaymentMethodDetailsSofort? = nil,
                twint: SetupAttemptPaymentMethodDetailsTwint? = nil,
                type: String? = nil,
                upi: SetupAttemptPaymentMethodDetailsUpi? = nil,
                usBankAccount: SetupAttemptPaymentMethodDetailsUSBankAccount? = nil) {
        self.acssDebit = acssDebit
        self.amazonPay = amazonPay
        self.auBecsDebit = auBecsDebit
        self.bacsDebit = bacsDebit
        self.bancontact = bancontact
        self.blik = blik
        self.boleto = boleto
        self.card = card
        self.cardPresent = cardPresent
        self.cashapp = cashapp
        self.ideal = ideal
        self.kakaoPay = kakaoPay
        self.klarna = klarna
        self.krCard = krCard
        self.link = link
        self.naverPay = naverPay
        self.nzBankAccount = nzBankAccount
        self.paypal = paypal
        self.payto = payto
        self.pix = pix
        self.revolutPay = revolutPay
        self.satispay = satispay
        self.sepaDebit = sepaDebit
        self.sofort = sofort
        self.twint = twint
        self.type = type
        self.upi = upi
        self.usBankAccount = usBankAccount
    }
}


// MARK: ACSS Debit
public struct SetupAttemptPaymentMethodDetailsACSSDebit: Codable, Sendable {
    /// Name of the bank associated with the bank account.
    public var bankName: String?
    /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    public var fingerprint: String?
    /// Institution number of the bank account.
    public var institutionNumber: String?
    /// Last four digits of the bank account number.
    public var last4: String?
    /// ID of the mandate used to make this payment.
    @Expandable<Mandate> public var mandate: String?
    /// Contains information about the standing arrangement and the network used to debit funds.
    public var networks: SetupAttemptPaymentMethodDetailsACSSDebitNetworks?
    /// Transit number of the bank account.
    public var transitNumber: String?

    public init(bankName: String? = nil,
                fingerprint: String? = nil,
                institutionNumber: String? = nil,
                last4: String? = nil,
                mandate: String? = nil,
                networks: SetupAttemptPaymentMethodDetailsACSSDebitNetworks? = nil,
                transitNumber: String? = nil) {
        self.bankName = bankName
        self.fingerprint = fingerprint
        self.institutionNumber = institutionNumber
        self.last4 = last4
        self._mandate = Expandable(id: mandate)
        self.networks = networks
        self.transitNumber = transitNumber
    }
}

public struct SetupAttemptPaymentMethodDetailsACSSDebitNetworks: Codable, Sendable {
    /// The preferred network.
    public var preferred: String?
    /// All available networks for the card.
    public var supported: [String]?

    public init(preferred: String? = nil, supported: [String]? = nil) {
        self.preferred = preferred
        self.supported = supported
    }
}

// MARK: Amazon Pay
public struct SetupAttemptPaymentMethodDetailsAmazonPay: Codable, Sendable {
    public init() {}
}

// MARK: AUBecsDebit
public struct SetupAttemptPaymentMethodDetailsAuBecsDebit: Codable, Sendable {
    /// Bank-State-Branch number of the bank account.
    public var bsbNumber: String?
    /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    public var fingerprint: String?
    /// Last four digits of the bank account number.
    public var last4: String?
    /// ID of the mandate used to make this payment.
    @Expandable<Mandate> public var mandate: String?

    public init(bsbNumber: String? = nil,
                fingerprint: String? = nil,
                last4: String? = nil,
                mandate: String? = nil) {
        self.bsbNumber = bsbNumber
        self.fingerprint = fingerprint
        self.last4 = last4
        self._mandate = Expandable(id: mandate)
    }
}

// MARK: BacsDebit
public struct SetupAttemptPaymentMethodDetailsBacsDebit: Codable, Sendable {
    /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    public var fingerprint: String?
    /// Last four digits of the bank account number.
    public var last4: String?
    /// ID of the mandate used to make this payment.
    @Expandable<Mandate> public var mandate: String?
    /// Sort code of the bank account. (e.g., `10-20-30`)
    public var sortCode: String?

    public init(fingerprint: String? = nil,
                last4: String? = nil,
                mandate: String? = nil,
                sortCode: String? = nil) {
        self.fingerprint = fingerprint
        self.last4 = last4
        self._mandate = Expandable(id: mandate)
        self.sortCode = sortCode
    }
}

// MARK: Bancontact
public struct SetupAttemptPaymentMethodDetailsBancontact: Codable, Sendable {
    /// Bank code of bank associated with the bank account.
    public var bankCode: String?
    /// Name of the bank associated with the bank account.
    public var bankName: String?
    /// Bank Identifier Code of the bank associated with the bank account.
    public var bic: String?
    /// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<PaymentMethodSepaDebit> public var generatedSepaDebit: String?
    /// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<Mandate> public var generatedSepaDebitMandate: String?
    /// Last four characters of the IBAN.
    public var ibanLast4: String?
    /// Preferred language of the Bancontact authorization page that the customer is redirected to. Can be one of en, de, fr, or nl
    public var preferredLanguage: SetupAttemptPaymentMethodDetailsBancontactPreferredLanguage?
    /// Owner’s verified full name. Values are verified or provided by Bancontact directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedName: String?
    
    public init(bankCode: String? = nil,
                bankName: String? = nil,
                bic: String? = nil,
                generatedSepaDebit: String? = nil,
                generatedSepaDebitMandate: String? = nil,
                ibanLast4: String? = nil,
                preferredLanguage: SetupAttemptPaymentMethodDetailsBancontactPreferredLanguage? = nil,
                verifiedName: String? = nil) {
        self.bankCode = bankCode
        self.bankName = bankName
        self.bic = bic
        self._generatedSepaDebit = Expandable(id: generatedSepaDebit)
        self._generatedSepaDebitMandate = Expandable(id: generatedSepaDebitMandate)
        self.ibanLast4 = ibanLast4
        self.preferredLanguage = preferredLanguage
        self.verifiedName = verifiedName
    }
}

public enum SetupAttemptPaymentMethodDetailsBancontactPreferredLanguage: String, Codable, Sendable {
    case en
    case de
    case fr
    case nl
}

// MARK: Blik
public struct SetupAttemptPaymentMethodDetailsBlik: Codable, Sendable {
    public init() {}
}

// MARK: Boleto
public struct SetupAttemptPaymentMethodDetailsBoleto: Codable, Sendable {
    public init() {}
}

// MARK: Card
public struct SetupAttemptPaymentMethodDetailsCard: Codable, Sendable {
    /// Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    public var brand: PaymentMethodDetailsCardBrand?
    /// Check results by Card networks on Card address and CVC at time of payment.
    public var checks: SetupAttemptPaymentMethodDetailsCardChecks?
    /// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you’ve collected.
    public var country: String?
    /// Two-digit number representing the card’s expiration month.
    public var expMonth: Int?
    /// Four-digit number representing the card’s expiration year.
    public var expYear: Int?
    /// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    public var fingerprint: String?
    /// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    public var funding: CardFundingType?
    /// The last four digits of the card.
    public var last4: String?
    /// Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    public var network: PaymentMethodCardNetwork?
    /// Populated if this authorization used 3D Secure authentication.
    public var threeDSecure: SetupAttemptPaymentMethodDetailsCardThreeDSecure?
    /// If this Card is part of a card wallet, this contains the details of the card wallet.
    public var wallet: SetupAttemptPaymentMethodDetailsCardWallet?

    public init(brand: PaymentMethodDetailsCardBrand? = nil,
                checks: SetupAttemptPaymentMethodDetailsCardChecks? = nil,
                country: String? = nil,
                expMonth: Int? = nil,
                expYear: Int? = nil,
                fingerprint: String? = nil,
                funding: CardFundingType? = nil,
                last4: String? = nil,
                network: PaymentMethodCardNetwork? = nil,
                threeDSecure: SetupAttemptPaymentMethodDetailsCardThreeDSecure? = nil,
                wallet: SetupAttemptPaymentMethodDetailsCardWallet? = nil) {
        self.brand = brand
        self.checks = checks
        self.country = country
        self.expMonth = expMonth
        self.expYear = expYear
        self.fingerprint = fingerprint
        self.funding = funding
        self.last4 = last4
        self.network = network
        self.threeDSecure = threeDSecure
        self.wallet = wallet
    }
}

public struct SetupAttemptPaymentMethodDetailsCardWallet: Codable, Sendable {
    /// The type of the card wallet, one of `apple_pay`, `google_pay`, or `link`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.
    public var type: SetupAttemptPaymentMethodDetailsCardWalletType?
    /// If this is a `apple_pay` card wallet, this hash contains details about the wallet.
    public var applePay: SetupAttemptPaymentMethodDetailsCardWalletApplePay?

    public init(type: SetupAttemptPaymentMethodDetailsCardWalletType? = nil,
                applePay: SetupAttemptPaymentMethodDetailsCardWalletApplePay? = nil) {
        self.type = type
        self.applePay = applePay
    }
}

public enum SetupAttemptPaymentMethodDetailsCardWalletType: String, Codable, Sendable {
    case applePay = "apple_pay"
    case googlePay = "google_pay"
    case link
}

public struct SetupAttemptPaymentMethodDetailsCardWalletApplePay: Codable, Sendable {
    /// The type of the Apple Pay payment, one of `apple_pay` or `apple_pay_later`.
    public var type: String?

    public init(type: String? = nil) {
        self.type = type
    }
}

public struct SetupAttemptPaymentMethodDetailsCardChecks: Codable, Sendable {
    /// If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    public var addressLine1Check: SetupAttemptPaymentMethodDetailsCardCheck?
    /// If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    public var addressPostalCodeCheck: SetupAttemptPaymentMethodDetailsCardCheck?
    /// If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    public var cvcCheck: SetupAttemptPaymentMethodDetailsCardCheck?
    
    public init(addressLine1Check: SetupAttemptPaymentMethodDetailsCardCheck? = nil,
                addressPostalCodeCheck: SetupAttemptPaymentMethodDetailsCardCheck? = nil,
                cvcCheck: SetupAttemptPaymentMethodDetailsCardCheck? = nil) {
        self.addressLine1Check = addressLine1Check
        self.addressPostalCodeCheck = addressPostalCodeCheck
        self.cvcCheck = cvcCheck
    }
}

public enum SetupAttemptPaymentMethodDetailsCardCheck: String, Codable, Sendable {
    case pass
    case fail
    case unavailable
    case unchecked
}

public struct SetupAttemptPaymentMethodDetailsCardThreeDSecure: Codable, Sendable {
    /// For authenticated transactions: how the customer was authenticated by the issuing bank.
    public var authenticationFlow: SetupAttemptPaymentMethodDetailsCardThreeDSecureAuthenticationFlow?
    /// The Electronic Commerce Indicator (ECI). A protocol-level field indicating what degree of authentication was performed. One of `01`, `02`, `05`, `06`, or `07`.
    public var electronicCommerceIndicator: SetupAttemptPaymentMethodDetailsCardThreeDSecureElectronicCommerceIndicator?
    /// Indicates the outcome of 3D Secure authentication.
    public var result: SetupAttemptPaymentMethodDetailsCardThreeDSecureResult?
    /// Additional information about why 3D Secure succeeded or failed based on the `result`.
    public var resultReason: SetupAttemptPaymentMethodDetailsCardThreeDSecureResultReason?
    /// The 3D Secure 1 XID or 3D Secure 2 Directory Server Transaction ID (dsTransId) for this payment.
    public var transactionId: String?
    /// The version of 3D Secure that was used. One of `1.0.2`, `2.1.0`, or `2.2.0`.
    public var version: String?
}

public enum SetupAttemptPaymentMethodDetailsCardThreeDSecureElectronicCommerceIndicator: String, Codable, Sendable {
    case _01 = "01"
    case _02 = "02"
    case _05 = "05"
    case _06 = "06"
    case _07 = "07"
}

public enum SetupAttemptPaymentMethodDetailsCardThreeDSecureAuthenticationFlow: String, Codable, Sendable {
    /// The issuing bank authenticated the customer by presenting a traditional challenge window.
    case challenge
    /// The issuing bank authenticated the customer via the 3DS2 frictionless flow.
    case frictionless
}

public enum SetupAttemptPaymentMethodDetailsCardThreeDSecureResult: String, Codable, Sendable {
    /// 3D Secure authentication succeeded.
    case authenticated
    /// The issuing bank does not support 3D Secure, has not set up 3D Secure for the card, or is experiencing an outage. No authentication was peformed, but the card network has provided proof of the attempt.
    /// In most cases the attempt qualifies for liability shift and it is safe to make a charge.
    case attemptAcknowledged = "attempt_acknowledged"
    /// A 3D Secure exemption has been applied to this transaction. Exemption may be requested for a number of reasons including merchant initiation, low value, or low risk.
    case exempted
    /// 3D Secure authentication cannot be run on this card.
    case notSupported = "not_supported"
    /// The customer failed 3D Secure authentication.
    case failed
    /// The issuing bank’s 3D Secure system is temporarily unavailable and the card network is unable to provide proof of the attempt.
    case processingError = "processing_error"
}

public enum SetupAttemptPaymentMethodDetailsCardThreeDSecureResultReason: String, Codable, Sendable {
    /// For `not_supported`. The issuing bank does not support 3D Secure or has not set up 3D Secure for the card, and the card network did not provide proof of the attempt.
    /// This occurs when running 3D Secure on certain kinds of prepaid cards and in rare cases where the issuing bank is exempt from the requirement to support 3D Secure.
    case cardNotEnrolled = "card_not_enrolled"
    /// For `not_supported`. Stripe does not support 3D Secure on this card network.
    case networkNotSupported = "network_not_supported"
    /// For `failed`. The transaction timed out: the cardholder dropped off before completing authentication.
    case abandoned
    /// For `failed`. The cardholder canceled authentication (where possible to identify).
    case canceled
    /// For `failed`. The cardholder was redirected back from the issuing bank without completing authentication.
    case rejected
    /// For `processing_error`. Stripe bypassed 3D Secure because the issuing bank’s web-facing server was returning errors or timeouts to customers in the challenge window.
    case bypassed
    /// For `processing_error`. An invalid message was received from the card network or issuing bank. (Includes “downgrades” and similar errors).
    case protocolError = "protocol_error"
}

// MARK: Card Present
public struct SetupAttemptPaymentMethodDetailsCardPresent: Codable, Sendable {
    /// Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    public var brand: PaymentMethodDetailsCardBrand?
    /// The ID of the Card PaymentMethod which was generated by this SetupAttempt.
    @Expandable<Card> public var generatedCard: String?
    /// Details about payments collected offline.
    public var offline: SetupAttemptPaymentMethodDetailsCardPresentOffline?

    public init(brand: PaymentMethodDetailsCardBrand? = nil,
                generatedCard: String? = nil,
                offline: SetupAttemptPaymentMethodDetailsCardPresentOffline? = nil) {
        self.brand = brand
        self._generatedCard = Expandable(id: generatedCard)
        self.offline = offline
    }
}

public struct SetupAttemptPaymentMethodDetailsCardPresentOffline: Codable, Sendable {
    /// Time at which the payment was collected while offline.
    public var storedAt: Date?
    /// The method used to process this payment method offline. Only `deferred` is allowed.
    public var type: String?

    public init(storedAt: Date? = nil, type: String? = nil) {
        self.storedAt = storedAt
        self.type = type
    }
}

// MARK: Cashapp

public struct StripeSetupAttemptPaymentMethodDetailsCashapp: Codable, Sendable {
    public init() {}
}

// MARK: Ideal
public struct SetupAttemptPaymentMethodDetailsIdeal: Codable, Sendable {
    /// The customer’s bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot` or `yourself`.
    public var bank: SetupAttemptPaymentMethodDetailsIdealBank?
    /// The Bank Identifier Code of the customer’s bank.
    public var bic: String?
    /// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<PaymentMethodSepaDebit> public var generatedSepaDebit: String?
    /// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<Mandate> public var generatedSepaDebitMandate: String?
    /// Last four characters of the IBAN.
    public var ibanLast4: String?
    /// Owner’s verified full name. Values are verified or provided by iDEAL directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedName: String?
    
    public init(bank: SetupAttemptPaymentMethodDetailsIdealBank? = nil,
                bic: String? = nil,
                generatedSepaDebit: String? = nil,
                generatedSepaDebitMandate: String? = nil,
                ibanLast4: String? = nil,
                verifiedName: String? = nil) {
        self.bank = bank
        self.bic = bic
        self._generatedSepaDebit = Expandable(id: generatedSepaDebit)
        self._generatedSepaDebitMandate = Expandable(id: generatedSepaDebitMandate)
        self.ibanLast4 = ibanLast4
        self.verifiedName = verifiedName
    }
}

public enum SetupAttemptPaymentMethodDetailsIdealBank: String, Codable, Sendable {
    case abnAmro = "abn_amro"
    case adyen
    case asnBank = "asn_bank"
    case bunq
    case buut
    case finom
    case handelsbanken
    case ing
    case knab
    case mollie
    case moneyou
    case n26
    case nn
    case rabobank
    case regiobank
    case revolut
    case snsBank = "sns_bank"
    case triodosBank = "triodos_bank"
    case vanLanschot = "van_lanschot"
    case yoursafe
}

// MARK: Klarna
public struct SetupAttemptPaymentMethodDetailsKlarna: Codable, Sendable {
    public init() {}
}

// MARK: Link
public struct SetupAttemptPaymentMethodDetailsLink: Codable, Sendable {
    public init() {}
}

// MARK: Sepa Debit
public struct SetupAttemptPaymentMethodDetailsSepaDebit: Codable, Sendable {
    public init() {}
}

// MARK: Sofort
public struct SetupAttemptPaymentMethodDetailsSofort: Codable, Sendable {
    /// Bank code of bank associated with the bank account.
    public var bankCode: String?
    /// Name of the bank associated with the bank account.
    public var bankName: String?
    /// Bank Identifier Code of the bank associated with the bank account.
    public var bic: String?
    /// The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<PaymentMethodSepaDebit> public var generatedSepaDebit: String?
    /// The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    @Expandable<Mandate> public var generatedSepaDebitMandate: String?
    /// Last four characters of the IBAN.
    public var ibanLast4: String?
    /// Preferred language of the Sofort authorization page that the customer is redirected to. Can be one of `en`, `de`, `fr`, or `nl`
    public var preferredLanguage: SetupAttemptPaymentMethodDetailsSofortPreferredLanguage?
    /// Owner’s verified full name. Values are verified or provided by iDEAL directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedName: String?
    
    public init(bankCode: String? = nil,
                bankName: String? = nil,
                bic: String? = nil,
                generatedSepaDebit: String? = nil,
                generatedSepaDebitMandate: String? = nil,
                ibanLast4: String? = nil,
                preferredLanguage: SetupAttemptPaymentMethodDetailsSofortPreferredLanguage? = nil,
                verifiedName: String? = nil) {
        self.bankCode = bankCode
        self.bankName = bankName
        self.bic = bic
        self._generatedSepaDebit = Expandable(id: generatedSepaDebit)
        self._generatedSepaDebitMandate = Expandable(id: generatedSepaDebitMandate)
        self.ibanLast4 = ibanLast4
        self.preferredLanguage = preferredLanguage
        self.verifiedName = verifiedName
    }
}

public enum SetupAttemptPaymentMethodDetailsSofortPreferredLanguage: String, Codable, Sendable {
    case en
    case de
    case fr
    case nl
}

// MARK: Kakao Pay
public struct SetupAttemptPaymentMethodDetailsKakaoPay: Codable, Sendable {
    public init() {}
}

// MARK: Kr Card
public struct SetupAttemptPaymentMethodDetailsKrCard: Codable, Sendable {
    public init() {}
}

// MARK: Naver Pay
public struct SetupAttemptPaymentMethodDetailsNaverPay: Codable, Sendable {
    /// Uniquely identifies this particular Naver Pay account. You can use this attribute to check whether two Naver Pay accounts are the same.
    public var buyerId: String?

    public init(buyerId: String? = nil) {
        self.buyerId = buyerId
    }
}

// MARK: NZ Bank Account
public struct SetupAttemptPaymentMethodDetailsNZBankAccount: Codable, Sendable {
    public init() {}
}

// MARK: Paypal
public struct SetupAttemptPaymentMethodDetailsPaypal: Codable, Sendable {
    public init() {}
}

// MARK: Payto
public struct SetupAttemptPaymentMethodDetailsPayto: Codable, Sendable {
    public init() {}
}

// MARK: Pix
public struct SetupAttemptPaymentMethodDetailsPix: Codable, Sendable {
    /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    public var fingerprint: String?

    public init(fingerprint: String? = nil) {
        self.fingerprint = fingerprint
    }
}

// MARK: Revolut Pay
public struct SetupAttemptPaymentMethodDetailsRevolutPay: Codable, Sendable {
    public init() {}
}

// MARK: Satispay
public struct SetupAttemptPaymentMethodDetailsSatispay: Codable, Sendable {
    public init() {}
}

// MARK: Twint
public struct SetupAttemptPaymentMethodDetailsTwint: Codable, Sendable {
    public init() {}
}

// MARK: Upi
public struct SetupAttemptPaymentMethodDetailsUpi: Codable, Sendable {
    public init() {}
}

// MARK: US Bank Account
public struct SetupAttemptPaymentMethodDetailsUSBankAccount: Codable, Sendable {
    public init() {}
}
