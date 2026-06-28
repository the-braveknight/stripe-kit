//
//  StripeAPIRoute.swift
//  
//
//  Created by Andrew Edwards on 11/1/22.
//

#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
import NIOHTTP1

public protocol StripeAPIRoute: Sendable {
    var headers: HTTPHeaders { get set }

    /// Returns a copy of the route with the given headers merged into its own.
    func addHeaders(_ headers: HTTPHeaders) -> Self
}


extension StripeAPIRoute {
    public func addHeaders(_ headers: HTTPHeaders) -> Self {
        var copy = self
        headers.forEach { copy.headers.replaceOrAdd(name: $0.name, value: $0.value) }
        return copy
    }
}
