//
//  UIViewController-Alert.swift
//  rokid
//
//  Created by 朝辉贾 on 13/05/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public func alert(message : String) {
        alert(title: nil, message: message)
    }
    
    public func alert(title: String?, message:String) {
        alert(title: title, message: message, OkTitle: "OK".localize, onOk: nil)
    }
    
    public func alert(title: String?, message: String, OkTitle: String, onOk: (()->Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: OkTitle, style: .default) { _ in
            onOk?()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func alert(title: String?, message:String,onOk:@escaping ()->Void) {
        alert(title: title, message: message, onOk: onOk, onCancel: nil)
    }
    
    public func alert(title: String?,
                      message:String,
                      OkTitle: String? = "OK".localize,
                      cancelTitle: String? = "Cancel".localize,
                      onOk: (()->Void)?,
                      onCancel: (()->Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        if cancelTitle != nil {
            let cancel = UIAlertAction(title: cancelTitle, style: .default) { (_) in
                onCancel?()
            }
            alertController.addAction(cancel)
        }
        if OkTitle != nil {
            let ok = UIAlertAction(title: OkTitle, style: .default) { (_) in
                onOk?()
            }
            alertController.addAction(ok)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
}
