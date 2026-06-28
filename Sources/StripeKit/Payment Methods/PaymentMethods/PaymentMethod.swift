//
//  PaymentMethod.swift
//  Stripe
//
//  Created by Andrew Edwards on 4/15/19.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [PaymentMethod Object](https://stripe.com/docs/api/payment_methods/object) .
public struct PaymentMethod: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
    public var billingDetails: BillingDetails?
    /// The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.
    @Expandable<Customer> public var customer: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
    public var type: PaymentMethodType?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow.
    public var allowRedisplay: PaymentMethodAllowRedisplay?
    /// If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
    public var acssDebit: PaymentMethodAcssDebit?
    /// If this is an `affirm` PaymentMethod, this hash contains details about the Affirm payment method.
    public var affirm: PaymentMethodAffirm?
    /// If this is an AfterpayClearpay PaymentMethod, this hash contains details about the AfterpayClearpay payment method.
    public var afterpayClearpay: PaymentMethodAfterpayClearpay?
    /// If this is an Alipay PaymentMethod, this hash contains details about the Alipay payment method.
    public var alipay: PaymentMethodAlipay?
    /// If this is a `alma` PaymentMethod, this hash contains details about the Alma payment method.
    public var alma: PaymentMethodAlma?
    /// If this is a `amazon_pay` PaymentMethod, this hash contains details about the Amazon Pay payment method.
    public var amazonPay: PaymentMethodAmazonPay?
    /// If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank account.
    public var auBecsDebit: PaymentMethodAuBecsDebit?
    /// If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
    public var bacsDebit: PaymentMethodBacsDebit?
    /// If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact payment method.
    public var bancontact: PaymentMethodBancontact?
    /// If this is a `billie` PaymentMethod, this hash contains details about the Billie payment method.
    public var billie: PaymentMethodBillie?
    /// If this is a `bizum` PaymentMethod, this hash contains details about the Bizum payment method.
    public var bizum: PaymentMethodBizum?
    /// If this is a `blik` PaymentMethod, this hash contains details about the BLIK payment method.
    public var blik: PaymentMethodBlik?
    /// If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment method.
    public var boleto: PaymentMethodBoleto?
    /// If this is a `card` PaymentMethod, this hash contains details about the card.
    public var card: PaymentMethodCard?
    /// If this is an `card_present` PaymentMethod, this hash contains details about the Card Present payment method.
    public var cardPresent: PaymentMethodCardPresent?
    /// If this is a `cashapp` PaymentMethod, this hash contains details about the Cash App Pay payment method.
    public var cashapp: PaymentMethodCashapp?
    /// If this is a `crypto` PaymentMethod, this hash contains details about the Crypto payment method.
    public var crypto: PaymentMethodCrypto?
    /// If this is a `custom` PaymentMethod, this hash contains details about the Custom payment method.
    public var custom: PaymentMethodCustom?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// If this is a `customer_balance` PaymentMethod, this hash contains details about the CustomerBalance payment method.
    public var customerBalance: PaymentMethodCustomerBalance?
    /// If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
    public var eps: PaymentMethodEps?
    /// If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
    public var fpx: PaymentMethodFpx?
    /// If this is an `giropay` PaymentMethod, this hash contains details about the Giropay payment method.
    public var giropay: PaymentMethodGiropay?
    /// If this is a `grabpay` PaymentMethod, this hash contains details about the GrabPay payment method.
    public var grabpay: PaymentMethodGrabpay?
    /// If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment method.
    public var ideal: PaymentMethodIdeal?
    /// If this is an `interac_present` PaymentMethod, this hash contains details about the Interac Present payment method.
    public var interacPresent: PaymentMethodInteractPresent?
    /// If this is a `kakao_pay` PaymentMethod, this hash contains details about the Kakao Pay payment method.
    public var kakaoPay: PaymentMethodKakaoPay?
    /// If this is a `klarna` PaymentMethod, this hash contains details about the Klarna payment method.
    public var klarna: PaymentMethodKlarna?
    /// If this is a `konbini` PaymentMethod, this hash contains details about the Konbini payment method.
    public var konbini: PaymentMethodKonbini?
    /// If this is a `kr_card` PaymentMethod, this hash contains details about the Korean card payment method.
    public var krCard: PaymentMethodKrCard?
    /// If this is a `link` PaymentMethod, this hash contains details about the Link payment method.
    public var link: PaymentMethodLink?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool?
    /// If this is a `mb_way` PaymentMethod, this hash contains details about the MB WAY payment method.
    public var mbWay: PaymentMethodMbWay?
    /// If this is a `mobilepay` PaymentMethod, this hash contains details about the MobilePay payment method.
    public var mobilepay: PaymentMethodMobilepay?
    /// If this is a `multibanco` PaymentMethod, this hash contains details about the Multibanco payment method.
    public var multibanco: PaymentMethodMultibanco?
    /// If this is a `naver_pay` PaymentMethod, this hash contains details about the Naver Pay payment method.
    public var naverPay: PaymentMethodNaverPay?
    /// If this is a `nz_bank_account` PaymentMethod, this hash contains details about the bank account.
    public var nzBankAccount: PaymentMethodNzBankAccount?
    /// If this is an `oxxo` PaymentMethod, this hash contains details about the OXXO payment method.
    public var oxxo: PaymentMethodOXXO?
    /// If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
    public var p24: PaymentMethodP24?
    /// If this is a `pay_by_bank` PaymentMethod, this hash contains details about the PayByBank payment method.
    public var payByBank: PaymentMethodPayByBank?
    /// If this is a `payco` PaymentMethod, this hash contains details about the PAYCO payment method.
    public var payco: PaymentMethodPayco?
    /// If this is a`paynow` PaymentMethod, this hash contains details about the PayNow payment method.
    public var paynow: PaymentMethodPaynow?
    /// If this is a `paypal` PaymentMethod, this hash contains details about the PayPal payment method.
    public var paypal: PaymentMethodPaypal?
    /// If this is a `paypay` PaymentMethod, this hash contains details about the PayPay payment method.
    public var paypay: PaymentMethodPaypay?
    /// If this is a `payto` PaymentMethod, this hash contains details about the PayTo payment method.
    public var payto: PaymentMethodPayto?
    /// If this is a `pix` PaymentMethod, this hash contains details about the Pix payment method.
    public var pix: PaymentMethodPix?
    /// If this is a `promptpay` PaymentMethod, this hash contains details about the PromptPay payment method.
    public var promptpay: PaymentMethodPromptPay?
    /// Options to configure Radar. See Radar Session for more information.
    public var radarOptions: PaymentMethodRadarOptions?
    /// If this is a `revolut_pay` PaymentMethod, this hash contains details about the Revolut Pay payment method.
    public var revolutPay: PaymentMethodRevolutPay?
    /// If this is a `samsung_pay` PaymentMethod, this hash contains details about the Samsung Pay payment method.
    public var samsungPay: PaymentMethodSamsungPay?
    /// If this is a `satispay` PaymentMethod, this hash contains details about the Satispay payment method.
    public var satispay: PaymentMethodSatispay?
    /// If this is a `scalapay` PaymentMethod, this hash contains details about the Scalapay payment method.
    public var scalapay: PaymentMethodScalapay?
    /// If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
    public var sepaDebit: PaymentMethodSepaDebit?
    /// If this is a sofort PaymentMethod, this hash contains details about the SOFORT payment method.
    public var sofort: PaymentMethodSofort?
    /// If this is a `sunbit` PaymentMethod, this hash contains details about the Sunbit payment method.
    public var sunbit: PaymentMethodSunbit?
    /// If this is a `swish` PaymentMethod, this hash contains details about the Swish payment method.
    public var swish: PaymentMethodSwish?
    /// If this is a `twint` PaymentMethod, this hash contains details about the TWINT payment method.
    public var twint: PaymentMethodTwint?
    /// If this is an `upi` PaymentMethod, this hash contains details about the UPI payment method.
    public var upi: PaymentMethodUpi?
    /// If this is an `us_bank_account` PaymentMethod, this hash contains details about the US bank account payment method.
    public var usBankAccount: PaymentMethodUSBankAccount?
    /// If this is an `wechat_pay` PaymentMethod, this hash contains details about the `wechat_pay` payment method.
    public var wechatPay: PaymentMethodWechatPay?
    /// If this is a `zip` PaymentMethod, this hash contains details about the Zip payment method.
    public var zip: PaymentMethodZip?

    public init(id: String,
                billingDetails: BillingDetails? = nil,
                customer: String? = nil,
                metadata: [String : String]? = nil,
                type: PaymentMethodType? = nil,
                object: String,
                allowRedisplay: PaymentMethodAllowRedisplay? = nil,
                acssDebit: PaymentMethodAcssDebit? = nil,
                affirm: PaymentMethodAffirm? = nil,
                afterpayClearpay: PaymentMethodAfterpayClearpay? = nil,
                alipay: PaymentMethodAlipay? = nil,
                alma: PaymentMethodAlma? = nil,
                amazonPay: PaymentMethodAmazonPay? = nil,
                auBecsDebit: PaymentMethodAuBecsDebit? = nil,
                bacsDebit: PaymentMethodBacsDebit? = nil,
                bancontact: PaymentMethodBancontact? = nil,
                billie: PaymentMethodBillie? = nil,
                bizum: PaymentMethodBizum? = nil,
                blik: PaymentMethodBlik? = nil,
                boleto: PaymentMethodBoleto? = nil,
                card: PaymentMethodCard? = nil,
                cardPresent: PaymentMethodCardPresent? = nil,
                cashapp: PaymentMethodCashapp? = nil,
                crypto: PaymentMethodCrypto? = nil,
                custom: PaymentMethodCustom? = nil,
                created: Date,
                customerBalance: PaymentMethodCustomerBalance? = nil,
                eps: PaymentMethodEps? = nil,
                fpx: PaymentMethodFpx? = nil,
                giropay: PaymentMethodGiropay? = nil,
                grabpay: PaymentMethodGrabpay? = nil,
                ideal: PaymentMethodIdeal? = nil,
                interacPresent: PaymentMethodInteractPresent? = nil,
                kakaoPay: PaymentMethodKakaoPay? = nil,
                klarna: PaymentMethodKlarna? = nil,
                konbini: PaymentMethodKonbini? = nil,
                krCard: PaymentMethodKrCard? = nil,
                link: PaymentMethodLink? = nil,
                livemode: Bool? = nil,
                mbWay: PaymentMethodMbWay? = nil,
                mobilepay: PaymentMethodMobilepay? = nil,
                multibanco: PaymentMethodMultibanco? = nil,
                naverPay: PaymentMethodNaverPay? = nil,
                nzBankAccount: PaymentMethodNzBankAccount? = nil,
                oxxo: PaymentMethodOXXO? = nil,
                p24: PaymentMethodP24? = nil,
                payByBank: PaymentMethodPayByBank? = nil,
                payco: PaymentMethodPayco? = nil,
                paynow: PaymentMethodPaynow? = nil,
                paypal: PaymentMethodPaypal? = nil,
                paypay: PaymentMethodPaypay? = nil,
                payto: PaymentMethodPayto? = nil,
                pix: PaymentMethodPix? = nil,
                promptpay: PaymentMethodPromptPay? = nil,
                radarOptions: PaymentMethodRadarOptions? = nil,
                revolutPay: PaymentMethodRevolutPay? = nil,
                samsungPay: PaymentMethodSamsungPay? = nil,
                satispay: PaymentMethodSatispay? = nil,
                scalapay: PaymentMethodScalapay? = nil,
                sepaDebit: PaymentMethodSepaDebit? = nil,
                sofort: PaymentMethodSofort? = nil,
                sunbit: PaymentMethodSunbit? = nil,
                swish: PaymentMethodSwish? = nil,
                twint: PaymentMethodTwint? = nil,
                upi: PaymentMethodUpi? = nil,
                usBankAccount: PaymentMethodUSBankAccount? = nil,
                wechatPay: PaymentMethodWechatPay? = nil,
                zip: PaymentMethodZip? = nil) {
        self.id = id
        self.billingDetails = billingDetails
        self._customer = Expandable(id: customer)
        self.metadata = metadata
        self.type = type
        self.object = object
        self.allowRedisplay = allowRedisplay
        self.acssDebit = acssDebit
        self.affirm = affirm
        self.afterpayClearpay = afterpayClearpay
        self.alipay = alipay
        self.alma = alma
        self.amazonPay = amazonPay
        self.auBecsDebit = auBecsDebit
        self.bacsDebit = bacsDebit
        self.bancontact = bancontact
        self.billie = billie
        self.bizum = bizum
        self.blik = blik
        self.boleto = boleto
        self.card = card
        self.cardPresent = cardPresent
        self.cashapp = cashapp
        self.crypto = crypto
        self.custom = custom
        self.created = created
        self.customerBalance = customerBalance
        self.eps = eps
        self.fpx = fpx
        self.giropay = giropay
        self.grabpay = grabpay
        self.ideal = ideal
        self.interacPresent = interacPresent
        self.kakaoPay = kakaoPay
        self.klarna = klarna
        self.konbini = konbini
        self.krCard = krCard
        self.link = link
        self.livemode = livemode
        self.mbWay = mbWay
        self.mobilepay = mobilepay
        self.multibanco = multibanco
        self.naverPay = naverPay
        self.nzBankAccount = nzBankAccount
        self.oxxo = oxxo
        self.p24 = p24
        self.payByBank = payByBank
        self.payco = payco
        self.paynow = paynow
        self.paypal = paypal
        self.paypay = paypay
        self.payto = payto
        self.pix = pix
        self.promptpay = promptpay
        self.radarOptions = radarOptions
        self.revolutPay = revolutPay
        self.samsungPay = samsungPay
        self.satispay = satispay
        self.scalapay = scalapay
        self.sepaDebit = sepaDebit
        self.sofort = sofort
        self.sunbit = sunbit
        self.swish = swish
        self.twint = twint
        self.upi = upi
        self.usBankAccount = usBankAccount
        self.wechatPay = wechatPay
        self.zip = zip
    }
}

