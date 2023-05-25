//
//  TestVC.swift
//  login
//
//  Created by clay-rokid on 2023/5/25.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    let funcTitle = UILabel()
    var isPwdSelected = true
    let selectedColor: UIColor = .black
    let unselectedColor: UIColor = .lightGray
    let inputScopeView = UIView()
    let accountFeild = UITextField()
    let pwdFeild = UITextField()
    let loginBtn = UIButton()
    let registerBtn = UIButton()
    
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
        let firstView = LoginInputView("账号", "请输入手机号码")
        inputScopeView.addSubview(firstView)
        firstView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalToSuperview()
        }
        
        
        //sms view
        
        
        
        //login and register view
        let bottomView = UIView()
        bottomView.backgroundColor = .green
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.left.right.equalTo(inputScopeView)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(inputScopeView.snp.bottom)
            make.height.equalTo(150)
        }
        
        
        
        
        
    }
    
    @objc func registerAction() {
        print("register !!!")
    }
    
}
