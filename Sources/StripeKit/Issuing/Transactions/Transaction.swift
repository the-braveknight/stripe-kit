//
//  Transaction.swift
//  Stripe
//
//  Created by Andrew Edwards on 5/29/19.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct Transaction: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// The amount of this transaction in your currency. This is the amount that your balance will be updated by.
    public var amount: Int?
    /// The Authorization object that led to this transaction.
    @Expandable<Authorization> public var authorization: String?
    /// The card used to make this transaction.
    @Expandable<IssuingCard> public var card: String?
    /// The cardholder to whom this transaction belongs.
    @Expandable<Cardholder> public var cardholder: String?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: Currency?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The nature of the transaction.
    public var type: TransactionType?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Detailed breakdown of amount components. These amounts are denominated in currency and in the smallest currency unit.
    public var amountDetails: TransactionAmountDetails?
    /// ID of the balance transaction associated with this transaction.
    @Expandable<BalanceTransaction> public var balanceTransaction: String?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// If you’ve disputed the transaction, the ID of the dispute.
    @Expandable<IssuingDispute> public var dispute: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// The amount that the merchant will receive, denominated in `merchant_currency`. It will be different from `amount` if the merchant is taking payment in a different currency.
    public var merchantAmount: Int?
    /// The currency with which the merchant is taking payment.
    public var merchantCurrency: Currency?
    /// More information about the user involved in the transaction.
    public var merchantData: AuthorizationMerchantData?
    /// Details about the transaction, such as processing dates, set by the card network.
    public var networkData: TransactionNetworkData?
    /// Additional purchase information that is optionally provided by the merchant. This field is not included by default. To include it in the response, expand the `purchase_details` field.
    public var purchaseDetails: TransactionPurchaseDetails?
    /// The ID of the Token object used for this transaction, if any.
    public var token: String?
    /// The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`.
    public var wallet: TransactionWallet?

    public init(id: String,
                amount: Int? = nil,
                authorization: String? = nil,
                card: String? = nil,
                cardholder: String? = nil,
                currency: Currency? = nil,
                metadata: [String : String]? = nil,
                type: TransactionType? = nil,
                object: String,
                amountDetails: TransactionAmountDetails? = nil,
                balanceTransaction: String? = nil,
                created: Date,
                dispute: String? = nil,
                livemode: Bool? = nil,
                merchantAmount: Int? = nil,
                merchantCurrency: Currency? = nil,
                merchantData: AuthorizationMerchantData? = nil,
                networkData: TransactionNetworkData? = nil,
                purchaseDetails: TransactionPurchaseDetails? = nil,
                token: String? = nil,
                wallet: TransactionWallet? = nil) {
        self.id = id
        self.amount = amount
        self._authorization = Expandable(id: authorization)
        self._card = Expandable(id: card)
        self._cardholder = Expandable(id: cardholder)
        self.currency = currency
        self.metadata = metadata
        self.type = type
        self.object = object
        self.amountDetails = amountDetails
        self._balanceTransaction = Expandable(id: balanceTransaction)
        self.created = created
        self._dispute = Expandable(id: dispute)
        self.livemode = livemode
        self.merchantAmount = merchantAmount
        self.merchantCurrency = merchantCurrency
        self.merchantData = merchantData
        self.networkData = networkData
        self.purchaseDetails = purchaseDetails
        self.token = token
        self.wallet = wallet
    }
}

public struct TransactionAmountDetails: Codable, Sendable {
    /// The fee charged by the ATM for the cash withdrawal.
    public var atmFee: Int?
    /// The amount of cash requested by the cardholder.
    public var cashbackAmount: Int?

    public init(atmFee: Int? = nil,
                cashbackAmount: Int? = nil) {
        self.atmFee = atmFee
        self.cashbackAmount = cashbackAmount
    }
}

public struct TransactionNetworkData: Codable, Sendable {
    /// A code created by Stripe which is shared with the merchant to validate the authorization. This field will be populated if the authorization message was approved. The code typically starts with the letter "S", followed by a six-digit number. For example, "S498162". Please note that the code is not guaranteed to be unique across authorizations.
    public var authorizationCode: String?
    /// The date the transaction was processed by the card network. This can be different from the date the transaction was created.
    public var processingDate: String?
    /// Unique identifier for the authorization assigned by the card network used to match subsequent messages, disputes, and transactions.
    public var transactionId: String?

