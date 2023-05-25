//
//  URL-Query.swfit.swift
//  rokid
//
//  Created by 朝辉贾 on 15/05/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension URL {
    public var queryDictionary: [String:String] {
        guard let components =  URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return [String:String]()
        }
        let querys = components.queryItems?.reduce([:], { (result, queryItem) -> [String:String] in
            var value: String? 
            if URL(string: queryItem.value ?? "") != nil {
                value = queryItem.value
            }else {
                value = queryItem.value?.removingPercentEncoding
            }
            guard let name = queryItem.name.removingPercentEncoding, let validValue = value  else {//value值解码
                return result
            }
            var mutableResult = result
            mutableResult[name] = validValue
            return mutableResult
        })
        return querys ?? [:]
    }
}

extension String {
    
    public init(query: [String: String]) {
        var s = ""
        for (k, v) in query {
            if !s.isEmpty {
                s.append("&")
            }
            s.append(k.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? k) //?这里为什么是addPercent 和URL 中相反 先不去，2019-4-11
            s.append("=")
            s.append(v.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? v)
        }
        self = s
    }
    
    public init(baseURL: String, query: [String: String]) {
        self = "\(baseURL)?\(String(query: query))"
    }
    
    public var queryDictionary: [String:String] {
        var result = [String:String]()
        
        if let loc = self.range(of: "?") {
            let index = self.index(after: loc.lowerBound)
            let paramsString = String(self.suffix(from: index))
            let paramArray = paramsString.components(separatedBy: "&")
            for param in paramArray {
                let kv = param.components(separatedBy: "=")
                let k = kv[0].addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? kv[0] //?这里为什么是addPercent 和URL 中相反 先不去，2019-4-11
                let v = kv[1].addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? kv[1]
                result[k] = v
            }
        }
        return result
    }
    
}
