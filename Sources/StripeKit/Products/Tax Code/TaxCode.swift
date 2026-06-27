//
//  Tax Code.swift
//  
//
//  Created by Andrew Edwards on 12/16/21.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

public struct TaxCode: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// A detailed description of which types of products the tax code represents.
    public var description: String
    /// A short name for the tax code.
    public var name: String
    /// Describes tax location requirements for this tax code.
    public var requirements: TaxCodeRequirements?

    public init(id: String,
                object: String,
                description: String,
                name: String,
                requirements: TaxCodeRequirements? = nil) {
        self.id = id
        self.object = object
        self.description = description
        self.name = name
        self.requirements = requirements
    }
}

public struct TaxCodeRequirements: Codable {
    /// Describes if a performance location is required to determine the correct tax for products using this tax code.
    public var performanceLocation: TaxCodeRequirementsPerformanceLocation?

    public init(performanceLocation: TaxCodeRequirementsPerformanceLocation? = nil) {
        self.performanceLocation = performanceLocation
    }
}

public enum TaxCodeRequirementsPerformanceLocation: String, Codable {
    /// Performance location can be passed but is not required; the customer's address is used if not provided.
    case optional
    /// Performance location must be provided for successful tax calculation.
    case required
}

public struct TaxCodeList: Codable {
    public var object: String
    public var hasMore: Bool?
    public var url: String?
    public var data: [TaxCode]?
    
    public init(object: String,
                hasMore: Bool? = nil,
                url: String? = nil,
                data: [TaxCode]? = nil) {
        self.object = object
        self.hasMore = hasMore
        self.url = url
        self.data = data
    }
}
