//
//  LoginInputView.swift
//  login
//
//  Created by clay-rokid on 2023/5/25.
//

import UIKit
import SnapKit

let defaultCountLimit = 20

class LoginInputView: UIView, UITextFieldDelegate {
    let leftName: String
    let rightName: String
    let leftLabel: UILabel = UILabel()
    let rightField: UITextField = UITextField()
    var isSecret: Bool = false
    let boardType: UIKeyboardType
    let countLimit: Int
    var contentCount: Int = 0
    var fieldChanged: ((_ updatedText: String)->())?

    init(left leftName: String, right rightName: String, keyboardType boardType: UIKeyboardType,countLimit: Int = defaultCountLimit, isSecret: Bool = false) {
        self.leftName = leftName
        self.rightName = rightName
        self.isSecret = isSecret
        self.boardType = boardType
        self.countLimit = countLimit
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
        leftLabel.textColor = UIColor(HEX: 0x131313)
        leftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(33)
            make.height.equalTo(31)
        }
            
        //right textfield
        self.addSubview(rightField)
        if isSecret {
            rightField.isSecureTextEntry = true
        }
        rightField.delegate = self
        rightField.keyboardType = boardType
        rightField.font = UIFont.systemFont(ofSize: 16)
        rightField.attributedPlaceholder = NSAttributedString(string: rightName,
                                                              attributes: [.foregroundColor: UIColor(HEX: 0xB4B4B4), .font: UIFont.systemFont(ofSize: 16)])
        rightField.textColor = UIColor(HEX: 0x3B3B3B)
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
        line.backgroundColor = UIColor(HEX: 0xD8D8D8)
    }
    
    //MARK: - TextField Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        contentCount = updatedText.count
        if contentCount > countLimit && !string.isEmpty {
            return false
        }
        if let block = fieldChanged {
            block(updatedText)
        }
        return true
    }
}
