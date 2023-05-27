//
//  LoginBaseVC.swift
//  login
//
//  Created by clay-rokid on 2023/5/27.
//

import UIKit
import SnapKit

class LoginBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        let liteImageView = UIImageView(image: UIImage(named: "Lite.png"))
        liteImageView.contentMode = .scaleAspectFit
        view.addSubview(liteImageView)
        liteImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 186, height: 108))
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(67)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
