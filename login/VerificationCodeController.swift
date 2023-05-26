//
//  VerificationCodeController.swift
//  login
//
//  Created by clay-rokid on 2023/5/26.
//

import UIKit
import SnapKit

class VerificationCodeController: UIViewController, UITextFieldDelegate {
    lazy var codeView: VerificationCodeView = {
        let codeView = VerificationCodeView.init(inputTextNum: 6)
        self.view.addSubview(codeView)
        return codeView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        codeView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(48)
        }
        codeView.textFiled.becomeFirstResponder()
        
        // 监听验证码输入的过程
        codeView.textValueChange = { str in
            // 要做的事情
        }
        
        // 监听验证码输入完成
        codeView.inputFinish = { str in
            // 要做的事情
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
