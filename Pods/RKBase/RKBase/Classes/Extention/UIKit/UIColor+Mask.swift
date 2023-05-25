//
//  UIColor-Mask.swift
//  rokid
//
//  Created by lamo on 2017/7/28.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

private func mask(_ c: CGFloat, _ alpha: CGFloat, _ mask: CGFloat, _ maskAlpha: CGFloat) -> CGFloat {
    return (mask - alpha * c) * maskAlpha + c
}

extension UIColor {
    
    /// 增加颜色遮罩
    public func masked(_ color: UIColor) -> UIColor {
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        var mr = CGFloat(0)
        var mg = CGFloat(0)
        var mb = CGFloat(0)
        var ma = CGFloat(0)
        color.getRed(&mr, green: &mg, blue: &mb, alpha: &ma)
        
        r = mask(r, a, mr, ma)
        g = mask(g, a, mg, ma)
        b = mask(b, a, mb, ma)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    public func masked(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        r = mask(r, a, CGFloat(red) / 255, alpha)
        g = mask(g, a, CGFloat(green) / 255, alpha)
        b = mask(b, a, CGFloat(blue) / 255, alpha)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    public func maskedWhite(alpha: CGFloat = 0.5) -> UIColor {
        return self.masked(red: 255, green: 255, blue: 255, alpha: alpha)
    }
    
    public func maskedBlack(alpha: CGFloat = 0.5) -> UIColor {
        return self.masked(red: 0, green: 0, blue: 0, alpha: alpha)
    }
    
}
