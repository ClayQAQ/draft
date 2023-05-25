//
//  Dictionary+Rokid.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/2/22.
//

import Foundation

 extension Dictionary {
    /// 字典转json字符串
    ///
    /// - Returns: 字典的字符串
  public  func toJsonString() -> String? {
        
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: self,
                                                      options: .prettyPrinted) {
            return String(data: jsonData, encoding: .utf8)
        } else {
            return nil
        }
    }
    
    
    /// 字典转json data
    ///
    /// - Returns: data数据
    /// - Throws: 跑出异常
   public func toJsonData() throws -> Data {
        if !JSONSerialization.isValidJSONObject(self) {
        }
        
        do {
            return try JSONSerialization.data(withJSONObject: self)
        } catch {
            throw error
        }
    }
}



