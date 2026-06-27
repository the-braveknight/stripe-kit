//
//  Application.swift
//
//
//  Created by Andrew Morris on 26/04/2024.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

/// The [Application Object](https://stripe.com/docs/api/application/object)
public struct ConnectApplication: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// The name of the application.
    public var name: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    
    public init(id: String,
                name: String? = nil,
                object: String) {
        self.id = id
        self.name = name
        self.object = object
    }
}
