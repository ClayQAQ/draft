//
//  VerificationCodeController.swift
//  login
//
//  Created by clay-rokid on 2023/5/26.
//

import UIKit
import SnapKit


let countdown: Int = 60
class VerificationCodeController: LoginBaseVC, UITextFieldDelegate {
    var phoneNumber: String?
    let verifyBtn = LoginButton(title: "验证")
    let getSMSLabel = UILabel()
    let getSMSBtn = UIButton(type: .custom)
    var time: Int = countdown
    var timer: Timer?
    lazy var codeView: VerificationCodeView = {
        let codeView = VerificationCodeView.init(inputTextNum: 6)
        self.view.addSubview(codeView)
        return codeView
    }()
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        //UI setup
        //title label
        let titleLabel = UILabel()
        titleLabel.text = "输入验证码"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor(HEX: 0x171717)
        view.addSubview(titleLabel)
        titleLabel.sizeToFit()
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(27)
            make.top.equalToSuperview().offset(107)
        }
        //phone label
        let phoneLabel = UILabel()
        phoneLabel.text = "已发送至\(phoneNumber ?? "")"
        phoneLabel.font = UIFont.systemFont(ofSize: 14)
        phoneLabel.textColor = UIColor(HEX: 0x3B3B3B)
        view.addSubview(phoneLabel)
        phoneLabel.sizeToFit()
        phoneLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
        }
        
        //sms code view
        codeView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(phoneLabel.snp.bottom).offset(45)
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
            self.checkCanVerify()
        }
        
        
        //button
        view.addSubview(verifyBtn)
        self.verifyBtn.isEnabled = false
        verifyBtn.backgroundColor = UIColor(HEX: 0x3C81F6,alpha: 0.5)
        verifyBtn.addTarget(self, action: #selector(verifyAction), for: .touchUpInside)
        verifyBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.top.equalTo(codeView.snp.bottom).offset(31)
            make.height.equalTo(loginBtnHeight)
        }
        
        //get sms
        //label
        view.addSubview(getSMSLabel)
        getSMSLabel.font = UIFont.systemFont(ofSize: 14)
        getSMSLabel.sizeToFit()
        getSMSLabel.snp.makeConstraints { make in
            make.top.equalTo(verifyBtn.snp.bottom).offset(19)
            make.centerX.equalTo(view)
        }
        //sms button
        getSMSBtn.setTitle("重新获取验证码", for: .normal)
        getSMSBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        getSMSBtn.setTitleColor(UIColor(HEX: 0x1759F5), for: .normal)
        getSMSBtn.addTarget(self, action: #selector(getSMSAction), for: .touchUpInside)
        view.addSubview(getSMSBtn)
        getSMSBtn.snp.makeConstraints { make in
            make.top.equalTo(verifyBtn.snp.bottom).offset(19)
            make.centerX.equalTo(view)
            make.width.equalTo(140)
            make.height.equalTo(20)
        }
        getSMSBtn.isHidden = true
        
        //timer
        resetTimer()
        
        //button
        
    }
    
    //btn action
    @objc func verifyAction() {
        
    }
    
    @objc func getSMSAction() {
        resetTimer()
    }
    
    private func resetTimer() {
        getSMSBtn.isHidden = true
        getSMSLabel.isHidden = false
        time = countdown
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.time = self.time - 1
            let labelString = "\(self.time)s 后重新获取"
            let attrString = NSAttributedString(string: labelString)
            self.getSMSLabel.attributedText = attrString
            if self.time == 0 {
                self.getSMSLabel.isHidden = true
                self.getSMSBtn.isHidden = false
                timer.invalidate()
            }
        }
        timer?.fire()
    }
    
    private func checkCanVerify() {
        self.verifyBtn.backgroundColor = UIColor(HEX: 0x3C81F6)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    deinit {
        timer?.invalidate()
    }
}
