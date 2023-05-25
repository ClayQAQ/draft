//
//  String-Size.swift
//  rokid
//
//  Created by lamo on 2017/7/19.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension CGSize {
    
    public var ceiled: CGSize {
        return CGSize(width: ceil(self.width), height: ceil(self.height))
    }
    
}

extension String {
    
    /// 计算多行字符串的size
    public func multiLineSize(with width: CGFloat, attributes: [NSAttributedString.Key: Any]? = nil) -> CGSize {
        return (self as NSString).boundingRect(
            with: CGSize(width: width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: attributes,
            context: nil
        ).size.ceiled
    }
    
    /// 计算多行字符串的size
    public func multiLineSize(with width: CGFloat, fontSize:CGFloat) -> CGSize {
        return (self as NSString).boundingRect(
            with: CGSize(width: width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: fontSize)],
            context: nil
            ).size.ceiled
    }
    
    /// 计算单行字符串的width
    public func getLabelWidth(font: UIFont, height: CGFloat) -> CGFloat {
        
        let size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: height)
        
        let strSize = (self as NSString).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size
        
        return strSize.width
    }
    
}

extension NSAttributedString {
    
    /// 计算多行字符串的size
    public func multiLineSize(with width: CGFloat) -> CGSize {
        return self.boundingRect(
            with: CGSize(width: width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            context: nil
        ).size.ceiled
    }
    
}
