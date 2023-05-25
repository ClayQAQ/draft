//
//  UIViewController-Hierarchy.swift
//  rokid
//
//  Created by lamo on 2017/5/25.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

 extension UIViewController {
    
    @available(iOS,deprecated: 0.1.0,message: "please use rk_push")
    public func rb_push(viewController vc: UIViewController, animated: Bool = true){
         rk_push(viewController: vc,animated: animated)
    }
    
    @available(iOS,deprecated: 0.1.0,message: "please use rk_popToRoot")
    public func rb_popToRoot(animated: Bool = true) {
        rk_popToRoot(animated: animated)
    }
    @available(iOS,deprecated: 0.1.0,message: "please use rk_pop")
    public func rb_pop(animated: Bool = true) {
       rk_pop(animated: animated)
    }
    @available(iOS,deprecated: 0.1.0,message: "please use rk_popToSelf")
    public func rb_popToSelf(animated: Bool = true) {
        rk_popToSelf(animated: animated)
    }
    
    @available(iOS,deprecated: 0.1.0,message: "please use rk_popTo")
    public func rb_popTo(viewController: UIViewController, animated: Bool = true) {
        viewController.rk_popToSelf()
    }
    
    private func parentInNavigationStack() -> UIViewController? {
        guard let nav = self.navigationController else {
            return nil
        }
        var vc: UIViewController! = self
        while vc != nil {
            if nav.viewControllers.contains(vc) {
                return vc
            }
            vc = vc.parent
        }
        assert(false) // unreachable
        return nil
    }
    
    
    public func rk_push(viewController vc: UIViewController, animated: Bool = true){
        guard let nav = self.navigationController else {
            return
        }
        nav.pushViewController(vc, animated: animated)
    }
    
    public func rk_popToRoot(animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
    
    public func rk_pop(animated: Bool = true) {
        guard let nav = self.navigationController else {
            return
        }
        nav.popViewController(animated: animated)
    }
    
    public func rk_popToSelf(animated: Bool = true) {
        guard let nav = self.navigationController,
            let dest = self.parentInNavigationStack() else {
                return
        }
        nav.popToViewController(dest, animated: animated)
    }
    
    public func rk_popTo(viewController: UIViewController, animated: Bool = true) {
        viewController.rk_popToSelf()
    }
}
