//
//  UIView-Blur.swift
//  RokidApp
//
//  Created by Hu on 2018/11/6.
//  Copyright © 2018年 Rokid. All rights reserved.
//

import Foundation

public extension UIView{
    
    // MARK:比较屌的毛玻璃效果
    func showBlurEffectWithUIVibrancyEffect() -> UIVisualEffectView  {
        //创建一个模糊效果
        let blurEffect = UIBlurEffect(style:.light)
        //创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width:RKSCREEN_WIDTH, height: CGFloat(40.0))
        blurView.isUserInteractionEnabled = true
        self.addSubview(blurView)
        return blurView
    }
    
}
