//
//  Bool+Convert.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/5/10.
//

import Foundation
/// Int、Float、String、Double转 Bool
///
/// - Parameter value: Int、Float、String、Bool、Duoble
/// - Returns: Bool
 extension Bool :RKSafeValueConvert {
    public static  func rk_Bool(anyValue value:Any) -> Bool? {
        return Bool.convert(anyValue: value)
    }
    
    static func convert(anyValue value:Any) -> Bool?{
        let valueType = type(of: value)
        switch  valueType {
        case is Bool.Type , is Bool?.Type:
            if let boolValue = value as? Bool{
                return boolValue
            }
            return nil
        case is Int.Type,is Int?.Type:
            if let intValue = value as? Int {
                return intValue == 1
            }
            return nil
        case is String.Type ,is String?.Type :
            if let strValue = value as? String {
                return ["1","true","yes"].contains(strValue)
            }
            return nil
        case is Float.Type,is Float?.Type:
            if let floatValue = value as? Float {
                return floatValue == 1
            }
            return nil
        case is Double.Type,is Double?.Type :
            if let doubleValue = value as? Double {
                return doubleValue == 1
            }
            return nil
            
        default:
            return nil
        }
    }
}
