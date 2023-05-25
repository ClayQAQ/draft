//
//  UIView-cornerRadius.swift
//  rokid
//
//  Created by lamo on 2017/6/26.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension UIView {
    
    // https://stackoverflow.com/a/41217863
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    //应对用snpkit约束的控件进行圆角的设置用此api
    public func configSideRadius(corner_rect: UIRectCorner, widget_height: CGFloat) {
        
        self.layoutIfNeeded()
        let bounds = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: widget_height)
        let maskPath = UIBezierPath.init(roundedRect: bounds,
                                         byRoundingCorners: corner_rect,
                                         cornerRadii: CGSize(width: widget_height/2,
                                         height: widget_height/2))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer

    }
    
    public func removeRoundCorners() {
        self.layer.mask = nil
    }
    
   public func addShadows(w: CGFloat, h : CGFloat, blur: CGFloat,  hex:Int, alpha: CGFloat)
    {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: w, height: h)
        self.layer.shadowRadius = blur
        self.layer.shadowColor =  UIColor.hexColor(hex, alpha: alpha).cgColor
        //self.layer.shadowColor =  UIColor.hexColor(hex).cgColor
        self.layer.shadowOpacity = 0.6 // Float(alpha)
    }
    
   public func addShadows(w: CGFloat, h : CGFloat, blur: CGFloat,  hex:Int, alpha: CGFloat, opacity:CGFloat)
    {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: w, height: h)
        self.layer.shadowRadius = blur
        self.layer.shadowColor =  UIColor.hexColor(hex, alpha: alpha).cgColor
        //self.layer.shadowColor =  UIColor.hexColor(hex).cgColor
        self.layer.shadowOpacity = Float(opacity) // Float(alpha)
    }
    
}
