//
//  UIImage-Resize.swift
//  rokid
//
//  Created by 朝辉贾 on 23/05/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    
    // 重新缩放图片，如果size.width==0会根据height等比缩放
    public func resize(to size: CGSize) -> UIImage {
        let scale = UIScreen.main.scale
        var width = size.width
        var height = size.height
        if width == 0 {
            width = self.size.width * size.height / self.size.height
        }
        if height == 0 {
            height = self.size.height * size.width / self.size.width
        }
        let scaleSize = CGSize.init(width: width * scale, height: height * scale)
        UIGraphicsBeginImageContextWithOptions(scaleSize, false, scale)
        self.draw(in: CGRect(origin: .zero, size: scaleSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

}
