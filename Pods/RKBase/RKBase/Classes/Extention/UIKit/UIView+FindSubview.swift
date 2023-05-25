//
//  UIView-FindSubview.swift
//  rokid
//
//  Created by 朝辉贾 on 22/09/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension UIView {
    
    /// 查找第一个符合期望类型的对象
    public func findSubviewOf(clz : AnyClass, recusively : Bool)-> UIView? {
        if recusively {
            for subview in self.subviews {
                if subview.isKind(of:  clz) {
                    return subview
                }else if let grandson = subview.findSubviewOf(clz: clz, recusively: recusively) {
                    return grandson
                }
            }
            return nil
        }else {
            for subview in self.subviews {
                if subview.isKind(of: clz) {
                    return subview
                }
            }
        }
        return nil
    }
    
    public func allSubViewOf(clz : AnyClass, recusively : Bool) -> [UIView] {
        var result : [UIView] = []
        if recusively {
            let some = self.subviews.filter{$0.isKind(of:clz)}
            result.append(contentsOf: some)
            for subview in self.subviews {
                let other = subview.allSubViewOf(clz: clz, recusively: recusively)
                result.append(contentsOf: other)
            }
        }else {
            result = self.subviews.filter{$0.isKind(of: clz)}
        }
        return result
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options:nil)?.first as! T
    }
}
