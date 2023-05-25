//
//  UITextField-Content.swift
//  rokid
//
//  Created by lamo on 2017/6/25.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation


extension String {
    
    public func range(with nsrange: NSRange) -> Range<String.Index> {
        let start = self.index(self.startIndex, offsetBy: nsrange.location)
        let end = self.index(start, offsetBy: nsrange.length)
        return start..<end
    }
    
}

extension UITextField {
    
    /// 可以在textField(_:shouldChangeCharactersIn:replacementString:)中计算replace后的字符串
    public func textAfter(replacing string: String, `in` range: NSRange) -> String {
        if let text = self.text {
            // emoji字符NSString的length方法返回2，String的charactersView.count返回1
            // textField(_:shouldChangeCharactersIn:replacementString:)方法中range参数的值是按NSString的方法计算的
            // 所以这里也使用NSString的replaing方法
            return (text as NSString).replacingCharacters(in: range, with: string)
        } else if range.length != 0 || range.location != 0 {
            return ""
        } else {
            return string
        }
    }
    
}

extension UITextView {
    
    public func textAfter(replacing string: String, `in` range: NSRange) -> String {
        if let text = self.text {
            return (text as NSString).replacingCharacters(in: range, with: string)
        } else if range.length != 0 || range.location != 0 {
            return ""
        } else {
            return string
        }
    }
    
}
