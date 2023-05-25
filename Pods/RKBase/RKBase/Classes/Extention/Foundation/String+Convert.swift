//
//  String+Convert.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/5/10.
//

import Foundation

/// Float、Double、Int、Bool转  String
///
/// - Parameter value: Int、Float、String、Bool、Duoble
/// - Returns: String?
 extension String : RKSafeValueConvert{
  public  static func rk_String(anyValue value:Any) -> String? {
        return String.convert(anyValue: value)
    }
    
    static func convert(anyValue value:Any ) -> String?{
        let valueType = type(of: value)
        switch  valueType {
        case is Bool.Type , is Bool?.Type:
            if let boolValue = value as? Bool{
                return "\(boolValue)"
            }
            return nil
        case is Int.Type,is Int?.Type:
            if let intValue = value as? Int {
                return "\(intValue)"
            }
            return nil
        case is String.Type ,is String?.Type :
            if let strValue = value as? String {
                return strValue
            }
            return nil
        case is Float.Type,is Float?.Type:
            if let floatValue = value as? Float {
                return "\(floatValue)"
            }
            return nil
        case is Double.Type,is Double?.Type :
            if let doubleValue = value as? Double {
                return "\(doubleValue)"
            }
            return nil
            
        default:
            return nil
        }
    }
}
