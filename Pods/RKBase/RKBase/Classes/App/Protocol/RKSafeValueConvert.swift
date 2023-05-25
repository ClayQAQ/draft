//
//  RKSafeValueConvert.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/5/10.
//

import Foundation

/// 该类实现Int，Float、Bool、Double 、String相互转化功能
protocol  RKSafeValueConvert {
    static func convert(anyValue value:Any) -> Self?
}

extension RKSafeValueConvert {
    static func convert(anyValue value:Any, map:(String)->Self?) -> Self?{
        let valueType = type(of: value)
        switch  valueType {
        case is Bool.Type , is Bool?.Type:
            if let boolValue = value as? Bool{
                return map("\(boolValue)")
            }
            return nil
        case is Int.Type,is Int?.Type:
            if let intValue = value as? Int {
                return map("\(intValue)")
            }
            return nil
        case is String.Type ,is String?.Type :
            if let strValue = value as? String {
                return map(strValue)
            }
            return nil
        case is Float.Type,is Float?.Type:
            if let floatValue = value as? Float {
                return map("\(floatValue)")
            }
            return nil
        case is Double.Type,is Double?.Type :
            if let doubleValue = value as? Double {
                return map("\(doubleValue)")
            }
            return nil
            
        default:
            return nil
        }
    }
}
