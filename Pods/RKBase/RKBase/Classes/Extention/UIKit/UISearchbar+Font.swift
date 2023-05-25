//
//  UISearchbar-Font.swift
//  rokid
//
//  Created by 朝辉贾 on 22/09/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension UISearchBar {
    
    //iOS 11相比之前的版本UISearchBar与UITextField之间多了一层UIView,所以需要递归
   public func setFont(font : UIFont) {
        let textfield = self.findSubviewOf(clz: UITextField.self, recusively: true) as? UITextField
        textfield?.font = font
    }
}
