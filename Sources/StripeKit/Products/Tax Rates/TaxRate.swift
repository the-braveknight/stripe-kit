//
//  TaxRate.swift
//  Stripe
//
//  Created by Andrew Edwards on 5/12/19.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Tax Rate Object](https://stripe.com/docs/api/tax_rates/object)
public struct TaxRate: Codable, Sendable {
    /// Unique identifier for the object.
    public var id: String
    /// Defaults to true. When set to false, this tax rate cannot be applied to objects in the API, but will still be applied to subscriptions and invoices that already have it set.
    public var active: Bool?
    /// Two-letter country code.
    public var country: String?
    /// An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
    public var description: String?
    /// The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
    public var displayName: String?
    /// Actual/effective tax rate percentage out of 100. For tax calculations with `automatic_tax[enabled]=true`, this percentage reflects the rate actually used to calculate tax based on the product's taxability and whether the user is registered to collect taxes in the corresponding jurisdiction.
    public var effectivePercentage: Decimal?
    /// The amount of the tax rate when the `rate_type` is `flat_amount`. Tax rates with `rate_type` `percentage` can vary based on the transaction, resulting in this field being `null`. This field exposes the amount and currency of the flat tax rate.
    public var flatAmount: TaxRateFlatAmount?
    /// This specifies if the tax rate is inclusive or exclusive.
    public var inclusive: Bool?
    /// The jurisdiction for the tax rate.
    public var jurisdiction: String?
    /// The level of the jurisdiction that imposes this tax rate.
    public var jurisdictionLevel: TaxRateJurisdictionLevel?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Tax rate percentage out of 100. For tax calculations with `automatic_tax[enabled]=true`, this percentage includes the statutory tax rate of non-taxable jurisdictions.
    public var percentage: Decimal?
    /// Indicates the type of tax rate applied to the taxable amount. This value can be `null` when no tax applies to the location.
    public var rateType: TaxRateRateType?
    /// ISO 3166-2 subdivision code, without country prefix. For example, “NY” for New York, United States.
    public var state: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// The high-level tax type, such as `vat` or `sales_tax`.
    public var taxType: TaxRateTaxType?

    public init(id: String,
                active: Bool? = nil,
                country: String? = nil,
                description: String? = nil,
                displayName: String? = nil,
                effectivePercentage: Decimal? = nil,
                flatAmount: TaxRateFlatAmount? = nil,
                inclusive: Bool? = nil,
                jurisdiction: String? = nil,
                jurisdictionLevel: TaxRateJurisdictionLevel? = nil,
                metadata: [String : String]? = nil,
                percentage: Decimal? = nil,
                rateType: TaxRateRateType? = nil,
                state: String? = nil,
                object: String,
                created: Date,
                livemode: Bool? = nil,
                taxType: TaxRateTaxType? = nil) {
        self.id = id
        self.active = active
        self.country = country
        self.description = description
        self.displayName = displayName
        self.effectivePercentage = effectivePercentage
        self.flatAmount = flatAmount
        self.inclusive = inclusive
        self.jurisdiction = jurisdiction
        self.jurisdictionLevel = jurisdictionLevel
        self.metadata = metadata
        self.percentage = percentage
        self.rateType = rateType
        self.state = state
        self.object = object
        self.created = created
        self.livemode = livemode
        self.taxType = taxType
    }
}

public struct TaxRateFlatAmount: Codable, Sendable {
    /// Amount of the tax when the `rate_type` is `flat_amount`. This positive integer represents how much to charge in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency).
    public var amount: Int?
    /// Three-letter ISO currency code, in lowercase.
    public var currency: Currency?

    public init(amount: Int? = nil,
                currency: Currency? = nil) {
        self.amount = amount
        self.currency = currency
    }
}

public enum TaxRateJurisdictionLevel: String, Codable, Sendable {
    case city
    case country
    case county
    case district
    case multiple
    case state
}

public enum TaxRateRateType: String, Codable, Sendable {
    /// A fixed amount applied as tax, regardless of the taxable amount, such as a retail delivery fee.
    case flatAmount = "flat_amount"
    /// A tax rate expressed as a percentage of the taxable amount, such as the sales tax rate in California.
    case percentage
}

public enum TaxRateTaxType: String, Codable, Sendable {
    case admissionsTax = "admissions_tax"
    case amusementTax = "amusement_tax"
    case attendanceTax = "attendance_tax"
    case communicationsTax = "communications_tax"
    case entertainmentTax = "entertainment_tax"
    case grossReceiptsTax = "gross_receipts_tax"
    case gst
    case hospitalityTax = "hospitality_tax"
    case hst
    case igst
    case jct
    case leaseTax = "lease_tax"
    case luxuryTax = "luxury_tax"
    case pst
    case qst
    case resortTax = "resort_tax"
    case retailDeliveryFee = "retail_delivery_fee"
    case rst
    case salesTax = "sales_tax"
    case serviceTax = "service_tax"
    case tourismTax = "tourism_tax"
    case vat
}

public struct TaxRateList: Codable, Sendable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [TaxRate]?
    
    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [TaxRate]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}
