//
//  Optional-Equaltable.swift
//  rokid
//
//  Created by lamo on 2017/7/8.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

/**
    swift语法还不支持 extension Array: Equaltable where Element: Equaltable {} 这样的语法
    所以这里只是定义操作符，虽然定义了操作符，并不代表[Equaltable]类型实现了Equaltable协议

    没有定义这个操作符时[String]?和[String]?不仅不能直接比较，在复杂的比较表达式中会导致奇怪的编译错误，比如：

        struct AClass: Equatable {
            var str: String?
            var arr: [String]?
        }

        func ==(lhs: AClass, rhs: AClass) -> Bool {
            return lhs.str == rhs.str || lhs.arr == rhs.arr
        }
 
    lhs.str == rhs.str也会有编译错误提示，改成lhs.str != rhs.str则不会出现
 */
public func ==<Wrapped>(lhs: [Wrapped]?, rhs: [Wrapped]?) -> Bool where Wrapped: Equatable {
    switch (lhs, rhs) {
    case (.none, .none):
        return true
    case (.some(let ls), .some(let rs)):
        return ls == rs
    default:
        return false
    }
}

public func !=<Wrapped>(lhs: [Wrapped]?, rhs: [Wrapped]?) -> Bool where Wrapped: Equatable {
    return !(lhs == rhs)
}
