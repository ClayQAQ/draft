//
//  UIImage-ColorImage.swift
//  rokid
//
//  Created by 朝辉贾 on 03/05/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    public convenience init?(color:UIColor,size:CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage:cgImage)
    }
    
}
