//
//  TerminalConfigurationRoutes.swift
//  
//
//  Created by Andrew Edwards on 5/17/23.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
import NIO
import NIOHTTP1

public protocol TerminalConfigurationRoutes: StripeAPIRoute {
    /// Creates a new ``TerminalConfiguration`` object.
    /// - Parameters:
    ///   - bbposWisepad3: An object containing device type specific settings for BBPOS WisePad 3 readers
    ///   - bbposWiseposE: An object containing device type specific settings for BBPOS WisePOS E readers
    ///   - cellular: An object containing the cellular connectivity settings.
    ///   - name: Name of the configuration
    ///   - offline: Configurations for collecting transactions offline.
    ///   - readerSecurity: Reader-specific security settings.
    ///   - rebootWindow: Reboot time settings for readers that support customized reboot time configuration.
    ///   - stripeS700: An object containing device type specific settings for the Stripe Reader S700
    ///   - stripeS710: An object containing device type specific settings for the Stripe Reader S710
    ///   - tipping: Tipping configurations for readers supporting on-reader tips
    ///   - verifoneM425: An object containing device type specific settings for Verifone M425 readers
    ///   - verifoneP400: An object containing device type specific settings for Verifone P400 readers
    ///   - verifoneP630: An object containing device type specific settings for Verifone P630 readers
    ///   - verifoneUx700: An object containing device type specific settings for Verifone UX700 readers
    ///   - verifoneV660p: An object containing device type specific settings for Verifone V660p readers
    ///   - wifi: An object containing the WiFi network settings.
    ///   - expand: An array of properties to expand
    /// - Returns: Returns a ``TerminalConfiguration`` object if creation succeeds.
    func create(bbposWisepad3: [String: Any]?,
                bbposWiseposE: [String: Any]?,
                cellular: [String: Any]?,
                name: String?,
                offline: [String: Any]?,
                readerSecurity: [String: Any]?,
                rebootWindow: [String: Any]?,
                stripeS700: [String: Any]?,
                stripeS710: [String: Any]?,
                tipping: [String: Any]?,
                verifoneM425: [String: Any]?,
                verifoneP400: [String: Any]?,
                verifoneP630: [String: Any]?,
                verifoneUx700: [String: Any]?,
                verifoneV660p: [String: Any]?,
                wifi: [String: Any]?,
                expand: [String]?) async throws -> TerminalConfiguration
    
    /// Retrieves a ``TerminalConfiguration`` object.
    /// - Parameters:
    ///   - config: The id of the configuration.
    ///   - expand: Specifies which fields in the response should be expanded.
    /// - Returns: Returns a ``TerminalConfiguration`` object if a valid identifier was provided.
    func retrieve(config: String, expand: [String]?) async throws -> TerminalConfiguration
    
    
    /// Updates a new ``TerminalConfiguration`` object.
    /// - Parameters:
    ///   - config: The id of the configuration.
    ///   - bbposWisepad3: An object containing device type specific settings for BBPOS WisePad 3 readers
    ///   - bbposWiseposE: An object containing device type specific settings for BBPOS WisePOS E readers
    ///   - cellular: An object containing the cellular connectivity settings.
    ///   - name: Name of the configuration
    ///   - offline: Configurations for collecting transactions offline.
    ///   - readerSecurity: Reader-specific security settings.
    ///   - rebootWindow: Reboot time settings for readers that support customized reboot time configuration.
    ///   - stripeS700: An object containing device type specific settings for the Stripe Reader S700
    ///   - stripeS710: An object containing device type specific settings for the Stripe Reader S710
    ///   - tipping: Tipping configurations for readers supporting on-reader tips
    ///   - verifoneM425: An object containing device type specific settings for Verifone M425 readers
    ///   - verifoneP400: An object containing device type specific settings for Verifone P400 readers
    ///   - verifoneP630: An object containing device type specific settings for Verifone P630 readers
    ///   - verifoneUx700: An object containing device type specific settings for Verifone UX700 readers
    ///   - verifoneV660p: An object containing device type specific settings for Verifone V660p readers
    ///   - wifi: An object containing the WiFi network settings.
    ///   - expand: An array of properties to expand
    /// - Returns: Returns a ``TerminalConfiguration`` object if the update succeeds.
    func update(config: String,
                bbposWisepad3: [String: Any]?,
                bbposWiseposE: [String: Any]?,
                cellular: [String: Any]?,
                name: String?,
                offline: [String: Any]?,
                readerSecurity: [String: Any]?,
                rebootWindow: [String: Any]?,
                stripeS700: [String: Any]?,
                stripeS710: [String: Any]?,
                tipping: [String: Any]?,
                verifoneM425: [String: Any]?,
                verifoneP400: [String: Any]?,
                verifoneP630: [String: Any]?,
                verifoneUx700: [String: Any]?,
                verifoneV660p: [String: Any]?,
                wifi: [String: Any]?,
                expand: [String]?) async throws -> TerminalConfiguration
    
