//
//  SecurityUtil.swift
//  RokidSDK
//
//  Created by Yock on 2017/12/17.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

public class SecurityUtil: NSObject {
    
    static public func sign(params: Dictionary<String, String>, secret: String) -> String {
        let sortedParams = params.sorted { (p1, p2) -> Bool in
            return p1.key < p2.key ? true : false
        }
        
        var query = ""
        query.append(secret)
        for (key, value) in sortedParams {
            query.append(key)
            query.append(value)
        }
        query.append(secret)
        
        return query.md5
    }
    
}
