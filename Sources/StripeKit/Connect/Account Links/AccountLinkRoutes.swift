//
//  AccountLinkRoutes.swift
//  
//
//  Created by Andrew Edwards on 11/3/19.
//

import NIO
import NIOHTTP1
import Foundation

public protocol AccountLinkRoutes: StripeAPIRoute {
    
    /// Creates an AccountLink object that returns a single-use Stripe URL that the user can redirect their user to in order to take them through the Connect Onboarding flow.
    /// - Parameters:
    ///  - account: The identifier of the account to create an account link for.
    ///  - refreshUrl: The URL the user will be redirected to if the account link is expired, has been previously-visited, or is otherwise invalid. The URL you specify should attempt to generate a new account link with the same parameters used to create the original account link, then redirect the user to the new account link’s URL so they can continue with Connect Onboarding. If a new account link cannot be generated or the redirect fails you should display a useful error to the user.
    ///  - returnUrl: The URL that the user will be redirected to upon leaving or completing the linked flow.
    ///  - type: The type of account link the user is requesting. Possible values are `account_onboarding` or `account_update`.
    ///  - collect: The information the platform wants to collect from users up-front. Possible values are `currently_due` and `eventually_due`. This parameter is deprecated; use `collectionOptions` instead.
    ///  - collectionOptions: Specifies the requirements that Stripe collects from connected accounts in the Connect Onboarding flow.
    func create(account: String,
                refreshUrl: String,
                returnUrl: String,
                type: AccountLinkCreationType,
                collect: AccountLinkCreationCollectType?,
                collectionOptions: AccountLinkCollectionOptions?) async throws -> AccountLink
}

public struct StripeAccountLinkRoutes: AccountLinkRoutes {
    public var headers: HTTPHeaders = [:]
    
    private let apiHandler: StripeAPIHandler
    private let accountlinks = APIBase + APIVersion + "account_links"
    
    init(apiHandler: StripeAPIHandler) {
        self.apiHandler = apiHandler
    }
    
    public func create(account: String,
                       refreshUrl: String,
                       returnUrl: String,
                       type: AccountLinkCreationType,
                       collect: AccountLinkCreationCollectType? = nil,
                       collectionOptions: AccountLinkCollectionOptions? = nil) async throws -> AccountLink {
        var body: [String: Any] = ["account": account,
                                   "refresh_url": refreshUrl,
                                   "return_url": returnUrl,
                                   "type": type.rawValue]

        if let collect {
            body["collect"] = collect.rawValue
        }

        if let collectionOptions {
            if let fields = collectionOptions.fields {
                body["collection_options[fields]"] = fields.rawValue
            }
            if let futureRequirements = collectionOptions.futureRequirements {
                body["collection_options[future_requirements]"] = futureRequirements.rawValue
            }
        }

        return try await apiHandler.send(method: .POST, path: accountlinks, body: .string(body.queryParameters), headers: headers)
    }
}
