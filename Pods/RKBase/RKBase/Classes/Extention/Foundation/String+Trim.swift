//
//  String-Trim.swift
//  rokid
//
//  Created by lamo on 2017/7/13.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension String {
    
    public mutating func trim() {
        self = self.trimmed
    }
    
    public var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
}
