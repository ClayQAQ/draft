//
//  TestVC.swift
//  login
//
//  Created by clay-rokid on 2023/5/25.
//

import UIKit
import SnapKit

class LoginVC: UIViewController, UITextViewDelegate {
    let funcTitle = UILabel()
    let inputScopeView = UIView()
    let loginBtn = UIButton(type: .custom)
    let registerBtn = UIButton(type: .custom)
    let forgetBtn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //function title
        funcTitle.text = "账号登录"
        funcTitle.textColor = .black
        funcTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(funcTitle)
        funcTitle.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(31)
            make.left.equalTo(view).offset(27)
            make.top.equalTo(view).offset(107)
        }
        
        //register btn
        view.addSubview(registerBtn)
        registerBtn.setTitle("注册账号", for: .normal)
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        registerBtn.setTitleColor(UIColor(red: 23/255.0, green: 89/255.0, blue: 245/255.0, alpha: 1), for: .normal)
        registerBtn.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        registerBtn.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(31)
            make.right.equalTo(view).offset(-28)
            make.centerY.equalTo(funcTitle)
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
        let accountView = LoginInputView("账号", "请输入手机号码")
        inputScopeView.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalToSuperview()
        }
        //pwd view
        let pwdView = LoginInputView("密码", "请输入密码", true)
        inputScopeView.addSubview(pwdView)
        pwdView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalTo(accountView.snp.bottom).offset(6)
        }
        
        
        //login button
        view.addSubview(loginBtn)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.backgroundColor = UIColor(red: 60/255.0, green: 129/255.0, blue: 246/255.0, alpha: 1.0)
        loginBtn.layer.cornerRadius = 4
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginBtn.snp.makeConstraints { make in
            make.left.right.equalTo(inputScopeView)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(inputScopeView.snp.bottom).offset(36)
            make.height.equalTo(44)
            make.width.equalTo(320)
        }
        
        
        //policy view
        let policyView = UIView()
        view.addSubview(policyView)
        policyView.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(19)
            make.height.equalTo(22)
            make.left.equalTo(view).offset(27)
            make.width.equalTo(300)
        }
        //policy text
        let policyTextView = UITextView()
        let attributedString = NSMutableAttributedString(string: "我已阅读并同意 隐私政策")
        let range = (attributedString.string as NSString).range(of: "隐私政策")
        attributedString.addAttribute(.link, value: "https://www.baidu.com", range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)

        policyTextView.font = UIFont.systemFont(ofSize: 13)
        // 设置 UITextView 的 attributedText
        policyTextView.attributedText = attributedString
        policyTextView.isUserInteractionEnabled = true
        policyTextView.isEditable = false

        // 设置 UITextView 的 delegate，以便在用户点击链接时进行导航
        policyTextView.delegate = self

        // 添加 UITextView 到视图
        policyView.addSubview(policyTextView)
        policyTextView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(200)
        }
        
        //forget button
        view.addSubview(forgetBtn)
        forgetBtn.setTitle("忘记密码", for: .normal)
        forgetBtn.layer.cornerRadius = 16;
        forgetBtn.layer.borderWidth = 1;
        forgetBtn.layer.borderColor = UIColor(red: 0.911, green: 0.911, blue: 0.911, alpha: 1).cgColor;
        forgetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        forgetBtn.setTitleColor(UIColor(red: 59/255.0, green: 59/255.0, blue: 59/255.0, alpha: 1), for: .normal)
        forgetBtn.addTarget(self, action: #selector(forgetAction), for: .touchUpInside)
        forgetBtn.snp.makeConstraints { make in
            make.width.equalTo(97)
            make.height.equalTo(32)
            make.centerX.equalToSuperview()
            make.top.equalTo(policyView.snp.bottom).offset(70)
        }
        
        
    }
    
    @objc func registerAction() {
        print("register !!!")
    }
    
    @objc func loginAction() {
        print("login !!!")
    }
    
    @objc func forgetAction() {
        print("forget !!!")
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        // 这里可以打开一个新的视图来显示隐私政策
        let webViewController = LoginVC() //mock
        self.navigationController?.pushViewController(webViewController, animated: true)
        return false // 返回 false 是因为我们已经处理了链接的点击事件，不希望 UITextView 再进行默认的处理
    }
}
