//
//  UIViewController-Rokid.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/2/21.
//

import Foundation

 extension UIViewController {
  public  class func rk_topViewController() -> UIViewController? {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
        return  rk_topViewController(root: rootViewController)
    }
    
  public  class func rk_topViewController(root viewController:UIViewController) ->UIViewController{
        if viewController is UINavigationController {
              let navigationViewController = viewController as! UINavigationController
            if let topViewController =  navigationViewController.topViewController {
                return  rk_topViewController(root: topViewController)
            }
            
        }else if viewController is UITabBarController {
            let  tabbarController = viewController as! UITabBarController
            if  let selectorViewController = tabbarController.selectedViewController  {
                return  rk_topViewController(root: selectorViewController)
            }
        }else {
            if  let presentViewController = viewController.presentedViewController {
                if presentViewController.isKind(of: UIAlertController.self) == false {
                    return rk_topViewController(root: presentViewController)
                }
            }
        }
         return viewController
    }
    
    public func rk_topViewController() -> UIViewController {
        return UIViewController.rk_topViewController(root: self)
    }
}
