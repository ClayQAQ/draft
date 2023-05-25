//
//  WeakArray.swift
//  RokidApp
//
//  Created by 朝辉贾 on 2018/6/13.
//  Copyright © 2018 Rokid. All rights reserved.
//

import Foundation

extension Array where Element: AnyObject  {
    
    var weak: Array<WeakObject<Element>> {
        var weakArray = [WeakObject<Element>]()
        for item in self {
            let obj = WeakObject(object: item)
            weakArray.append(obj)
        }
        return weakArray
    }
}

extension Array where Element: WeakObjectProtocol {
    
    typealias EnumeratedWeakObjectClosure = (_ index: Int, _ value: Element.WeakObjectType?)->()
    typealias WeakObjectClosure = (_ value: Element.WeakObjectType?)->()
    
    mutating func removeNils() {
        self = self.compactMap{ (element) -> Element? in
            if element.value == nil {
                return nil
            }
            return element
        }
    }
    
    mutating func append(weakValue: Element.WeakObjectType) {
        append(Element(object: weakValue))
    }
    
    subscript(index: Int) -> Element.WeakObjectType? {
        get {
            return self[index].value
        }
    }
    
    func `for` (closure: WeakObjectClosure){
        for item in self {
            closure(item.value)
        }
    }
    
    func forEnumerated (closure: EnumeratedWeakObjectClosure) {
        for (index,item) in self.enumerated() {
            closure(index, item.value)
        }
    }
    
    mutating func remove(index: Int, closure: EnumeratedWeakObjectClosure) {
        closure(index, self[index].value)
        remove(at: index)
    }
    
    mutating func remove(index: Int, closure: WeakObjectClosure) {
        closure(self[index].value)
        remove(at: index)
    }
}
