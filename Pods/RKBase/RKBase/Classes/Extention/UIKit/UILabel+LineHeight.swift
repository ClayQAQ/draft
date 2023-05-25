//
//  UILabel-LineHeight.swift
//  RokidApp
//
//  Created by 朝辉贾 on 07/12/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

 extension UILabel {
    private static let lineSpacingLabel = UILabel()
    
    static public func height(for text: String,
                       width: CGFloat,
                       fontSize: CGFloat,
                       lineSpacing: CGFloat,
                       numberOfLines: Int = 0) -> CGFloat {
        lineSpacingLabel.frame = CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude)
        lineSpacingLabel.font = UIFont.systemFont(ofSize: fontSize)
        lineSpacingLabel.numberOfLines = numberOfLines
        lineSpacingLabel.setText(text: text, lineSpacing: lineSpacing)
        lineSpacingLabel.sizeToFit()
        return lineSpacingLabel.bounds.size.height
    }
    
   public func setText(text: String?, lineSpacing: CGFloat) {
        guard lineSpacing > 0.5 && text != nil else {
            self.text = text
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text!)
    attributedString.addAttribute(NSAttributedString.Key.font, value: self.font as Any, range: NSRange.init(location: 0, length: text!.count))
        
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = self.lineBreakMode
        paragraphStyle.alignment = self.textAlignment
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange.init(location: 0, length: text!.count))
        self.attributedText = attributedString
    }
}
