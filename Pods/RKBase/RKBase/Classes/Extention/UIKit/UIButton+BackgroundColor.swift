//
//  UIButton-BackgroundColor.swift
//  RokidApp
//
//  Created by 朝辉贾 on 22/12/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

private var kHighlightedColorKey = "kHighlightedColor"
private var kDefaultBackgroundColorKey = "kDefaultBackgroundColor"
extension UIButton {
    
   public var rk_highlightedBackgroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &kHighlightedColorKey) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &kHighlightedColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            if newValue != nil {
                self.addTarget(self, action: #selector(setHighlightColor), for: .touchDown)
                self.addTarget(self, action: #selector(resetBackgroundColor), for: .touchUpInside)
                self.addTarget(self, action: #selector(resetBackgroundColor), for: .touchUpOutside)
                self.addTarget(self, action: #selector(resetBackgroundColor), for: .touchDragOutside)
            }else {
                self.removeTarget(self, action: #selector(setHighlightColor), for: .touchDown)
                self.removeTarget(self, action: #selector(resetBackgroundColor), for: .touchUpInside)
                self.removeTarget(self, action: #selector(resetBackgroundColor), for: .touchUpOutside)
                self.addTarget(self, action: #selector(resetBackgroundColor), for: .touchDragOutside)
            }
        }
    }
    
   public var defaultBackgroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &kDefaultBackgroundColorKey) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &kDefaultBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    @objc public func setHighlightColor() {
        self.defaultBackgroundColor = self.backgroundColor
        self.backgroundColor = self.rk_highlightedBackgroundColor
    }
    
    @objc public func resetBackgroundColor() {
        self.backgroundColor = defaultBackgroundColor
    }
}
