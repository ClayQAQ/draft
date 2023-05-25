//
//  RBCollections.swift
//  rokid
//
//  Created by lamo on 2017/3/22.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension Sequence {
    
    public func all(_ iter: (Self.Iterator.Element) -> Bool) -> Bool {
        for e in self {
            if !iter(e) {
                return false
            }
        }
        return true
    }
    
    public func any(_ iter: (Self.Iterator.Element) -> Bool) -> Bool {
        for e in self {
            if iter(e) {
                return true
            }
        }
        return false
    }
    
    public func rb_find(_ finder: (Self.Iterator.Element) -> Bool) -> Self.Iterator.Element? {
        for e in self {
            if finder(e) {
                return e
            }
        }
        return nil
    }
    
}

extension Collection where
    Self.Iterator.Element: Equatable,
    Self.Index == Int {
    
    public typealias Diff = (appended: [Self.Iterator.Element], removed: [Self.Iterator.Element])
    
    public func rb_diff(with list: Self) -> Diff {
        var appended = Array(list)
        var removed = Array(self)
        var removedCount = 0;
        for i in 0..<self.count {
            let e = self[i]
            if let ri = appended.firstIndex(of: e) {
                appended.remove(at: ri)
                removed.remove(at: i - removedCount)
                removedCount += 1;
            }
        }
        return (appended, removed)
    }
    
}

extension Array {
    
    public mutating func move(elementAt from: Int, to: Int) {
        if from == to {
            return
        }
        let e = self.remove(at: from)
        self.insert(e, at: to)
    }
    
}
