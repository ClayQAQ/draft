//
//  RegisterVC.swift
//  login
//
//  Created by clay-rokid on 2023/5/27.
//

import UIKit
import SnapKit

class RegisterVC: LoginBaseVC {
    let funcTitle = UILabel()
    let inputScopeView = UIView()
    let loginBtn = LoginButton(title: "下一步")
    let forgetBtn = UIButton(type: .custom)
    let accountView = LoginInputView(left: "+86", right: "请输入手机号码", keyboardType: .numberPad, countLimit: 11, isSecret: false)
    let pwdView = LoginInputView(left: "密码", right: "设置不低于六位字符长度", keyboardType: .default, countLimit: 20, isSecret: true)
    let policyBtn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //function title
        funcTitle.text = "注册账号"
        funcTitle.textColor = .black
        funcTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(funcTitle)
        funcTitle.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(31)
            make.left.equalTo(view).offset(27)
            make.top.equalTo(view).offset(107)
        }
        
        
        
        //input view
        view.addSubview(inputScopeView)
        inputScopeView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(funcTitle.snp.bottom).offset(68)
            make.left.equalTo(view).offset(28)
            make.right.equalTo(view).offset(-28)
            make.height.equalTo(110)
        }
        //inner subviews
        //account view
        inputScopeView.addSubview(accountView)
        accountView.fieldChanged = { (text: String) in
            self.checkInputState()
        }
        accountView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalToSuperview()
        }
        //pwd view
        inputScopeView.addSubview(pwdView)
        pwdView.fieldChanged = { (text: String) in
            self.checkInputState()
        }
        pwdView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalTo(accountView.snp.bottom).offset(6)
        }
        
        
        //loginbtn
        view.addSubview(loginBtn)
        self.loginBtn.isEnabled = false
        loginBtn.backgroundColor = UIColor(HEX: 0x3C81F6,alpha: 0.5)
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginBtn.snp.makeConstraints { make in
            make.left.right.equalTo(inputScopeView)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(inputScopeView.snp.bottom).offset(36)
            make.height.equalTo(loginBtnHeight)
        }
        
        
        //policy view
        let policyView = UIView()
        view.addSubview(policyView)
        policyView.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(19)
            make.height.equalTo(24)
            make.left.equalTo(view).offset(27)
            make.width.equalTo(300)
        }
        policyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(policyCheckAction)))
        //policy button
        policyView.addSubview(policyBtn)
        policyBtn.setImage(UIImage(named: "uncheck.png"), for: .normal)
        policyBtn.setImage(UIImage(named: "check.png"), for: .selected)
        policyBtn.addTarget(self, action: #selector(policyCheckAction), for: .touchUpInside)
        policyBtn.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(16)
        }
        //policy text
        let policyLabel = UILabel()
        policyLabel.isUserInteractionEnabled = false
        policyLabel.textColor = UIColor(HEX: 0x808287)
        policyLabel.font = UIFont.systemFont(ofSize: 14)
        policyLabel.text = "我已阅读并同意"
        policyLabel.sizeToFit()
        policyView.addSubview(policyLabel)
        policyLabel.snp.makeConstraints { make in
            make.left.equalTo(policyBtn.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
        }
        //policy text button
        let policyTextButton = UIButton(type: .custom)
        policyView.addSubview(policyTextButton)
        policyTextButton.setTitle("用户协议、隐私政策", for: .normal)
        policyTextButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        policyTextButton.setTitleColor(UIColor(HEX: 0x1759F5), for: .normal)
        policyTextButton.addTarget(self, action: #selector(policyTextAction), for: .touchUpInside)
        policyTextButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(policyLabel.snp.right).offset(3)
        }
        
        //forget button
        view.addSubview(forgetBtn)
        forgetBtn.setTitle("忘记密码", for: .normal)
        forgetBtn.layer.cornerRadius = 16;
        forgetBtn.layer.borderWidth = 1;
        forgetBtn.layer.borderColor = UIColor(HEX: 0xE8E8E8).cgColor;
        forgetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        forgetBtn.setTitleColor(UIColor(HEX: 0x3B3B3B), for: .normal)
        forgetBtn.addTarget(self, action: #selector(forgetAction), for: .touchUpInside)
        forgetBtn.snp.makeConstraints { make in
            make.width.equalTo(97)
            make.height.equalTo(32)
            make.centerX.equalToSuperview()
            make.top.equalTo(policyView.snp.bottom).offset(70)
        }
        
        
    }
    
    //button action
    
    @objc func loginAction() {
        print("login !!!")
        let veriCodeVC = VerificationCodeController(phoneNumber: "+86 18768178888")
        self.navigationController?.pushViewController(veriCodeVC, animated: true)
    }
    
    @objc func policyCheckAction() {
        print("policy check !!!")
        policyBtn.isSelected = !policyBtn.isSelected
        checkInputState()
    }
    
    @objc func policyTextAction() {
        print("policy !!!")
        let policyTextVC = PolicyTextVC() //mock
        self.navigationController?.pushViewController(policyTextVC, animated: true)
    }
    
    @objc func forgetAction() {
        print("forget !!!")
        let forgetVC = ForgetPwdVC()
        self.navigationController?.pushViewController(forgetVC, animated: true)
    }
    
    private func checkInputState() {
        if self.accountView.contentCount > 0 && self.pwdView.contentCount > 0  && self.policyBtn.isSelected{
            self.loginBtn.backgroundColor = UIColor(HEX: 0x3C81F6)
            self.loginBtn.isEnabled = true
        } else {
            self.loginBtn.backgroundColor = UIColor(HEX: 0x3C81F6, alpha: 0.5)
            self.loginBtn.isEnabled = false
        }
    }
    
    
    //is chinese phone
    private func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^1[0-9]{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return predicate.evaluate(with: phoneNumber)
    }
    
    
    //touches view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
