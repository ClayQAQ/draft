//
//  RKSystem.swift
//  AFNetworking
//
//  Created by 金灵波 on 2019/2/26.
//

import Foundation

public class RKSystem {
    
    public static func getTimeStamp() -> String {
        let dateNow:Date = Date()
        return "\(Int64(dateNow.timeIntervalSince1970 * 1000))"
    }
    
    public static func getTimeStampInt() -> Int64 {
        let dateNow:Date = Date()
        return Int64(dateNow.timeIntervalSince1970 * 1000)
    }
    
    public static func getTimeStampSecsInt() -> Int {
        let dateNow:Date = Date()
        return Int(dateNow.timeIntervalSince1970)
    }
    
    public static func getDerviceId() -> String {
        return (UIDevice.current.identifierForVendor ?? UUID()).uuidString
    }
    
    public static func getUUID() -> String {
        return NSUUID().uuidString
    }
    
    public static func getDeviceModelName() -> String {
        return UIDevice.current.model
    }
    
}
