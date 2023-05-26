//
//  LoginUtils.swift
//  login
//
//  Created by 李文仲 on 2023/5/27.
//

import Foundation
import UIKit

public extension UIScreen {
    static func width() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    static func height() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    static func size() -> CGSize {
        return UIScreen.main.bounds.size
    }
}

public extension UIColor {
    convenience init(HEX: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((HEX & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((HEX & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(HEX & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    convenience init(HEX: UInt) {
        self.init(
            red: CGFloat((HEX & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((HEX & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(HEX & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
    
}

