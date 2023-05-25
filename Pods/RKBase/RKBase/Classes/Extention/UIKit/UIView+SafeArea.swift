//
//  UIView-SafeArea.swift
//  rokid
//
//  Created by lamo on 18/09/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension UIView {
    
    public var safeAreaInsetsOrZero: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.safeAreaInsets
        } else {
            return .zero
        }
    }
    
    public var safeAreaInsetsOr20: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.safeAreaInsets
        } else {
            return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        }
    }
    
    @available(iOS 9.0, *)
    public var safeAreaLayoutGuideOrNil: UILayoutGuide? {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide
        } else {
            return nil
        }
    }
    
}
