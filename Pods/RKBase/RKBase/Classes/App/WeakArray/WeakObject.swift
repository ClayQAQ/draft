//
//  Weak.swift
//  RokidApp
//  see: https://stackoverflow.com/questions/24127587/how-do-i-declare-an-array-of-weak-references-in-swift
//  Created by 朝辉贾 on 2018/6/13.
//  Copyright © 2018 Rokid. All rights reserved.
//

import Foundation

import Foundation

public protocol WeakObjectProtocol {
    associatedtype WeakObjectType
    var value: WeakObjectType? {get set}
    init(object: WeakObjectType)
}

public class WeakObject<T: AnyObject>: WeakObjectProtocol {
    public typealias WeakObjectType = T
    public weak var value: WeakObjectType?
    
    public required init(object: WeakObjectType) {
        self.value = object
    }
    
    public var referenceCount: Int {
        return CFGetRetainCount(value)
    }
}

extension WeakObject: Equatable {
    static public func == (lhs: WeakObject<T>, rhs: WeakObject<T>) -> Bool {
        return lhs.value === rhs.value
    }
}

extension WeakObject: Hashable {
    public var hashValue: Int {
        if var value = value { return UnsafeMutablePointer<T>(&value).hashValue }
        return 0
    }
    
    public func hash(into hasher: inout Hasher){
        hasher = Hasher()
    }
}

extension WeakObject: CustomStringConvertible {
    
    public var description: String {
        if let value = value  {
            let className = String(describing: type(of: value.self))
            return "{class: \(className); referenceCount: \(referenceCount)}"
        }
        return "nil"
    }
}
