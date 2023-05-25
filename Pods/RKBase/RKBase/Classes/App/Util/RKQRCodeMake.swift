//
//  RBQrCode.swift
//  rokid
//
//  Created by wtb on 17/3/21.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import UIKit

public enum RKQRCodeCorrectionLevel: String {
    case high = "H" // 30%
    case quarter = "Q" // 25 %
    case middle = "M" // 15%
    case low = "L" // 7%
}

public func RKQRCodeMake(_ message: Data,
                         correctionLevel: RKQRCodeCorrectionLevel = .middle,
                         side: CGFloat = 300) -> UIImage?
{
    guard let filter = CIFilter(name:"CIQRCodeGenerator") else {
        return nil
    }
    
    filter.setDefaults()
    filter.setValue(message, forKey: "inputMessage")
    filter.setValue(correctionLevel.rawValue, forKey: "inputCorrectionLevel")
    guard let qrImage = filter.outputImage else {
        return nil
    }
    
    let scale = side / qrImage.extent.size.width
    let transform = CGAffineTransform(scaleX: scale,y: scale)
    
    let codeImage = UIImage(ciImage: qrImage.transformed(by: transform))
    return codeImage
}
