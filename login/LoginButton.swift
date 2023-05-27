//
//  LoginButton.swift
//  login
//
//  Created by 李文仲 on 2023/5/27.
//

import UIKit

let loginBtnHeight: CGFloat = 44

class LoginButton: UIButton {
    var title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = loginBtnHeight / 2
    }
}
