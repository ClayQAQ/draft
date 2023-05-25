//
//  String-Match.swift
//  rokid
//
//  Created by 朝辉贾 on 05/06/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension String {
    
    public func matchPattern(pattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@",pattern)
        return predicate.evaluate(with:self)
    }
    
    public func isPhone() -> Bool {
        return self.isChinaPhone() || self.isAmericaPhone()
    }
    
    public func isChinaPhone() -> Bool {
        return matchPattern(pattern: "^((\\+86)|(86))?1+\\d{10}")
    }
    
    public func isAmericaPhone() -> Bool {
        return matchPattern(pattern: "^\\d{10}")
    }
    
    public func isEmail() -> Bool {
        return matchPattern(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
    }
    
    //包含字符、数字、下划线
    public func isNick(minLength:UInt = 1,maxLength:UInt = 10) -> Bool {
        return matchPattern(pattern: "\\w{\(minLength),\(maxLength)}")
    }
    
    public func isURL() -> Bool {
        return matchPattern(pattern: "((http|ftp|https)://)?(([a-zA-Z0-9\\._-]+\\.[a-zA-Z]{2,6})|([0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}))(:[0-9]{1,4})*(/[a-zA-Z0-9\\&%_\\./-~-]*)?")
    }
    
    public func isChineseCharacters() -> Bool {
        return matchPattern(pattern: "^[\u{4e00}-\u{9fa5}]+")
    }
    
    public func deleteUnexpectedCharacters() -> String {
        let str = self.trimmingCharacters(in: .whitespaces)
        let characterSet = CharacterSet(charactersIn: "若琪，,：:；; ")
        let strTmp = str.trimmingCharacters(in: characterSet)
        return strTmp
    }
    
    public func deleteUnexpectedCharactersTTS() -> String {
        let str = self.trimmingCharacters(in: .whitespaces)
        let characterSet = CharacterSet(charactersIn: "，,：:；; ")
        let strTmp = str.trimmingCharacters(in: characterSet)
        return strTmp
    }

    public func getWords()->String
    {
        var words: String {
            return components(separatedBy: .punctuationCharacters)
                .joined()
//                .components(separatedBy: .whitespacesAndNewlines)
//                .joined()
                .components(separatedBy: .controlCharacters)
                .joined()
                .components(separatedBy: .nonBaseCharacters)
                .joined()
                .components(separatedBy: .illegalCharacters)
                .joined()
                .components(separatedBy: .symbols)
                .filter{!$0.isEmpty}
                .joined()
        }
        return words
    }
    
    public func getWordsForTTS()->String
    {
        var words: String {
            return
                //components(separatedBy: .punctuationCharacters)
                //.joined()
                //.components(separatedBy: .whitespacesAndNewlines)
                //.joined()
                //.
                components(separatedBy: .controlCharacters)
                .joined()
                .components(separatedBy: .nonBaseCharacters)
                .joined()
                .components(separatedBy: .illegalCharacters)
                .joined()
                .components(separatedBy: .symbols)
                .filter{!$0.isEmpty}
                .joined()
        }
        return words
    }

    public func getWordsForASR()->String
    {
        var words: String {
            return components(separatedBy: .punctuationCharacters)
                .joined()
                //.components(separatedBy: .whitespacesAndNewlines)
                //.joined()
                .components(separatedBy: .controlCharacters)
                .joined()
                .components(separatedBy: .nonBaseCharacters)
                .joined()
                .components(separatedBy: .illegalCharacters)
                .joined()
                .components(separatedBy: .symbols)
                .filter{!$0.isEmpty}
                .joined()
        }
        return words
    }
    
    public var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    public var hasNumbers: Bool {
        return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    }
    
    
    /// 目前密码规则为：密码强度设置8位及以上，同时包含大/小写英文字符、数字字符与符号其中的2种。具体需求见附件prd。（保持当前符号规则不变，即手机端输入法键盘中支持输入的字符）
    ///
    /// - Returns: ture 表示
    public func checkPasswordRull() -> Bool {
        if self.isEmpty {
            return false
        }
        if matchPattern(pattern: "^[0-9]+") { //纯数字
            return false
        } else if matchPattern(pattern: "^[a-zA-Z]+") {//纯英文
            return false
        } else if matchPattern(pattern: "^[^a-zA-Z0-9]+"){//纯非字符
            return false
        }
        return true
    }
    
}
