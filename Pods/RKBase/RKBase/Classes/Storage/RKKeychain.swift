//
//  RKKeychain.swift
//  iOS_LibBase
//
//  Created by BeyondChao on 2018/12/25.
//  Copyright © 2018 BeyondChao. All rights reserved.
//

import Foundation

import Security

/// 对系统Keychain接口的简单封装，根据group和id检索items
public class RKKeychain {
    
    public let group: String?
    public let id: String?
    
    public required init(group: String? = nil, id: String? = nil) {
        self.group = group
        self.id = id
    }
    
    public func all() -> [Item]? {
        let results = ((try? get(nil)) as AnyObject??)
        guard let items = results as? [[AnyHashable: Any]] else {
            return nil
        }
        return items.map(toItem)
    }
    
    public func deleteAll() {
        try? delete(nil)
    }
    
    public func newItem(key: String) throws -> Item {
        if (try get(key: key)) != nil {
            throw Failure.status(errSecDuplicateItem)
        }
        return Item(key, self.group, self.id)
    }
    
    public func save(item: Item) throws {
        #if (!arch(i386) && !arch(x86_64)) || (!os(iOS) && !os(watchOS) && !os(tvOS))
        assert(item.accessGroup == self.group && item.id == self.id)
        #endif
        
        if let ex = try get(key: item.key) {
            ex.value = item.value
            ex.label = item.label
            ex.comment = item.comment
            ex.service = item.service
            ex.synchronizable = item.synchronizable
            
            try update(item: ex)
        } else {
            try add(item: item)
        }
    }
    
    public func get(key: String) throws -> Item? {
        let result = try get(key)
        guard let attributes = result as? [AnyHashable: Any] else {
            return nil
        }
        return toItem(attrs: attributes)
    }
    
    public func add(item: Item) throws {
        var attrs = toAttrs(item: item)
        toQuery(key: item.key).forEach { attrs[$0] = $1 }
        
        let status = SecItemAdd(attrs as CFDictionary, nil)
        if status != errSecSuccess {
            throw Failure.status(status)
        }
    }
    
    public func update(item: Item) throws {
        let query = toQuery(key: item.key)
        
        let attrs = toAttrs(item: item)
        let status = SecItemUpdate(query as CFDictionary, attrs as CFDictionary)
        if status != errSecSuccess {
            throw Failure.status(status)
        }
    }
    
    public func delete(item: Item) throws {
        try delete(key: item.key)
    }
    
    public func delete(key: String) throws {
        try delete(key)
    }
    
    private func get(_ key: String?) throws -> AnyObject? {
        var query = toQuery(key: key)
        query[kSecMatchLimit as AnyHashable] =
            (key == nil ? kSecMatchLimitAll : kSecMatchLimitOne)
        query[kSecReturnData as AnyHashable] = kCFBooleanTrue
        query[kSecReturnAttributes as AnyHashable] = kCFBooleanTrue
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        switch status {
        case errSecSuccess:
            return result
        case errSecItemNotFound:
            return nil
        default:
            throw Failure.status(status)
        }
    }
    
    private func delete(_ key: String?) throws {
        let query = toQuery(key: key)
        
        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess && status != errSecItemNotFound {
            throw Failure.status(status)
        }
    }
    
    private func toQuery(key: String?) -> [AnyHashable: Any] {
        var dict = [AnyHashable: Any]()
        dict[kSecClass as AnyHashable] = kSecClassGenericPassword
        
        #if (!arch(i386) && !arch(x86_64)) || (!os(iOS) && !os(watchOS) && !os(tvOS))
        dict[kSecAttrAccessGroup as AnyHashable] = self.group
        #endif
        dict[kSecAttrGeneric as AnyHashable] = self.id
        dict[kSecAttrAccount as AnyHashable] = key
        
        return dict
    }
    
    private func toAttrs(item: Item) -> [AnyHashable: Any] {
        var attrs = [AnyHashable: Any]()
        
        attrs[kSecValueData as AnyHashable] = item.value
        attrs[kSecAttrLabel as AnyHashable] = item.label
        attrs[kSecAttrComment as AnyHashable] = item.comment
        attrs[kSecAttrService as AnyHashable] = item.service
        attrs[kSecAttrSynchronizable as AnyHashable] = item.synchronizable
        
        return attrs
    }
    
    private func toItem(attrs: [AnyHashable: Any]) -> Item {
        let key = attrs[kSecAttrAccount as AnyHashable] as? String
        let group = attrs[kSecAttrAccessGroup as AnyHashable] as? String
        let id = attrs[kSecAttrGeneric as AnyHashable] as? String
        
        assert(key != nil)
        #if (!arch(i386) && !arch(x86_64)) || (!os(iOS) && !os(watchOS) && !os(tvOS))
        assert(self.group == nil || group == self.group)
        #endif
        assert(id == self.id)
        
        let item = Item(key!, group, id)
        
        item.value = attrs[kSecValueData as AnyHashable] as? Data
        item.label = attrs[kSecAttrLabel as AnyHashable] as? String
        item.comment = attrs[kSecAttrComment as AnyHashable] as? String
        item.service = attrs[kSecAttrService as AnyHashable] as? String
        if let sync = attrs[kSecAttrSynchronizable as AnyHashable] as? Bool {
            item.synchronizable = sync
        }
        if let cdate = attrs[kSecAttrCreationDate as AnyHashable] as? Date {
            item.cdate = cdate
        }
        if let mdate = attrs[kSecAttrModificationDate as AnyHashable] as? Date {
            item.mdate = mdate
        }
        
        return item
    }
    
    public class Item {
        
        public let key: String
        public let accessGroup: String?
        public let id: String?
        
        public var value: Data?
        public var label: String?
        public var comment: String?
        public var service: String?
        
        public var mdate: Date?
        public var cdate: Date?
        
        public var svalue: String? {
            set {
                self.value = newValue?.data(using: .utf8)
            }
            get {
                
                if self.value == nil {
                    return nil
                } else {
                    return String(data: value!, encoding: .utf8)
                }
            }
        }
        
        public var synchronizable: Bool = false
        
        fileprivate init(_ key: String, _ group: String?, _ id: String?) {
            self.key = key
            self.accessGroup = group
            self.id = id
        }
        
    }
    
    public enum Failure: Error {
        case unexpectedError
        case status(OSStatus)
    }
    
}