    /// Deletes a ``TerminalConfiguration`` object.
    /// - Parameter config: The id of the configuration.
    /// - Returns: Returns the ``TerminalConfiguration`` object that was deleted.
    func delete(config: String) async throws -> DeletedObject
    
    /// Returns a list of ``TerminalConfiguration`` objects.
    /// - Parameter filter: A dictionary that will be used for query parameters.
    /// - Returns: A dictionary with a `data` property that contains an array of up to `limit` configurations, starting after configurations `configurations`. Each entry in the array is a separate Terminal `configurations` object. If no more configurations are available, the resulting array will be empty.
    func listAll(filter: [String: Any]?) async throws -> TerminalConfigurationList
}

public struct StripeTerminalConfigurationRoutes: TerminalConfigurationRoutes {
    public var headers: HTTPHeaders = [:]
    
    private let apiHandler: StripeAPIHandler
    private let terminalconfigurations = APIBase + APIVersion + "terminal/configurations"
    
    init(apiHandler: StripeAPIHandler) {
        self.apiHandler = apiHandler
    }
    
    public func create(bbposWisepad3: [String: Any]? = nil,
                       bbposWiseposE: [String: Any]? = nil,
                       cellular: [String: Any]? = nil,
                       name: String? = nil,
                       offline: [String: Any]? = nil,
                       readerSecurity: [String: Any]? = nil,
                       rebootWindow: [String: Any]? = nil,
                       stripeS700: [String: Any]? = nil,
                       stripeS710: [String: Any]? = nil,
                       tipping: [String: Any]? = nil,
                       verifoneM425: [String: Any]? = nil,
                       verifoneP400: [String: Any]? = nil,
                       verifoneP630: [String: Any]? = nil,
                       verifoneUx700: [String: Any]? = nil,
                       verifoneV660p: [String: Any]? = nil,
                       wifi: [String: Any]? = nil,
                       expand: [String]? = nil) async throws -> TerminalConfiguration {
        var body: [String: Any] = [:]

        if let bbposWisepad3 {
            bbposWisepad3.forEach { body["bbpos_wisepad3[\($0)]"] = $1 }
        }

        if let bbposWiseposE {
            bbposWiseposE.forEach { body["bbpos_wisepos_e[\($0)]"] = $1 }
        }

        if let cellular {
            cellular.forEach { body["cellular[\($0)]"] = $1 }
        }

        if let name {
            body["name"] = name
        }

        if let offline {
            offline.forEach { body["offline[\($0)]"] = $1 }
        }

        if let readerSecurity {
            readerSecurity.forEach { body["reader_security[\($0)]"] = $1 }
        }

        if let rebootWindow {
            rebootWindow.forEach { body["reboot_window[\($0)]"] = $1 }
        }

        if let stripeS700 {
            stripeS700.forEach { body["stripe_s700[\($0)]"] = $1 }
        }

        if let stripeS710 {
            stripeS710.forEach { body["stripe_s710[\($0)]"] = $1 }
        }

        if let tipping {
            tipping.forEach { body["tipping[\($0)]"] = $1 }
        }

        if let verifoneM425 {
            verifoneM425.forEach { body["verifone_m425[\($0)]"] = $1 }
        }

        if let verifoneP400 {
            verifoneP400.forEach { body["verifone_p400[\($0)]"] = $1 }
        }

        if let verifoneP630 {
            verifoneP630.forEach { body["verifone_p630[\($0)]"] = $1 }
        }

        if let verifoneUx700 {
            verifoneUx700.forEach { body["verifone_ux700[\($0)]"] = $1 }
        }

        if let verifoneV660p {
            verifoneV660p.forEach { body["verifone_v660p[\($0)]"] = $1 }
        }

        if let wifi {
            wifi.forEach { body["wifi[\($0)]"] = $1 }
        }

        if let expand {
            body["expand"] = expand
        }

        return try await apiHandler.send(method: .POST, path: terminalconfigurations, body: .string(body.queryParameters), headers: headers)
    }
    
