//
//  AccountLink.swift
//  
//
//  Created by Andrew Edwards on 11/3/19.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Account Link Object](https://stripe.com/docs/api/account_links/object) .
public struct AccountLink: Codable {
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date
    /// The timestamp at which this account link will expire.
    public var expiresAt: Date?
    /// The URL for the account link.
    public var url: String?
    
    public init(object: String,
                created: Date,
                expiresAt: Date? = nil,
                url: String? = nil) {
        self.object = object
        self.created = created
        self.expiresAt = expiresAt
        self.url = url
    }
}

public enum AccountLinkCreationType: String, Codable {
    /// Provides a form for inputting outstanding requirements. Send the user to the form in this mode to just collect the new information you need.
    case accountOnboarding = "account_onboarding"
    /// Displays the fields that are already populated on the account object, and allows your user to edit previously provided information. Consider framing this as “edit my profile” or “update my verification information”.
    case accountUpdate = "account_update"
}

public enum AccountLinkCreationCollectType: String, Codable {
    case currentlyDue = "currently_due"
    case eventuallyDue = "eventually_due"
}

/// Specifies the requirements that Stripe collects from connected accounts in the Connect Onboarding flow.
public struct AccountLinkCollectionOptions: Codable {
    /// Specifies whether the platform collects only currently_due requirements (`currently_due`) or both currently_due and eventually_due requirements (`eventually_due`). If you don't specify `collection_options`, the default value is `currently_due`.
    public var fields: AccountLinkCreationCollectType?
    /// Specifies whether the platform collects future_requirements in addition to requirements in Connect Onboarding. The default value is `omit`.
    public var futureRequirements: AccountLinkCollectionOptionsFutureRequirements?

    public init(fields: AccountLinkCreationCollectType? = nil,
                futureRequirements: AccountLinkCollectionOptionsFutureRequirements? = nil) {
        self.fields = fields
        self.futureRequirements = futureRequirements
    }
}

public enum AccountLinkCollectionOptionsFutureRequirements: String, Codable {
    /// Collect future_requirements in addition to current requirements.
    case include
    /// Don't collect future_requirements.
    case omit
}
