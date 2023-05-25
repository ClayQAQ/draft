//
//  RKWifiUtil.swift
//  RokidApp
//
//  Created by Yock on 2018/2/1.
//  Copyright © 2018年 Rokid. All rights reserved.
//

import UIKit
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork

public class RKWifiUtil {
    public let ssid: String
    public let bssid: String?
    public var level: Int?       //信号强度(rssi)，一个负值 如：-38
    public var frequency: String?       //频率 如："2472"
    
    public required init(ssid: String, bssid: String?) {
        self.ssid = ssid
        self.bssid = bssid
    }
    
    public required init(dic: [String:Any]) throws {
        
        self.ssid = dic["S"] as? String ?? ""
        self.bssid = dic["B"] as? String ?? ""
        self.level = dic["L"] as? Int ?? 0
        self.frequency = dic["F"] as? String ?? ""
    }
   

    static let SSID_5G_SUFFIX = ["5G", "5g"]
    
    static let SSID_2d4G_SUFFIX = ["", "2.4G", "2.4g"]
    
    static let SSID_SUFFIX_SEPERATOR = ["_", "-", "/", "."]
    
    static public func guess5G(ssid: String) -> Bool {
        for suffix_5G in SSID_5G_SUFFIX {
            if ssid.hasSuffix(suffix_5G) {
                return true
            }
        }
        return false
    }
    
    static public func translate5Gto2d4G(ssid: String) -> [String] {
        for suffix_5G in SSID_5G_SUFFIX {
            if ssid.hasSuffix(suffix_5G) {
                var result = [String]()
                for suffix_2d4G in SSID_2d4G_SUFFIX {
                    let replacedSsid = self.replaceSuffix(ssid, suffix_5G, suffix_2d4G)
                    result.append(replacedSsid)
                }
                return result
            }
        }
        return []
    }
    
    static public func replaceSuffix(_ ssid: String, _ suffix_5G: String, _ suffix_2d4G: String) -> String {
        var replaced = ssid.subString(to: ssid.count - suffix_5G.count)
        replaced = replaced.appending(suffix_2d4G)
        for seperator in SSID_SUFFIX_SEPERATOR {
            if replaced.hasSuffix(seperator) {
                replaced = replaced.subString(to: replaced.count - seperator.count)
                break
            }
        }
        return replaced
    }
    
    public static func current() -> Self? {
        guard let interfaces = CNCopySupportedInterfaces() as? [CFString],
            let name = interfaces.first,
            let info = CNCopyCurrentNetworkInfo(name) as? [String: Any],
            let bssid = info[kCNNetworkInfoKeyBSSID as String] as? String else {
                return nil
        }
        let ssid = (info[kCNNetworkInfoKeySSID as String] as? String) ?? ""
        return self.init(ssid: ssid, bssid: bssid)
    }
    
}