    public func retrieve(config: String, expand: [String]? = nil) async throws -> TerminalConfiguration {
        var body: [String: Any] = [:]
        
        if let expand {
            body["expand"] = expand
        }
        
        return try await apiHandler.send(method: .GET, path: "\(terminalconfigurations)/\(config)", body: .string(body.queryParameters), headers: headers)
    }
    
    public func update(config: String,
                       bbposWisepad3: [String: Any]? = nil,
                       bbposWiseposE: [String: Any]? = nil,
                       cellular: [String: Any]? = nil,
                       name: String? = nil,
                       offline: [String: Any]? = nil,
                       readerSecurity: [String: Any]? = nil,
                       rebootWindow: [String: Any]? = nil,
                       stripeS700: [String: Any]? = nil,
                       stripeS710: [String: Any]? = nil,
                       tipping: [String: Any]? = nil,
                       verifoneM425: [String: Any]? = nil,
                       verifoneP400: [String: Any]? = nil,
                       verifoneP630: [String: Any]? = nil,
                       verifoneUx700: [String: Any]? = nil,
                       verifoneV660p: [String: Any]? = nil,
                       wifi: [String: Any]? = nil,
                       expand: [String]? = nil) async throws -> TerminalConfiguration {
        var body: [String: Any] = [:]

        if let bbposWisepad3 {
            bbposWisepad3.forEach { body["bbpos_wisepad3[\($0)]"] = $1 }
        }

        if let bbposWiseposE {
            bbposWiseposE.forEach { body["bbpos_wisepos_e[\($0)]"] = $1 }
        }

        if let cellular {
            cellular.forEach { body["cellular[\($0)]"] = $1 }
        }

        if let name {
            body["name"] = name
        }

        if let offline {
            offline.forEach { body["offline[\($0)]"] = $1 }
        }

        if let readerSecurity {
            readerSecurity.forEach { body["reader_security[\($0)]"] = $1 }
        }

        if let rebootWindow {
            rebootWindow.forEach { body["reboot_window[\($0)]"] = $1 }
        }

        if let stripeS700 {
            stripeS700.forEach { body["stripe_s700[\($0)]"] = $1 }
        }

        if let stripeS710 {
            stripeS710.forEach { body["stripe_s710[\($0)]"] = $1 }
        }

        if let tipping {
            tipping.forEach { body["tipping[\($0)]"] = $1 }
        }

        if let verifoneM425 {
            verifoneM425.forEach { body["verifone_m425[\($0)]"] = $1 }
        }

        if let verifoneP400 {
            verifoneP400.forEach { body["verifone_p400[\($0)]"] = $1 }
        }

        if let verifoneP630 {
            verifoneP630.forEach { body["verifone_p630[\($0)]"] = $1 }
        }

        if let verifoneUx700 {
            verifoneUx700.forEach { body["verifone_ux700[\($0)]"] = $1 }
        }

        if let verifoneV660p {
            verifoneV660p.forEach { body["verifone_v660p[\($0)]"] = $1 }
        }

        if let wifi {
            wifi.forEach { body["wifi[\($0)]"] = $1 }
        }

        if let expand {
            body["expand"] = expand
        }

        return try await apiHandler.send(method: .POST, path: "\(terminalconfigurations)/\(config)", body: .string(body.queryParameters), headers: headers)
    }
    
    public func delete(config: String) async throws -> DeletedObject {
        try await apiHandler.send(method: .DELETE, path: "\(terminalconfigurations)/\(config)", headers: headers)
    }
    
    public func listAll(filter: [String: Any]? = nil) async throws -> TerminalConfigurationList {
        var queryParams = ""
        if let filter {
            queryParams = filter.queryParameters
        }
        
        return try await apiHandler.send(method: .GET, path: terminalconfigurations, query: queryParams, headers: headers)
    }
}
