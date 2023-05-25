//
//  UITabBarController-Visible.swift
//  RokidApp
//
//  Created by coco zhou on 2018/5/28.
//  Copyright © 2018年 Rokid. All rights reserved.
//

import UIKit

extension UITabBarController {

    //    func setTabBarVisible(visible:Bool, duration: TimeInterval, animated:Bool) {
//        if (tabBarIsVisible() == visible) { return }
//        let frame = self.tabBar.frame
//        let height = frame.size.height
//        let offsetY = (visible ? -height : height)
//
//        if frame.origin.y < UIScreen.main.bounds.height - height {
//            return
//        }
//        if frame.origin.y > UIScreen.main.bounds.height {
//            return
//        }
//
//        // animation
//        if #available(iOS 10.0, *) {
//            UIViewPropertyAnimator(duration: duration, curve: .linear) {
//                self.tabBar.frame.offsetBy(dx:0, dy:offsetY)
//                self.view.frame = CGRect(x:0,y:0,width: self.view.frame.width, height: self.view.frame.height + offsetY)
//                self.view.setNeedsDisplay()
//                self.view.layoutIfNeeded()
//                }.startAnimation()
//        } else {
//            // Fallback on earlier versions
//            UIView.animate(withDuration: animated ? duration : 0.0) {
//                self.view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + offsetY)
//                self.view.setNeedsDisplay()
//                self.view.layoutIfNeeded()
//            }
//        }
//    }
//
//    func tabBarIsVisible() ->Bool {
//        return self.tabBar.frame.origin.y < UIScreen.main.bounds.height
//    }
    
   public func setTabBarVisible(visible: Bool, animated: Bool = true) {
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (isTabBarVisible == visible) { return }
        
        // get a frame calculation ready
        let frame = self.tabBar.frame
        let height = frame.size.height
        let offsetY = (visible ? -height : height)
        
        // zero duration means no animation
        let duration: TimeInterval = (animated ? 0.3 : 0.0)
        
        //  animate the tabBar
        UIView.animate(withDuration: duration) {
            self.tabBar.frame = frame.offsetBy(dx: 0, dy: offsetY)
        }
    }
    
   public var isTabBarVisible: Bool {
        return self.tabBar.frame.origin.y < self.view.frame.maxY
    }
}
