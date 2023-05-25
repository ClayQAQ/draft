//
//  UIBarButtonItem-Block.swift
//  rokid
//
//  Created by lamo on 2017/5/9.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

private var kBlockHandler = "kBlockHandler"

extension UIBarButtonItem {
    
    public typealias Handler = (UIBarButtonItem) -> Void
    
    private var handler: Handler? {
        set {
            objc_setAssociatedObject(self, &kBlockHandler, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &kBlockHandler) as? Handler
        }
    }
    
    @objc public convenience init(systemItem: UIBarButtonItem.SystemItem, handler: @escaping Handler) {
        self.init(barButtonSystemItem: systemItem, target: nil, action: nil)
        self.target = self
        self.action = #selector(rb_blockHandler)
        self.handler = handler
    }
    
    @objc public convenience init(title: String?, style: UIBarButtonItem.Style, handler: @escaping Handler) {
        self.init(title: title, style: style, target: nil, action: nil)
        self.target = self
        self.action = #selector(rb_blockHandler)
        self.handler = handler
    }
    
    @objc public convenience init(image: UIImage?, style: UIBarButtonItem.Style, handler: @escaping Handler) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.target = self
        self.action = #selector(rb_blockHandler)
        self.handler = handler
    }
    
    @objc public convenience init(image: UIImage?,
                            landscapeImagePhone: UIImage?,
                            style: UIBarButtonItem.Style,
                            handler: @escaping Handler) {
        self.init(
            image: image,
            landscapeImagePhone: landscapeImagePhone,
            style: style,
            target: nil,
            action: nil
        )
        self.target = self
        self.action = #selector(rb_blockHandler)
        self.handler = handler
    }
    
    @objc private func rb_blockHandler() {
        self.handler?(self)
    }
    
}
