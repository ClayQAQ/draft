//
//  String-xx.swift
//  rokid
//
//  Created by Shper on 2017/11/20.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension String {

    /// 截取 from 位置后的所有字符，from 超过字符串长度，返回空字符 ""
    public func subString(from: Int) -> String {
        if from >= self.count {
            return ""
        }
        let rang = self.index(startIndex, offsetBy: from)..<self.endIndex
        return String(self[rang])
    }
    
    /// 从起始位置开始截取到 to 位置的所有字符，to 超过字符串长度，返回整个字符串
    public func subString(to: Int) -> String {
        if to >= self.count {
            return self;
        }
        let rang = self.startIndex..<self.index(startIndex, offsetBy: to)
        return String(self[rang])
    }
    
    
    //Range转换为NSRange
    public func nsRange(from range: Range<String.Index>) -> NSRange? {
        let utf16view = self.utf16
        if let from = range.lowerBound.samePosition(in: utf16view), let to = range.upperBound.samePosition(in: utf16view) {
            return NSMakeRange(utf16view.distance(from: utf16view.startIndex, to: from), utf16view.distance(from: from, to: to))
        }
        return nil
    }
    
    /// 截取 location 位置后的 length位长度的字符，location 超过字符串长度，返回空字符 ""；
    /// location + length 超过字符串长度，返回 location 位置后的所有字符
    public func subString(location:Int, length:Int) -> String {
        if location >= self.count {
            return ""
        }
        
        if location + length > self.count {
            return self
        }
        
        let locationIndex = self.index(startIndex, offsetBy: location)
        let range = locationIndex..<self.index(locationIndex, offsetBy: length)
        return String(self[range])
    }
    
    /// 下标的方式截取字符串;  string[1,3] 截取 1~3位的字符串
    public subscript(begin: Int, end:Int) -> String {
        if begin >= self.count {
            return ""
        }
        if end >= self.count {
            return subString(from: begin)
        }
        let range = self.index(startIndex, offsetBy: begin)...self.index(startIndex, offsetBy: end)
        return String(self[range])
    }
    
    /// 下标的方式截取字符串;  string[1...3] 截取 1~3位的字符串
    public subscript(range:ClosedRange<Int>) -> String {
        if range.lowerBound >= self.count {
            return ""
        }
        if range.upperBound >= self.count {
            return subString(from: range.lowerBound)
        }
        let range = self.index(startIndex, offsetBy: range.lowerBound )...self.index(startIndex, offsetBy: range.upperBound)
        return String(self[range])
    }
    
    /// 下标的方式截取字符串;  string[1]  截取 位置为1 处的字符
    public subscript(idx: Int) -> String {
        return subString(location: idx, length: 1)
    }
    
    public var containsEmoji: Bool {
            for scalar in unicodeScalars {
                switch scalar.value {
                case 0x1F600...0x1F64F, // Emoticons
                0x1F300...0x1F5FF, // Misc Symbols and Pictographs
                0x1F680...0x1F6FF, // Transport and Map
                0x2600...0x26FF,   // Misc symbols
                0x2700...0x27BF,   // Dingbats
                0xFE00...0xFE0F,   // Variation Selectors
                0x1F900...0x1F9FF:  // Supplemental Symbols and Pictographs
                    return true
                default:
                    continue
                }
            }
            return false
    }
    
    public func firstIndex(sub: String) -> Int {
        var pasiton = -1
        if let range = range(of:sub, options: .literal ) {
            if !range.isEmpty {
                pasiton = self.distance(from: startIndex, to: range.lowerBound)
            }
        }
        
        return pasiton
    }
    
    public func lastIndex(sub: String) -> Int {
        var pasiton = -1
        if let range = range(of: sub, options: .backwards ) {
            if !range.isEmpty {
                pasiton = self.distance(from: startIndex, to: range.lowerBound)
            }
        }
        
        return pasiton
    }
    
    //使用正则表达式替换
    public func pregReplace(pattern: String, with: String,
                     options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [],
                                              range: NSMakeRange(0, self.count),
                                              withTemplate: with)
    }
    
    public var  EmojiPatterStr : String {
        //判断表情的正则表达式
        let pattern =
        "[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]"
        //"[0x00A0...0x00AF] | [ 0x2030...0x204F ] | [0x2120...0x213F] | [0x2190...0x21AF] | [0x2310...0x329F] | [0x1F000...0x1F9CF]"
        return pattern
    }
    
    public func pregReplaceEmoji(with: String,
                     options: NSRegularExpression.Options = []) -> String {
        return pregReplace(pattern: EmojiPatterStr, with: with, options: options)
    }
}
