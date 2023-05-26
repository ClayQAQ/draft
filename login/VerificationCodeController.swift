//
//  VerificationCodeController.swift
//  login
//
//  Created by clay-rokid on 2023/5/26.
//

import UIKit
import SnapKit

class VerificationCodeTextField: UITextField {
    override func deleteBackward() {
        text = ""
        sendActions(for: .editingChanged)
    }
}

class VerificationCodeController: UIViewController, UITextFieldDelegate {
    private var codeTextFields: [VerificationCodeTextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTextFields()
    }
    
    private func setupTextFields() {
        let edgeLength: Float = 28
        let space: Float = 9
        let counts: Float = 6
        let totalWidth: Float = Float(UIScreen.main.bounds.size.width)
        let deductions: Float = edgeLength*2 + space * Float(counts - 1)
        let finalWidth: Float = totalWidth - deductions
        let width: Float = finalWidth / counts
        
        //bottomView
        let bottomView = UIView()
//        bottomView.backgroundColor = .green
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(edgeLength)
            make.right.equalToSuperview().offset(-edgeLength)
            make.height.equalTo(48)
            make.centerY.equalToSuperview()
        }
        
        
        for index in 0..<6 {
            let textField = VerificationCodeTextField()
//            textField.backgroundColor = .blue
            textField.tag = index
            textField.font = UIFont.boldSystemFont(ofSize: 30)
            textField.textColor = UIColor(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1.0)
            textField.textContentType = .oneTimeCode
            textField.keyboardType = .numberPad
            textField.textAlignment = .center
            textField.delegate = self
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            codeTextFields.append(textField)
            bottomView.addSubview(textField)
            textField.snp.makeConstraints { make in
                make.width.equalTo(width)
                make.height.equalToSuperview().offset(-1)
                make.top.equalToSuperview() //mock
            }
            
            //bottom line
            let line = UIView()
            line.backgroundColor = UIColor(red: 144/255.0, green: 144/255.0, blue: 144/255.0, alpha: 1.0)
            bottomView.addSubview(line)
            line.snp.makeConstraints { make in
                make.width.equalTo(width)
                make.height.equalTo(1)
                make.bottom.equalToSuperview()
            }
            
            if index == 0 {
                textField.snp.makeConstraints { make in
                    make.left.equalToSuperview()
                }
                line.snp.makeConstraints { make in
                    make.left.equalToSuperview()
                }
            } else if index == 5 {
                textField.snp.makeConstraints { make in
                    make.right.equalToSuperview()
                }
                line.snp.makeConstraints { make in
                    make.right.equalToSuperview()
                }
            } else {
                let prev = codeTextFields[index-1]
                textField.snp.makeConstraints { make in
                    make.left.equalTo(prev.snp.right).offset(space)
                }
                line.snp.makeConstraints { make in
                    make.left.equalTo(prev.snp.right).offset(space)
                }
            }
            


        }
        
        // Here, you should add constraints or set frames for the text fields.
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > 1 {
            // If the user is pasting a string (i.e. the incoming string's count is greater than 1), we'll handle it manually.
            let startIndex = textField.tag
            let characters = Array(string)
            for i in 0 ..< characters.count {
                if startIndex + i < codeTextFields.count {
                    codeTextFields[startIndex + i].text = String(characters[i])
                }
            }
            return false
        }
        
        if string.count == 0 {
            if textField.tag != 0 {
                let previousTag = textField.tag - 1
                if let previousResponder = textField.superview?.viewWithTag(previousTag) {
                    previousResponder.becomeFirstResponder()
                }
            }
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
