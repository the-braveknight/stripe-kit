//
//  TerminalLocation.swift
//  StripeKit
//
//  Created by Andrew Edwards on 6/1/19.
//

import Foundation

/// The [Location Object](https://stripe.com/docs/api/terminal/locations/object)
public struct TerminalLocation: Codable {
    /// Unique identifier for the object.
    public var id: String
    /// The full address of the location.
    public var address: Address?
    /// The Kana variation of the full address of the location (Japan only).
    public var addressKana: AddressKana?
    /// The Kanji variation of the full address of the location (Japan only).
    public var addressKanji: AddressKanji?
    /// The display name of the location.
    public var displayName: String?
    /// The Kana variation of the display name of the location (Japan only).
    public var displayNameKana: String?
    /// The Kanji variation of the display name of the location (Japan only).
    public var displayNameKanji: String?
    /// The phone number of the location.
    public var phone: String?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The ID of a configuration that will be used to customize all readers in this location.
    public var configurationOverrides: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?

    public init(id: String,
                address: Address? = nil,
                addressKana: AddressKana? = nil,
                addressKanji: AddressKanji? = nil,
                displayName: String? = nil,
                displayNameKana: String? = nil,
                displayNameKanji: String? = nil,
                phone: String? = nil,
                metadata: [String : String]? = nil,
                object: String,
                configurationOverrides: String? = nil,
                livemode: Bool? = nil) {
        self.id = id
        self.address = address
        self.addressKana = addressKana
        self.addressKanji = addressKanji
        self.displayName = displayName
        self.displayNameKana = displayNameKana
        self.displayNameKanji = displayNameKanji
        self.phone = phone
        self.metadata = metadata
        self.object = object
        self.configurationOverrides = configurationOverrides
        self.livemode = livemode
    }
}

public struct TerminalLocationList: Codable {
    public var object: String
    public var data: [TerminalLocation]?
    public var hasMore: Bool?
    public var url: String?
    
    public init(object: String,
                data: [TerminalLocation]? = nil,
                hasMore: Bool? = nil,
                url: String? = nil) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
}