    public init(authorizationCode: String? = nil,
                processingDate: String? = nil,
                transactionId: String? = nil) {
        self.authorizationCode = authorizationCode
        self.processingDate = processingDate
        self.transactionId = transactionId
    }
}

public struct TransactionList: Codable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [Transaction]?
    
    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [Transaction]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}

public enum TransactionType: String, Codable, Sendable {
    /// Funds were captured by the acquirer. `amount` will be negative as funds are moving out of your balance. Not all captures will be linked to an authorization, as acquirers can force capture in some cases.
    case capture
    /// An acquirer initiated a refund. This transaction might not be linked to an original capture, for example credits are original transactions. `amount` will be positive for refunds and negative for refund reversals.
    case refund
}

public struct TransactionPurchaseDetails: Codable, Sendable {
    /// Fleet-specific information for transactions using Fleet cards.
    public var fleet: TransactionPurchaseDetailsFleet?
    /// Information about the flight that was purchased with this transaction.
    public var flight: TransactionPurchaseDetailsFlight?
    /// Information about fuel that was purchased with this transaction.
    public var fuel: TransactionPurchaseDetailsFuel?
    /// Information about lodging that was purchased with this transaction.
    public var lodging: TransactionPurchaseDetailsLodging?
    /// The line items in the purchase.
    public var receipt: [TransactionPurchaseDetailsReceipt]?
    /// A merchant-specific order number.
    public var reference: String?

    public init(fleet: TransactionPurchaseDetailsFleet? = nil,
                flight: TransactionPurchaseDetailsFlight? = nil,
                fuel: TransactionPurchaseDetailsFuel? = nil,
                lodging: TransactionPurchaseDetailsLodging? = nil,
                receipt: [TransactionPurchaseDetailsReceipt]? = nil,
                reference: String? = nil) {
        self.fleet = fleet
        self.flight = flight
        self.fuel = fuel
        self.lodging = lodging
        self.receipt = receipt
        self.reference = reference
    }
}

public struct TransactionPurchaseDetailsFleet: Codable, Sendable {
    /// Answers to prompts presented to the cardholder at the point of sale.
    public var cardholderPromptData: TransactionPurchaseDetailsFleetCardholderPromptData?
    /// The type of purchase. One of `fuel_purchase`, `non_fuel_purchase`, or `fuel_and_non_fuel_purchase`.
    public var purchaseType: TransactionPurchaseDetailsFleetPurchaseType?
    /// More information about the total amount. This information is not guaranteed to be accurate as some merchants may provide unreliable data.
    public var reportedBreakdown: TransactionPurchaseDetailsFleetReportedBreakdown?
    /// The type of fuel service. One of `non_fuel_transaction`, `full_service`, or `self_service`.
    public var serviceType: TransactionPurchaseDetailsFleetServiceType?

    public init(cardholderPromptData: TransactionPurchaseDetailsFleetCardholderPromptData? = nil,
                purchaseType: TransactionPurchaseDetailsFleetPurchaseType? = nil,
                reportedBreakdown: TransactionPurchaseDetailsFleetReportedBreakdown? = nil,
                serviceType: TransactionPurchaseDetailsFleetServiceType? = nil) {
        self.cardholderPromptData = cardholderPromptData
        self.purchaseType = purchaseType
        self.reportedBreakdown = reportedBreakdown
        self.serviceType = serviceType
    }
}

public struct TransactionPurchaseDetailsFleetCardholderPromptData: Codable, Sendable {
    /// Driver ID.
    public var driverId: String?
    /// Odometer reading.
    public var odometer: Int?
    /// An alphanumeric ID. This field is used when a vehicle ID, driver ID, or generic ID is entered by the cardholder, but the merchant or card network did not specify the prompt type.
    public var unspecifiedId: String?
    /// User ID.
    public var userId: String?
    /// Vehicle number.
    public var vehicleNumber: String?

