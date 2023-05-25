//
//  Int+Convert.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/5/10.
//

import Foundation

/// Float、Double、String、Bool转 Int
///
/// - Parameter value: Int、Float、String、Bool、Duoble
/// - Returns: Int?
 extension Int : RKSafeValueConvert{
   public static func rk_Int(anyValue value:Any) -> Int? {
        return Int.convert(anyValue: value)
    }
    
    static func convert(anyValue value:Any) -> Int?{
        let valueType = type(of: value)
        switch  valueType {
        case is Bool.Type , is Bool?.Type:
            if let boolValue = value as? Bool{
                return  boolValue == true ? 1 : 0
            }
            return nil
        case is Int.Type,is Int?.Type:
            if let intValue = value as? Int {
                return  intValue
            }
            return nil
        case is String.Type ,is String?.Type :
            if let strValue = value as? String {
                return  Int(strValue)
            }
            return nil
        case is Float.Type,is Float?.Type:
            if let floatValue = value as? Float {
                return Int(floatValue)
            }
            return nil
        case is Double.Type,is Double?.Type :
            if let doubleValue = value as? Double {
                return Int(doubleValue)
            }
            return nil
            
        default:
            return nil
        }
    }
}
