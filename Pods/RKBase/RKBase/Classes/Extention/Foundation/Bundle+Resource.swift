//
//  Bundle+Resource.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/4/16.
//

import Foundation
public extension Bundle {
    static func rk_resourceBundle(for anyClass:AnyClass,name:String)->Bundle?{
        let frameBundle =  Bundle.init(for: anyClass)
        guard let resourceBundleUrl = frameBundle.url(forResource: name, withExtension: "bundle") else {
            return nil
        }
        return  Bundle(url: resourceBundleUrl)
    }
    
}
