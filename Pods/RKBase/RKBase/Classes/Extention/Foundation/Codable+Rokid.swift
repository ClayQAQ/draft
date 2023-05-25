//
//  Codable+Extension.swift
//  iOS_LibBase
//
//  Created by BeyondChao on 2018/12/25.
//  Copyright © 2018 BeyondChao. All rights reserved.
//

import Foundation

public extension Encodable {
    
    /// 模型对象转字符串
    ///
    /// - Returns: 模型对象的字符串
    /// - Throws: 抛出异常
    func toJsonString() throws -> String? {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
             throw error
        }
    }
    
    /// 模型对象转字典
    ///
    /// - Returns: 字典
    /// - Throws: 抛出异常
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
             throw NSError()
        }
        return dictionary
    }
    
    /// 模型转json data
    ///
    /// - Returns: json数据
    /// - Throws: 抛出异常
    func toJsonData() throws -> Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
             throw error
        }
    }
}


extension Decodable {
    
    /// 从jsonData中还原模型
    ///
    /// - Parameters:
    ///   - jsonData: jsonData 数据
    ///   - ignoreErrorLog: 是否忽略错误日志，默认不忽略
    /// - Returns: 对应的模型
   public static func decodeFrom(jsonData: Data, ignoreErrorLog: Bool = false) -> Self? {
        do {
            let obj:Self = try JSONDecoder().decode(Self.self, from: jsonData)
            return obj
        } catch {
            if !ignoreErrorLog {
             }
            return nil
        }
    }
    
    
    /// 从jsonString中还原模型
    ///
    /// - Parameter jsonString: 原始的 json string
    /// - Returns: 对应的模型
   public static func decodeFrom(jsonString: String) -> Self? {
        
        guard !jsonString.isEmpty, let data = jsonString.data(using: .utf8) else {
             return nil
        }
        
        do {
            let obj:Self = try JSONDecoder().decode(Self.self, from: data)
            return obj
        } catch {
            return nil
        }
    }
    
    /// 从dictionary中还原模型
    ///
    /// - Parameter dictionary: [String: Any] 类型的字典
    /// - Returns: 对应的模型对象
    /// - Throws: 错误
    public static func decodeFrom(dictionary: [String: Any]) throws -> Self? {
        do {
            let validJsonData = try dictionary.toJsonData()
            return decodeFrom(jsonData: validJsonData)
        } catch  {
            throw error
        }

    }
}
