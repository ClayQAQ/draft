//
//  LoginInputView.swift
//  login
//
//  Created by clay-rokid on 2023/5/25.
//

import UIKit
import SnapKit

class LoginInputView: UIView {
    let leftName: String
    let rightName: String
    let leftLabel: UILabel = UILabel()
    let rightField: UITextField = UITextField()
    var isSecret: Bool = false

    init(_ leftName: String, _ rightName: String, _ isSecret: Bool = false) {
        self.leftName = leftName
        self.rightName = rightName
        self.isSecret = isSecret
        super.init(frame: .zero)
        self.backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        //left label
        self.addSubview(leftLabel)
        leftLabel.text = leftName
        leftLabel.font = UIFont.systemFont(ofSize: 16)
        leftLabel.textColor = UIColor(red: 19/255.0, green: 19/255.0, blue: 19/255.0, alpha: 1.0)
        leftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(33)
            make.height.equalTo(31)
        }
            
        //right textfield
        self.addSubview(rightField)
        if isSecret {
            rightField.textContentType = .password
        }
        rightField.font = UIFont.systemFont(ofSize: 16)
        rightField.attributedPlaceholder = NSAttributedString(string: rightName,
                                                              attributes: [.foregroundColor: UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0), .font: UIFont.systemFont(ofSize: 16)])
        rightField.textColor = UIColor(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0)
        rightField.snp.makeConstraints { make in
            make.left.equalTo(leftLabel.snp.right).offset(48)
            make.centerY.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(31)
        }
        
        //bottom line
        let line = UIView()
        self.addSubview(line)
        line.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        line.backgroundColor = UIColor(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1.0)
    }
    
}
