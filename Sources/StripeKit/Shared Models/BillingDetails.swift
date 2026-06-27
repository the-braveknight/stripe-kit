//
//  BillingDetails.swift
//  Stripe
//
//  Created by Andrew Edwards on 4/15/19.
//

public struct BillingDetails: Codable {
    /// Billing address.
    public var address: Address?
    /// Email address.
    public var email: String?
    /// Full name.
    public var name: String?
    /// Billing phone number (including extension).
    public var phone: String?
    /// Taxpayer identification number. Used only for transactions between LATAM buyers and non-LATAM sellers.
    public var taxId: String?

    public init(address: Address? = nil,
                email: String? = nil,
                name: String? = nil,
                phone: String? = nil,
                taxId: String? = nil) {
        self.address = address
        self.email = email
        self.name = name
        self.phone = phone
        self.taxId = taxId
    }
}
