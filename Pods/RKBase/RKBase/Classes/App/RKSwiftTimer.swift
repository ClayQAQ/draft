//
//  RKSwiftTimer.swift
//  RokidForAlexa
//
//  Created by BeyondChao on 2018/8/6.
//  Copyright © 2018年 BeyondChao. All rights reserved.
//  Reference: https://github.com/100mango/zen/blob/master/%E6%89%93%E9%80%A0%E4%B8%80%E4%B8%AA%E4%BC%98%E9%9B%85%E7%9A%84Timer/make%20a%20timer.md

import Foundation

public class RKSwiftTimer {
    
    private let internalTimer: DispatchSourceTimer
    
    private var isRunning = false
    
    public let repeats: Bool
    
    public typealias RKSwiftTimerHandler = (RKSwiftTimer) -> Void
    
    private var handler: RKSwiftTimerHandler
    
    public init(interval: DispatchTimeInterval, repeats: Bool = false, leeway: DispatchTimeInterval = .seconds(0), queue: DispatchQueue = .main , handler: @escaping RKSwiftTimerHandler) {
        
        self.handler = handler
        self.repeats = repeats
        internalTimer = DispatchSource.makeTimerSource(queue: queue)
        internalTimer.setEventHandler { [weak self] in
            if let strongSelf = self {
                handler(strongSelf)
            }
        }
        
        if repeats {
            internalTimer.schedule(deadline: .now() + interval, repeating: interval, leeway: leeway)
        } else {
            internalTimer.schedule(deadline: .now() + interval, leeway: leeway)
        }
    }
    
    public static func repeaticTimer(interval: DispatchTimeInterval, leeway: DispatchTimeInterval = .seconds(0), queue: DispatchQueue = .main , handler: @escaping RKSwiftTimerHandler ) -> RKSwiftTimer {
        return RKSwiftTimer(interval: interval, repeats: true, leeway: leeway, queue: queue, handler: handler)
    }
    
    deinit {
        if !self.isRunning {
            internalTimer.resume()
        }
    }
    
    //You can use this method to fire a repeating timer without interrupting its regular firing schedule. If the timer is non-repeating, it is automatically invalidated after firing, even if its scheduled fire date has not arrived.
    public func fire() {
        if repeats {
            handler(self)
        } else {
            handler(self)
            internalTimer.cancel()
        }
    }
    
    public func start() {
        if !isRunning {
            internalTimer.resume()
            isRunning = true
        }
    }
    
    public func suspend() {
        if isRunning {
            internalTimer.suspend()
            isRunning = false
        }
    }
    
    public func rescheduleRepeating(interval: DispatchTimeInterval) {
        if repeats {
            internalTimer.schedule(deadline: .now() + interval, repeating: interval)
        }
    }
    
    public func rescheduleHandler(handler: @escaping RKSwiftTimerHandler) {
        self.handler = handler
        internalTimer.setEventHandler { [weak self] in
            if let strongSelf = self {
                handler(strongSelf)
            }
        }
        
    }
}

//MARK: Throttle
 extension RKSwiftTimer {
    
    private static var workItems = [String:DispatchWorkItem]()
    
    ///The Handler will be called after interval you specified
    ///Calling again in the interval cancels the previous call
    public static func debounce(interval: DispatchTimeInterval, identifier: String, queue: DispatchQueue = .main , handler: @escaping () -> Void ) {
        
        //if already exist
        if let item = workItems[identifier] {
            item.cancel()
        }
        
        let item = DispatchWorkItem {
            handler();
            workItems.removeValue(forKey: identifier)
        };
        workItems[identifier] = item
        queue.asyncAfter(deadline: .now() + interval, execute: item);
    }
    
    ///The Handler will be called after interval you specified
    ///It is invalid to call again in the interval
    public static func throttle(interval: DispatchTimeInterval, identifier: String, queue: DispatchQueue = .main , handler: @escaping () -> Void ) {
        
        //if already exist
        if workItems[identifier] != nil {
            return;
        }
        
        let item = DispatchWorkItem {
            handler();
            workItems.removeValue(forKey: identifier)
        };
        workItems[identifier] = item
        queue.asyncAfter(deadline: .now() + interval, execute: item);
        
    }
    
    public static func cancelThrottlingTimer(identifier: String) {
        if let item = workItems[identifier] {
            item.cancel()
            workItems.removeValue(forKey: identifier)
        }
    }
}

//MARK: Count Down
public class RKSwiftCountDownTimer {
    
    private let internalTimer: RKSwiftTimer
    
    private var leftTimes: Int
    
    private let originalTimes: Int
    
    private let handler: (RKSwiftCountDownTimer, _ leftTimes: Int) -> Void
    
    public init(interval: DispatchTimeInterval, times: Int,queue: DispatchQueue = .main , handler:  @escaping (RKSwiftCountDownTimer, _ leftTimes: Int) -> Void ) {
        
        self.leftTimes = times
        self.originalTimes = times
        self.handler = handler
        self.internalTimer = RKSwiftTimer.repeaticTimer(interval: interval, queue: queue, handler: { _ in
        })
        self.internalTimer.rescheduleHandler { [weak self]  swiftTimer in
            if let strongSelf = self {
                if strongSelf.leftTimes > 0 {
                    strongSelf.leftTimes = strongSelf.leftTimes - 1
                    strongSelf.handler(strongSelf, strongSelf.leftTimes)
                } else {
                    strongSelf.internalTimer.suspend()
                }
            }
        }
    }
    
    public func start() {
        self.internalTimer.start()
    }
    
    public func suspend() {
        self.internalTimer.suspend()
    }
    
    public func reCountDown() {
        self.leftTimes = self.originalTimes
    }
    
}

 extension DispatchTimeInterval {
    
    public static func fromSeconds(_ seconds: Double) -> DispatchTimeInterval {
        return .milliseconds(Int(seconds * 1000))
    }
}
