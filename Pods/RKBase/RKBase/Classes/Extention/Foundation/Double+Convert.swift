//
//  Double+Convert.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/5/10.
//

import Foundation

extension Double : RKSafeValueConvert {
    
    /// Int、Float、String、Bool转Double
    ///
    /// - Parameter value: Int、Float、String、Bool、Duoble
    /// - Returns: Double?
    public  static func rk_Double(anyValue value:Any) -> Double? {
        return Double.convert(anyValue: value)
    }
    
    static func convert(anyValue value:Any ) -> Double?{
        let valueType = type(of: value)
        switch  valueType {
        case is Bool.Type , is Bool?.Type:
            if let boolValue = value as? Bool{
                return boolValue  == true ? 1.0 :0.0
            }
            return nil
        case is Int.Type,is Int?.Type:
            if let intValue = value as? Int {
                return  Double(intValue)
            }
            return nil
        case is String.Type ,is String?.Type :
            if let strValue = value as? String {
                return Double(strValue)
            }
            return nil
        case is Float.Type,is Float?.Type:
            if let floatValue = value as? Float {
                return Double(floatValue)
            }
            return nil
        case is Double.Type,is Double?.Type :
            if let doubleValue = value as? Double {
                return doubleValue
            }
            return nil
            
        default:
            return nil
        }
    }
}
