//
//  UIApplication-Alert.swift
//  rokid
//
//  Created by 朝辉贾 on 06/06/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension UIApplication {
    
    public func alert(message : String) {
        alert(title: nil, message: message)
    }
    
    public func alert(title: String?, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK".localize, style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(action)
        UIViewController.rk_topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    public func alert(title: String?, message:String,onOk:@escaping ()->Void) {
        alert(title: title, message: message, onOk: onOk, onCancel: nil)
    }
    
    public func alert(title: String?,
                      message:String,
                      okTitle: String? = nil,
                      cancelTitle: String? = nil,
                      onOk: (()->Void)?,
                      onCancel: (()->Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: okTitle ?? "OK".localize, style: UIAlertAction.Style.default) { (_) in
            onOk?()
        }
        let cancel = UIAlertAction(title: cancelTitle ?? "Cancel".localize, style: UIAlertAction.Style.default) { (_) in
            onCancel?()
        }
        alertController.addAction(cancel)
        alertController.addAction(ok)
        UIViewController.rk_topViewController()?.present(alertController, animated: true, completion: nil)
    }
}
