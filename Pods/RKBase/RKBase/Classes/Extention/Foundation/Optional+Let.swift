//
//  Optional-Rokid.swift
//  AFNetworking
//
//  Created by 金灵波 on 2019/2/27.
//

import Foundation

public extension Optional {
    
    @discardableResult
     func `let`<U>(block: (Wrapped) throws -> U) rethrows -> U? {
        switch self {
        case .some(let unwrapped):
            return try block(unwrapped)
        default:
            return nil
        }
    }
    
}
