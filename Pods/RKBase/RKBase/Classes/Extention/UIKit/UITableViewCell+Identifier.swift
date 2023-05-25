//
//  UITableViewCell-Identifier.swift
//  rokid
//
//  Created by 朝辉贾 on 24/10/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    @objc open class var identifier : String {
        get{
            return NSStringFromClass(self)
        }
    }
}
