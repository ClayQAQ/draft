//
//  RBBundles.swift
//  rokid
//
//  Created by lamo on 2017/3/14.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

private let kShortVersion = "CFBundleShortVersionString"
private let kBuildCode = "CFBundleVersion"
private let kAppIdentifierPrefix = "AppIdentifierPrefix"
private let kAppId = "CFBundleIdentifier"

extension Bundle {
    
    public var rb_version: (major: Int, minor: Int, fix: Int, isRC: Bool)? {
        guard var s = rb_versionString else {
            return nil
        }
        
        var ver = (major: 0, minor: 0, fix: 0, isRC: false)
        
        if s.hasSuffix("RC") {
            ver.isRC = true
            let index = s.index(s.endIndex, offsetBy: -2)
            s = String(s.prefix(upTo: index))
        }
        
        let comps = s.components(separatedBy: ".")
        ver.major = Int(comps[0]) ?? 0
        if comps.count > 1 {
            ver.minor = Int(comps[1]) ?? 0
        }
        if comps.count > 2 {
            ver.fix = Int(comps[2]) ?? 0
        }
        
        return ver
    }
    
    public var rb_versionString: String? {
        return self.infoDictionary?[kShortVersion] as? String
    }
    
    public var rb_buildCode: String? {
        return self.infoDictionary?[kBuildCode] as? String
    }
    
    public var rb_fullVersion: String {
        return "\(rb_versionString ?? "")-\(rb_buildCode ?? "")"
    }
    
    public var rb_appIdentifierPrefix: String? {
        return self.infoDictionary?[kAppIdentifierPrefix] as? String
    }
    
    public var rb_appId: String? {
        return self.infoDictionary?[kAppId] as? String
    }
    
}
