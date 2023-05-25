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

    init(_ leftName: String, _ rightName: String) {
        self.leftName = leftName
        self.rightName = rightName
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
        leftLabel.textColor = .black
        leftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(33)
            make.height.equalTo(31)
        }
            
        //right textfield
        self.addSubview(rightField)
        rightField.placeholder = rightName
        rightField.font = UIFont.systemFont(ofSize: 16)
        rightField.textColor = UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0)
        rightField.snp.makeConstraints { make in
            make.left.equalTo(leftLabel.snp.right).offset(48)
            make.centerY.equalToSuperview()
            make.width.equalTo(230)
            make.height.equalTo(31)
        }
    }
    
}
