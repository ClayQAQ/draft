//
//  UIColor-extenstion.swift
//  rokid
//
//  Created by 朝辉贾 on 03/05/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    
    public convenience init(hexValue:Int,alpha:CGFloat) {
        self.init(red: CGFloat((hexValue & 0xff0000) >> 16)/255.0, green: CGFloat((hexValue & 0xff00) >> 8)/255.0, blue:(CGFloat(hexValue & 0x0000ff))/255.0, alpha: alpha)
    }
    
    public convenience init(hexValue:Int) {
        self.init(hexValue:hexValue,alpha:1.0)
    }
    
    public convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    public static func hexColor(_ hex:Int,alpha:CGFloat) -> UIColor {
        return UIColor.init(hexValue:hex,alpha:alpha)
    }
    
    public static func hexColor(_ hex:Int) -> UIColor {
        return UIColor.init(hexValue:hex)
    }
    
    public static func hexStringColor(stringHex hex: String, alpha: CGFloat) -> UIColor {
        return UIColor.init(hexString: hex, alpha: alpha)
    }

}
