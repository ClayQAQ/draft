//
//  UIImage-TintColor.swift
//  RokidApp
//
//  Created by BeyondChao on 2018/7/31.
//  Copyright © 2018年 Rokid. All rights reserved.
//

import UIKit

// Reference: https://onevcat.com/2013/04/using-blending-in-ios/

extension UIImage {

    public func imageWithTintColor(_ tintColor: UIColor, blendMode: CGBlendMode = .destinationIn) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        tintColor.setFill()
        let bounds = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIRectFill(bounds)
        
        self.draw(in: bounds, blendMode: blendMode, alpha: 1.0)
        
        if blendMode != .destinationIn {
            self.draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
        }
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage
    }

}
