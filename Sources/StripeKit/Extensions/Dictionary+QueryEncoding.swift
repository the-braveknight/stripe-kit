//
//  Dictionary+QueryEncoding.swift
//  
//
//  Created by Andrew Edwards on 4/11/20.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif

extension Dictionary where Key == String {
    var queryParameters: String {
        // A quick implementation of URLEncodedFormSerializer that includes indices in array key-paths
        // -> `items[0][plan]=...` instead of `items[][plan]=...`
        return Dictionary.queryComponents(keyPath: [], self).map { keyPath, value in
            "\(keyPath.queryKeyPercentEncoded)=\(value.queryValuePercentEncoded)"
        }.joined(separator: "&")
    }
    
    private static func queryComponents(keyPath: [String], _ value: Any) -> [([String], String)] {
        if let dictionary = value as? [String: Any] {
            return dictionary.flatMap { key, value in
                queryComponents(keyPath: keyPath + [key], value)
            }
        } else if let array = value as? [Any] {
            return array.enumerated().flatMap { idx, value in
                queryComponents(keyPath: keyPath + ["\(idx)"], value)
            }
        } else {
            return [(keyPath, "\(value)")]
        }
    }
}

private extension Sequence where Element == String {
    var queryKeyPercentEncoded: String {
        return enumerated().map { idx, key in
            let encodedKey = key.queryValuePercentEncoded
            return idx == 0 ? encodedKey : "[\(encodedKey)]"
        }.joined()
    }
}

private extension String {
    private static let hexDigits = Array("0123456789ABCDEF")

    /// Characters allowed in a URL query component: `CharacterSet.urlQueryAllowed`
    /// (unreserved + sub-delims + `:` `@` `/` `?`) minus `&` and `+`.
    /// Implemented byte-by-byte so this file depends only on the standard library
    /// and `FoundationEssentials` — `CharacterSet`/`addingPercentEncoding` live in
    /// full `Foundation`, which isn't available on the static Linux SDK.
    private static func isQueryAllowed(_ byte: UInt8) -> Bool {
        switch byte {
        case 0x41...0x5A, // A–Z
             0x61...0x7A, // a–z
             0x30...0x39: // 0–9
            return true
        default:
            return "-._~!$'()*,;=:@/?".utf8.contains(byte)
        }
    }

    var queryValuePercentEncoded: String {
        var result = ""
        result.reserveCapacity(utf8.count)
        for byte in utf8 {
            if Self.isQueryAllowed(byte) {
                result.unicodeScalars.append(Unicode.Scalar(byte))
            } else {
                result.append("%")
                result.append(Self.hexDigits[Int(byte >> 4)])
                result.append(Self.hexDigits[Int(byte & 0x0F)])
            }
        }
        return result
    }
}
