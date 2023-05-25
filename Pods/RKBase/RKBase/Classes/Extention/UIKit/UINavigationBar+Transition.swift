//
//  UINavigationBar-Transition.swift
//  RokidApp
//
//  Created by BeyondChao on 2018/12/11.
//  Copyright © 2018 Rokid. All rights reserved.
//
// Reference: https://github.com/ltebean/LTNavigationBar/blob/swift3.0/UINavigationBarExtension.swift

import Foundation

extension UINavigationBar {
    
    private struct AssociatedKeys {
        static var overlayKey = "overlayKey"
    }
    
   public var overlay: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.overlayKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.overlayKey, newValue as UIView?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}


extension UINavigationBar {
    
   public func rk_setBackgroundColor(backgroundColor: UIColor) {
        if overlay == nil {
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            let height = UIDevice.current.isIphoneX() ? bounds.height + 40 : bounds.height
            overlay = UIView.init(frame: CGRect.init(x: 0, y: 0, width: bounds.width, height: height + 20))
            overlay?.isUserInteractionEnabled = false
            overlay?.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
            subviews.first?.insertSubview(overlay!, at: 0)
        }
        overlay?.backgroundColor = backgroundColor
    }
    
    
   public func rk_setTranslationY(translationY: CGFloat) {
        transform = CGAffineTransform.init(translationX: 0, y: translationY)
    }
    
    
   public func rk_setElementsAlpha(alpha: CGFloat) {
        for (_, element) in subviews.enumerated() {
            if element.isKind(of: NSClassFromString("UINavigationItemView") as! UIView.Type) ||
                element.isKind(of: NSClassFromString("UINavigationButton") as! UIButton.Type) ||
                element.isKind(of: NSClassFromString("UINavBarPrompt") as! UIView.Type)
            {
                element.alpha = alpha
            }
            
            if element.isKind(of: NSClassFromString("_UINavigationBarBackIndicatorView") as! UIView.Type) {
                element.alpha = element.alpha == 0 ? 0 : alpha
            }
        }
        
        items?.forEach({ (item) in
            if let titleView = item.titleView {
                titleView.alpha = alpha
            }
            for BBItems in [item.leftBarButtonItems, item.rightBarButtonItems] {
                BBItems?.forEach({ (barButtonItem) in
                    if let customView = barButtonItem.customView {
                        customView.alpha = alpha
                    }
                })
            }
        })
    }
    
    
   public func rk_reset() {
        setBackgroundImage(nil, for: UIBarMetrics.default)
        overlay?.removeFromSuperview()
        overlay = nil
    }
}
