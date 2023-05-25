//
// Created by Yock on 2018/1/2.
// Copyright (c) 2018 Rokid. All rights reserved.
//

import Foundation

public extension NotificationCenter {

    static var rokid: NotificationCenter = NotificationCenter()
    
}

public class RokidNotificationCenter {

    static public var appendNotificationCenter: NotificationCenter?
    
    static public func post(_ notification: Notification) {
        //TODO: 使用设置模式实现,需要提供接口
        if let anc = appendNotificationCenter { //RokidSDK 里面设置
            anc.post(notification)
        }else {
            NotificationCenter.default.post(notification)
        }
    }

    static public func post(name aName: NSNotification.Name, object anObject: Any?) {
        if let anc = appendNotificationCenter { //RokidSDK 里面设置
            anc.post(name: aName, object: anObject)
        }else {
            NotificationCenter.default.post(name: aName, object: anObject)
        }
    }

    static public func post(name aName: NSNotification.Name, object anObject: Any?, userInfo aUserInfo: [AnyHashable: Any]? = nil) {
        if let anc = appendNotificationCenter { //RokidSDK 里面设置
            anc.post(name: aName, object: anObject, userInfo: aUserInfo)
        }else {
            NotificationCenter.default.post(name: aName, object: anObject, userInfo: aUserInfo)
        }
    }

    static public func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        NotificationCenter.default.addObserver(observer, selector: aSelector, name: aName, object: anObject)
    }

    static public func removeObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    static public func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        NotificationCenter.default.removeObserver(observer, name: aName, object: anObject)
    }
    
}
