//
//  Mandate.swift
//  
//
//  Created by Andrew Edwards on 11/23/19.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct Mandate: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// Details about the customer’s acceptance of the mandate.
    public var customerAcceptance: MandateCustomerAcceptance?
    /// The account (if any) that the mandate is intended for.
    public var onBehalfOf: String?
    /// ID of the payment method associated with this mandate.
    @Expandable<PaymentMethod> public var paymentMethod: String?
    /// Additional mandate information specific to the payment method type.
    public var paymentMethodDetails: MandatePaymentMethodDetails?
    /// The status of the Mandate, one of `active`, `inactive`, or `pending`. The Mandate can be used to initiate a payment only if status=active.
    public var status: MandateStatus?
    /// The type of the mandate, one of `multi_use` or `single_use`.
    public var type: MandateType?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// If this is a `multi_use` mandate, this hash contains details about the mandate.
    public var multiUse: MandateMultiUse?
    /// If this is a `single_use` mandate, this hash contains details about the mandate.
    public var singleUse: MandateSingleUse?

    public init(id: String,
                customerAcceptance: MandateCustomerAcceptance? = nil,
                onBehalfOf: String? = nil,
                paymentMethod: String? = nil,
                paymentMethodDetails: MandatePaymentMethodDetails? = nil,
                status: MandateStatus? = nil,
                type: MandateType? = nil,
                object: String,
                livemode: Bool? = nil,
                multiUse: MandateMultiUse? = nil,
                singleUse: MandateSingleUse? = nil) {
        self.id = id
        self.customerAcceptance = customerAcceptance
        self.onBehalfOf = onBehalfOf
        self._paymentMethod = Expandable(id: paymentMethod)
        self.paymentMethodDetails = paymentMethodDetails
        self.status = status
        self.type = type
        self.object = object
        self.livemode = livemode
        self.multiUse = multiUse
        self.singleUse = singleUse
    }
}

public struct MandateCustomerAcceptance: Codable {
    /// The time at which the customer accepted the Mandate.
    public var acceptedAt: Date?
    /// If this is a Mandate accepted offline, this hash contains details about the offline acceptance.
    public var offline: MandateCustomerAcceptanceOffline?
    /// If this is a Mandate accepted online, this hash contains details about the online acceptance.
    public var online: MandateCustomerAcceptanceOnline?
    /// The type of customer acceptance information included with the Mandate. One of online or offline.
    public var type: MandateCustomerAcceptanceType?
    
    public init(acceptedAt: Date? = nil,
                offline: MandateCustomerAcceptanceOffline? = nil,
                online: MandateCustomerAcceptanceOnline? = nil,
                type: MandateCustomerAcceptanceType? = nil) {
        self.acceptedAt = acceptedAt
        self.offline = offline
        self.online = online
        self.type = type
    }
}

public struct MandateCustomerAcceptanceOffline: Codable {
    public init() {}
}

public struct MandateCustomerAcceptanceOnline: Codable {
    /// The IP address from which the Mandate was accepted by the customer
    public var ipAddress: String?
    /// The user agent of the browser from which the Mandate was accepted by the customer.
    public var userAgent: String?
    
    public init(ipAddress: String? = nil, userAgent: String? = nil) {
        self.ipAddress = ipAddress
        self.userAgent = userAgent
    }
}

public enum MandateCustomerAcceptanceType: String, Codable {
    case online
    case offline
}