public enum PaymentMethodAllowRedisplay: String, Codable, Sendable {
    /// Use `always` to indicate that this payment method can always be shown to a customer in a checkout flow.
    case always
    /// Use `limited` to indicate that this payment method can't always be shown to a customer in a checkout flow.
    case limited
    /// This is the default value for payment methods where `allow_redisplay` wasn't set.
    case unspecified
}

public enum PaymentMethodType: String, Codable, Sendable {
    case acssDebit = "acss_debit"
    case affirm
    case afterpayClearpay = "afterpay_clearpay"
    case alipay
    case alma
    case amazonPay = "amazon_pay"
    case auBecsDebit = "au_becs_debit"
    case bacsDebit = "bacs_debit"
    case bancontact
    case billie
    case bizum
    case blik
    case boleto
    case card
    case cardPresent = "card_present"
    case cashapp
    case crypto
    case custom
    case customerBalance = "customer_balance"
    case eps
    case fpx
    case giropay
    case grabpay
    case ideal
    case interacPresent = "interac_present"
    case kakaoPay = "kakao_pay"
    case klarna
    case konbini
    case krCard = "kr_card"
    case link
    case mbWay = "mb_way"
    case mobilepay
    case multibanco
    case naverPay = "naver_pay"
    case nzBankAccount = "nz_bank_account"
    case oxxo
    case p24
    case payByBank = "pay_by_bank"
    case payco
    case paynow
    case paypal
    case paypay
    case payto
    case pix
    case promptpay
    case revolutPay = "revolut_pay"
    case samsungPay = "samsung_pay"
    case satispay
    case scalapay
    case sepaDebit = "sepa_debit"
    case sofort
    case sunbit
    case swish
    case twint
    case upi
    case usBankAccount = "us_bank_account"
    case wechatPay = "wechat_pay"
    case zip
}

public struct PaymentMethodRadarOptions: Codable, Sendable {
    /// A Radar Session is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments.
    public var session: String?
    
    public init(session: String? = nil) {
        self.session = session
    }
}

public struct PaymentMethodList: Codable, Sendable {
    public var object: String
    public var data: [PaymentMethod]?
    public var hasMore: Bool?
    public var url: String?
    
    public init(object: String,
                data: [PaymentMethod]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}
