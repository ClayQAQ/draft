//
//  String-Localize.swift
//  rokid
//
//  Created by 朝辉贾 on 13/05/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

 extension String {
    public var localize : String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func localized(comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
    public func localized(table:String) -> String {
        return NSLocalizedString(self, tableName: table, bundle: Bundle.main, value: "", comment: "")
    }
}
