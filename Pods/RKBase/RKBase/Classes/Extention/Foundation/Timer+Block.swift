//
//  RBTimers.swift
//  rokid
//
//  Created by lamo on 2017/3/15.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension Timer {
    
    @objc public static func rb_timer(_ interval: TimeInterval,
                                repeats: Bool = true,
                                block: @escaping() -> Swift.Void) -> Timer {
        let timer = Timer.scheduledTimer(
            timeInterval: interval,
            target: self,
            selector: #selector(Timer.rb_timerFired(timer:)),
            userInfo: block,
            repeats: repeats
        )
        return timer
    }
    
    @objc private static func rb_timerFired(timer: Timer) {
        if let block = timer.userInfo as? (() -> Swift.Void) {
            block()
        }
    }
    
    // 没有接口知道Timer实例是否是重复的，所以和rb_timer接口一样增加repeats参数
    // 一个办法是在构造时userInfo使用字典，添加repeats字段，但是会增加一些开销，暂时不这样实现
    // 调用者应该注意传入正确的repeats参数
    @objc public func rb_postpone(_ interval: TimeInterval, repeats: Bool = true) -> Timer {
        assert(userInfo != nil)
        
        if !isValid {
            return Timer.scheduledTimer(
                timeInterval: interval,
                target: self,
                selector: #selector(Timer.rb_timerFired(timer:)),
                userInfo: userInfo,
                repeats: repeats
            )
        } else {
            fireDate = Date(timeIntervalSinceNow: interval)
            return self
        }
    }
    
}