    public init(driverId: String? = nil,
                odometer: Int? = nil,
                unspecifiedId: String? = nil,
                userId: String? = nil,
                vehicleNumber: String? = nil) {
        self.driverId = driverId
        self.odometer = odometer
        self.unspecifiedId = unspecifiedId
        self.userId = userId
        self.vehicleNumber = vehicleNumber
    }
}

public enum TransactionPurchaseDetailsFleetPurchaseType: String, Codable, Sendable {
    case fuelPurchase = "fuel_purchase"
    case nonFuelPurchase = "non_fuel_purchase"
    case fuelAndNonFuelPurchase = "fuel_and_non_fuel_purchase"
}

public enum TransactionPurchaseDetailsFleetServiceType: String, Codable, Sendable {
    case nonFuelTransaction = "non_fuel_transaction"
    case fullService = "full_service"
    case selfService = "self_service"
}

public struct TransactionPurchaseDetailsFleetReportedBreakdown: Codable, Sendable {
    /// Breakdown of fuel portion of the purchase.
    public var fuel: TransactionPurchaseDetailsFleetReportedBreakdownFuel?
    /// Breakdown of non-fuel portion of the purchase.
    public var nonFuel: TransactionPurchaseDetailsFleetReportedBreakdownNonFuel?
    /// Information about tax included in this transaction.
    public var tax: TransactionPurchaseDetailsFleetReportedBreakdownTax?

    public init(fuel: TransactionPurchaseDetailsFleetReportedBreakdownFuel? = nil,
                nonFuel: TransactionPurchaseDetailsFleetReportedBreakdownNonFuel? = nil,
                tax: TransactionPurchaseDetailsFleetReportedBreakdownTax? = nil) {
        self.fuel = fuel
        self.nonFuel = nonFuel
        self.tax = tax
    }
}

public struct TransactionPurchaseDetailsFleetReportedBreakdownFuel: Codable, Sendable {
    /// Gross fuel amount that should equal Fuel Volume multipled by Fuel Unit Cost, inclusive of taxes.
    public var grossAmountDecimal: String?

    public init(grossAmountDecimal: String? = nil) {
        self.grossAmountDecimal = grossAmountDecimal
    }
}

public struct TransactionPurchaseDetailsFleetReportedBreakdownNonFuel: Codable, Sendable {
    /// Gross non-fuel amount that should equal the sum of the line items, inclusive of taxes.
    public var grossAmountDecimal: String?

    public init(grossAmountDecimal: String? = nil) {
        self.grossAmountDecimal = grossAmountDecimal
    }
}

public struct TransactionPurchaseDetailsFleetReportedBreakdownTax: Codable, Sendable {
    /// Amount of state or provincial Sales Tax included in the transaction amount. Null if not reported by merchant or not subject to tax.
    public var localAmountDecimal: String?
    /// Amount of national Sales Tax or VAT included in the transaction amount. Null if not reported by merchant or not subject to tax.
    public var nationalAmountDecimal: String?

    public init(localAmountDecimal: String? = nil,
                nationalAmountDecimal: String? = nil) {
        self.localAmountDecimal = localAmountDecimal
        self.nationalAmountDecimal = nationalAmountDecimal
    }
}

public struct TransactionPurchaseDetailsFlight: Codable, Sendable {
    /// The time that the flight departed.
    public var departureAt: Int?
    /// The name of the passenger.
    public var passengerName: String?
    /// Whether the ticket is refundable.
    public var refundable: Bool?
    /// The legs of the trip.
    public var segments: [TransactionPurchaseDetailsFlightSegment]?
    /// The travel agency that issued the ticket.
    public var travelAgency: String?
    
    public init(departureAt: Int? = nil,
                passengerName: String? = nil,
                refundable: Bool? = nil,
                segments: [TransactionPurchaseDetailsFlightSegment]? = nil,
                travelAgency: String? = nil) {
        self.departureAt = departureAt
        self.passengerName = passengerName
        self.refundable = refundable
        self.segments = segments
        self.travelAgency = travelAgency
    }
}

