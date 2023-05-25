//
//  Float+Convert.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/5/10.
//

import Foundation
/// Int、Double、String、Bool转 Float
///
/// - Parameter value: Int、Float、String、Bool、Duoble
/// - Returns: Float?
extension Float :RKSafeValueConvert {
   public static func rk_Float(anyValue value:Any) -> Float? {
        return Float.convert(anyValue: value)
    }
    
    static func convert(anyValue value:Any ) -> Float?{
        let valueType = type(of: value)
        switch  valueType {
        case is Bool.Type , is Bool?.Type:
            if let boolValue = value as? Bool{
                return boolValue  == true ? 1.0 :0.0
            }
            return nil
        case is Int.Type,is Int?.Type:
            if let intValue = value as? Int {
                return  Float(intValue)
            }
            return nil
        case is String.Type ,is String?.Type :
            if let strValue = value as? String {
                return Float(strValue)
            }
            return nil
        case is Float.Type,is Float?.Type:
            if let floatValue = value as? Float {
                return floatValue
            }
            return nil
        case is Double.Type,is Double?.Type :
            if let doubleValue = value as? Double {
                return Float(doubleValue)
            }
            return nil
            
        default:
            return nil
        }
    }
}
