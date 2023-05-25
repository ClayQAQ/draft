//
//  UITextField-UnderLine.swift
//  rokid
//
//  Created by 朝辉贾 on 09/06/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension UIView {
    
    static let kUnderLineName = "underline"
    public var showUnderLine: Bool {
        set {
            // UIScrollView不会触发bounds的KVO，无法取消监听导致crash
            assert(!(self is UIScrollView))
            if showUnderLine {
                if underLineLayer == nil {
                    self.createUnderlineLayer()
                    self.observeBounds()
                }
            }else {
                underLineLayer?.removeFromSuperlayer()
                self.unobserveBounds()
            }
        }
        get {
            return self.underLineLayer == nil
        }
    }
    
    public var underLineLayer: CALayer? {
        get {
            let index = self.layer.sublayers?.firstIndex(where: { (sublayer) -> Bool in
                    sublayer.name == UITextField.kUnderLineName
            })
            if index != nil {
                return self.layer.sublayers?[index!]
            }else{
                return nil
            }
        }
    }
    
    func createUnderlineLayer() {
        let underline = CALayer()
        underline.name = UITextField.kUnderLineName
        underline.backgroundColor = RKStyles.Color.grayLine.withAlphaComponent(0.5).cgColor
        self.layer.addSublayer(underline)
    }
    
    func observeBounds() {
        self.addObserver(self, forKeyPath: "bounds", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    func unobserveBounds() {
        self.removeObserver(self, forKeyPath: "bounds")
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "bounds" {
            self.underLineLayer?.frame = CGRect(
                x: 0,
                y: self.bounds.size.height - RKStyles.Layout.lineHeight,
                width: self.bounds.size.width,
                height: RKStyles.Layout.lineHeight
            )
        }
        //TODO:在对象释放是KVO无法释放会导致crash,考虑把这个功能也移到RKTextField中吧
        unobserveBounds()
    }
}