public struct TransactionPurchaseDetailsFlightSegment: Codable, Sendable {
    /// The three-letter IATA airport code of the flight’s destination.
    public var arrivalAirportCode: String?
    /// The airline carrier code.
    public var carrier: String?
    /// The three-letter IATA airport code that the flight departed from.
    public var departureAirportCode: String?
    /// The flight number.
    public var flightNumber: String?
    /// The flight’s service class.
    public var serviceClass: String?
    /// Whether a stopover is allowed on this flight.
    public var stopoverAllowed: Bool?

    public init(arrivalAirportCode: String? = nil,
                carrier: String? = nil,
                departureAirportCode: String? = nil,
                flightNumber: String? = nil,
                serviceClass: String? = nil,
                stopoverAllowed: Bool? = nil) {
        self.arrivalAirportCode = arrivalAirportCode
        self.carrier = carrier
        self.departureAirportCode = departureAirportCode
        self.flightNumber = flightNumber
        self.serviceClass = serviceClass
        self.stopoverAllowed = stopoverAllowed
    }
}

public struct TransactionPurchaseDetailsFuel: Codable, Sendable {
    /// [Conexxus Payment System Product Code](https://www.conexxus.org/conexxus-payment-system-product-codes) identifying the primary fuel product purchased.
    public var industryProductCode: String?
    /// The quantity of `unit`s of fuel that was dispensed, represented as a decimal string with at most 12 decimal places.
    public var quantityDecimal: String?
    /// The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`.
    public var type: TransactionPurchaseDetailsFuelType?
    /// The units for `quantity_decimal`. One of `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `pound`, `us_gallon`, or `other`.
    public var unit: TransactionPurchaseDetailsFuelUnit?
    /// The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places.
    public var unitCostDecimal: String?
    /// The volume of the fuel that was pumped, represented as a decimal string with at most 12 decimal places.
    public var volumeDecimal: String?

    public init(industryProductCode: String? = nil,
                quantityDecimal: String? = nil,
                type: TransactionPurchaseDetailsFuelType? = nil,
                unit: TransactionPurchaseDetailsFuelUnit? = nil,
                unitCostDecimal: String? = nil,
                volumeDecimal: String? = nil) {
        self.industryProductCode = industryProductCode
        self.quantityDecimal = quantityDecimal
        self.type = type
        self.unit = unit
        self.unitCostDecimal = unitCostDecimal
        self.volumeDecimal = volumeDecimal
    }
}

public enum TransactionPurchaseDetailsFuelType: String, Codable, Sendable {
    case diesel
    case unleadedPlus = "unleaded_plus"
    case unleadedRegular = "unleaded_regular"
    case unleadedSuper = "unleaded_super"
    case other
}

public enum TransactionPurchaseDetailsFuelUnit: String, Codable, Sendable {
    case chargingMinute = "charging_minute"
    case imperialGallon = "imperial_gallon"
    case kilogram
    case kilowattHour = "kilowatt_hour"
    case liter
    case pound
    case usGallon = "us_gallon"
    case other
}

public struct TransactionPurchaseDetailsLodging: Codable, Sendable {
    /// The time of checking into the lodging.
    public var checkInAt: Int?
    /// The number of nights stayed at the lodging.
    public var nights: Int?
    
    public init(checkInAt: Int? = nil, nights: Int? = nil) {
        self.checkInAt = checkInAt
        self.nights = nights
    }
}

public struct TransactionPurchaseDetailsReceipt: Codable, Sendable {
    /// The description of the item. The maximum length of this field is 26 characters.
    public var description: String?
    /// The quantity of the item.
    public var quantity: Decimal?
    /// The total for this line item in cents.
    public var total: Int?
    /// The unit cost of the item in cents.
    public var unitCost: Int?
    
    public init(description: String? = nil,
                quantity: Decimal? = nil,
                total: Int? = nil,
                unitCost: Int? = nil) {
        self.description = description
        self.quantity = quantity
        self.total = total
        self.unitCost = unitCost
    }
}

public enum TransactionWallet: String, Codable, Sendable {
    case applePay = "apple_pay"
    case googlePay = "google_pay"
    case samsungPay = "samsung_pay"
}
