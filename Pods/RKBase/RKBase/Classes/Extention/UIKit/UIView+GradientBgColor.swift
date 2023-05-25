//
//  UIView+GradientBgColor.swift
//  rokid
//
//  Created by 朝辉贾 on 10/06/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

extension UIView {
    public func setGradientBackground(topLeftColor:UIColor, rightBottomColor:UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [topLeftColor.cgColor,rightBottomColor.cgColor]
        self.layer.addSublayer(gradientLayer)
        self.layer.backgroundColor = UIColor.white.cgColor
    }

    public func setHorizontalGradientBackground(rightColor:UIColor, leftColor:UIColor, rect: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = rect
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = [rightColor.withAlphaComponent(0.1).cgColor,
                                leftColor.withAlphaComponent(1.0).cgColor]
        gradientLayer.opacity = 1.0
        self.layer.addSublayer(gradientLayer)
    }
    
    public func setGradientBackground(colors:[UIColor]) {
        guard colors.count >= 2 else {
            return
        }
        setGradientBackground(topLeftColor: colors[0], rightBottomColor: colors[1])
    }
}
