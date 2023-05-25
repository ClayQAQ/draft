//
//  Locale-hourMode.swift
//  rokid
//
//  Created by lamo on 2017/6/12.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension Locale {
    
    /// 是否是24小时模式，在 设置 -> 通用 -> 日期与时间 中设置
    public var is24HourMode: Bool {
        let desc = Date().description(with: self)
        let ampm = [Calendar.current.amSymbol, Calendar.current.pmSymbol]
        return !ampm.any { desc.contains($0) }
    }
    
}
