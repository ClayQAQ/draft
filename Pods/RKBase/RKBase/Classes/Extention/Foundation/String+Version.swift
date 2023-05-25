//
//  String-Version.swift
//  rokid
//
//  Created by lamo on 28/09/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension String {
    
    /**
     * 比较版本号。
     * 分段比较版本号大小，某段不一致时比较该段，长短不同时段数长的版本号当做比较大的版本号，长度和分段值相同时认为相等
     *
     * - parameter version: 用来比较的另一个版本号
     * - parameter separator: 分隔符，默认为"."
     * - returns: 比version大时返回1，比version小返回-1，相等返回0
     */
    public func compare(version: String, separator: Character = ".") -> Int {
        let comps0 = self.split(separator: separator)
        let comps1 = version.split(separator: separator)
        let count0 = comps0.count
        let count1 = comps1.count
        for i in 0..<min(count0, count1) {
            guard let v0 = Int(comps0[i]) else {
                return -1
            }
            guard let v1 = Int(comps1[i]) else {
                return 1
            }
            if v0 == v1 {
                continue
            }
            return v0 > v1 ? 1 : -1
        }
        if count0 == count1 {
            return 0
        }
        return count0 > count1 ? 1 : -1
    }
    
}
