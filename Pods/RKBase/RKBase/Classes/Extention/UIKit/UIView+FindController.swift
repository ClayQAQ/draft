//
//  UIView-FindController.swift
//  rokid
//
//  Created by 朝辉贾 on 18/11/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension UIView {
   public var viewController: UIViewController? {
        get {
            var target: UIResponder? = self
            while target != nil {
                target = target?.next
                if let _ = target as? UIViewController {
                    break
                }
            }
            if target == self {
                return nil
            }else {
                return target as? UIViewController
            }
        }
    }
}
