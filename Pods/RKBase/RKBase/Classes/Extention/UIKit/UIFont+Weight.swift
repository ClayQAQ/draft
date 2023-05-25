//
//  UIFont-Weight.swift
//  rokid
//
//  Created by lamo on 2017/7/10.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension UIFont {

    public static func lightSystemFont(ofSize size: CGFloat) -> UIFont {
        let resizeSize = round(Float(size / 375.0 * UIScreen.main.bounds.size.width))
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: CGFloat(resizeSize), weight: UIFont.Weight.light)
        } else {
            return UIFont.systemFont(ofSize: CGFloat(resizeSize))
        }
    }

    public static func regularSystemFont(ofSize size: CGFloat) -> UIFont {
        let resizeSize = round(Float(size / 375.0 * UIScreen.main.bounds.size.width))
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: CGFloat(resizeSize), weight: UIFont.Weight.regular)
        } else {
            return UIFont.systemFont(ofSize: CGFloat(resizeSize))
        }
    }
    
    public static func mediumSystemFont(ofSize size: CGFloat) -> UIFont {
        let resizeSize = round(Float(size / 375.0 * UIScreen.main.bounds.size.width))
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: CGFloat(resizeSize), weight: UIFont.Weight.medium)
        } else {
            return UIFont.systemFont(ofSize: CGFloat(resizeSize))
        }
    }
    
    public static func semiboldSystemFont(ofSize size: CGFloat) -> UIFont {
        let resizeSize = round(Float(size / 375.0 * UIScreen.main.bounds.size.width))
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: CGFloat(resizeSize), weight: UIFont.Weight.semibold)
        } else {
            return UIFont.boldSystemFont(ofSize: CGFloat(resizeSize))
        }
    }
    
    public static func resizeableSystemFont(ofSize size: CGFloat) -> UIFont {
        let resizeSize = round(Float(size / 375.0 * UIScreen.main.bounds.size.width))
        return systemFont(ofSize:CGFloat(resizeSize))
    }
    
    @available(iOS 8.2, *)
    public static func resizeableSystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let resizeSize = round(Float(size / 375.0 * UIScreen.main.bounds.size.width))
        return systemFont(ofSize: CGFloat(resizeSize), weight: weight)
    }
    
    public static func resizeableBoldFont(ofSize size: CGFloat) -> UIFont {
        let resizeSize = round(Float(size / 375.0 * UIScreen.main.bounds.size.width))
        return boldSystemFont(ofSize:CGFloat(resizeSize))
    }
}