public struct MandatePaymentMethodDetails: Codable {
    /// If this mandate is associated with a `acss_debit` payment method, this hash contains mandate information specific to the `acss_debit` payment method.
    public var acssDebit: MandatePaymentMethodDetailsACSSDebit?
    /// If this mandate is associated with a `amazon_pay` payment method, this hash contains mandate information specific to the `amazon_pay` payment method.
    public var amazonPay: MandatePaymentMethodDetailsAmazonPay?
    /// If this mandate is associated with a `au_becs_debit` payment method, this hash contains mandate information specific to the `au_becs_debit` payment method.
    public var auBecsDebit: MandatePaymentMethodDetailsAuBecsDebit?
    /// If this mandate is associated with a `bacs_debit` payment method, this hash contains mandate information specific to the `bacs_debit` payment method.
    public var bacsDebit: MandatePaymentMethodDetailsBacsDebit?
    /// If this mandate is associated with a `blik` payment method, this hash contains mandate information specific to the `blik` payment method.
    public var blik: MandatePaymentMethodDetailsBlik?
    /// If this mandate is associated with a `card` payment method, this hash contains mandate information specific to the `card` payment method.
    public var card: MandatePaymentMethodDetailsCard?
    /// If this mandate is associated with a `cashapp` payment method, this hash contains mandate information specific to the `cashapp` payment method.
    public var cashapp: MandatePaymentMethodDetailsCashapp?
    /// If this mandate is associated with a `kakao_pay` payment method, this hash contains mandate information specific to the `kakao_pay` payment method.
    public var kakaoPay: MandatePaymentMethodDetailsKakaoPay?
    /// If this mandate is associated with a `klarna` payment method, this hash contains mandate information specific to the `klarna` payment method.
    public var klarna: MandatePaymentMethodDetailsKlarna?
    /// If this mandate is associated with a `kr_card` payment method, this hash contains mandate information specific to the `kr_card` payment method.
    public var krCard: MandatePaymentMethodDetailsKrCard?
    /// If this mandate is associated with a `link` payment method, this hash contains mandate information specific to the `link` payment method.
    public var link: MandatePaymentMethodDetailsLink?
    /// If this mandate is associated with a `naver_pay` payment method, this hash contains mandate information specific to the `naver_pay` payment method.
    public var naverPay: MandatePaymentMethodDetailsNaverPay?
    /// If this mandate is associated with a `nz_bank_account` payment method, this hash contains mandate information specific to the `nz_bank_account` payment method.
    public var nzBankAccount: MandatePaymentMethodDetailsNzBankAccount?
    /// If this mandate is associated with a `paypal` payment method, this hash contains mandate information specific to the `paypal` payment method.
    public var paypal: MandatePaymentMethodDetailsPaypal?
    /// If this mandate is associated with a `payto` payment method, this hash contains mandate information specific to the `payto` payment method.
    public var payto: MandatePaymentMethodDetailsPayto?
    /// If this mandate is associated with a `pix` payment method, this hash contains mandate information specific to the `pix` payment method.
    public var pix: MandatePaymentMethodDetailsPix?
    /// If this mandate is associated with a `revolut_pay` payment method, this hash contains mandate information specific to the `revolut_pay` payment method.
    public var revolutPay: MandatePaymentMethodDetailsRevolutPay?
    /// If this mandate is associated with a `sepa_debit` payment method, this hash contains mandate information specific to the `sepa_debit` payment method.
    public var sepaDebit: MandatePaymentMethodDetailsSepaDebit?
    /// If this mandate is associated with a `twint` payment method, this hash contains mandate information specific to the `twint` payment method.
    public var twint: MandatePaymentMethodDetailsTwint?
    /// If this mandate is associated with a `upi` payment method, this hash contains mandate information specific to the `upi` payment method.
    public var upi: MandatePaymentMethodDetailsUpi?
    /// If this mandate is associated with a `us_bank_account` payment method, this hash contains mandate information specific to the `us_bank_account` payment method.
    public var usBankAccount: MandatePaymentMethodDetailsUsBankAccount?
    /// The type of the payment method associated with this mandate. An additional hash is included on `payment_method_details` with a name matching this value. It contains mandate information specific to the payment method.
    public var type: PaymentMethodType?

    public init(acssDebit: MandatePaymentMethodDetailsACSSDebit? = nil,
                amazonPay: MandatePaymentMethodDetailsAmazonPay? = nil,
                auBecsDebit: MandatePaymentMethodDetailsAuBecsDebit? = nil,
                bacsDebit: MandatePaymentMethodDetailsBacsDebit? = nil,
                blik: MandatePaymentMethodDetailsBlik? = nil,
                card: MandatePaymentMethodDetailsCard? = nil,
                cashapp: MandatePaymentMethodDetailsCashapp? = nil,
                kakaoPay: MandatePaymentMethodDetailsKakaoPay? = nil,
                klarna: MandatePaymentMethodDetailsKlarna? = nil,
                krCard: MandatePaymentMethodDetailsKrCard? = nil,
                link: MandatePaymentMethodDetailsLink? = nil,
                naverPay: MandatePaymentMethodDetailsNaverPay? = nil,
                nzBankAccount: MandatePaymentMethodDetailsNzBankAccount? = nil,
                paypal: MandatePaymentMethodDetailsPaypal? = nil,
                payto: MandatePaymentMethodDetailsPayto? = nil,
                pix: MandatePaymentMethodDetailsPix? = nil,
                revolutPay: MandatePaymentMethodDetailsRevolutPay? = nil,
                sepaDebit: MandatePaymentMethodDetailsSepaDebit? = nil,
                twint: MandatePaymentMethodDetailsTwint? = nil,
                upi: MandatePaymentMethodDetailsUpi? = nil,
                usBankAccount: MandatePaymentMethodDetailsUsBankAccount? = nil,
                type: PaymentMethodType? = nil) {
        self.acssDebit = acssDebit
        self.amazonPay = amazonPay
        self.auBecsDebit = auBecsDebit
        self.bacsDebit = bacsDebit
        self.blik = blik
        self.card = card
        self.cashapp = cashapp
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
        self.sepaDebit = sepaDebit
        self.twint = twint
        self.upi = upi
        self.usBankAccount = usBankAccount
        self.type = type
    }
}

public struct MandateSingleUse: Codable {
    /// On a single use mandate, the amount of the payment.
    public var amount: Int?
    /// On a single use mandate, the currency of the payment.
    public var currency: Currency?
    
    public init(amount: Int? = nil, currency: Currency? = nil) {
        self.amount = amount
        self.currency = currency
    }
}

public struct MandateMultiUse: Codable {
    /// On a multi use mandate, the amount of the payment.
    public var amount: Int?
    /// On a multi use mandate, the currency of the payment.
    public var currency: Currency?

    public init(amount: Int? = nil, currency: Currency? = nil) {
        self.amount = amount
        self.currency = currency
    }
}

public enum MandateStatus: String, Codable {
    /// The mandate can be used to initiate a payment.
    case active
    /// The mandate was rejected, revoked, or previously used, and may not be used to initiate future payments.
    case inactive
    /// The mandate is newly created and is not yet active or inactive.
    case pending
}

public enum MandateType: String, Codable {
    /// Represents permission given for multiple payments.
    case multiUse = "multi_use"
    /// Represents a one-time permission given for a single payment.
    case singleUse = "single_use"
}
