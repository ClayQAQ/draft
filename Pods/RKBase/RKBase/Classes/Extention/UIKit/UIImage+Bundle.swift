//
//  UIImage-Bundle.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/3/5.
//

import Foundation

 extension  UIImage {
    public static func rk_image(imageName:String,bundle:(anyClass:AnyClass?,bundleName:String?)?) -> UIImage?{
        guard bundle != nil else {
            return UIImage(named: imageName)
        }
        if let bundleInClass = bundle?.anyClass {
            let frameworkBundle = Bundle.init(for: bundleInClass)
            if let bundleName = bundle?.bundleName , let url = frameworkBundle.url(forResource: bundleName, withExtension: "bundle") {
                let imageBundle =  Bundle(url: url)
                return UIImage(named: imageName, in: imageBundle, compatibleWith: nil)
            }else {
                return UIImage(named: imageName, in: frameworkBundle, compatibleWith: nil)
            }
        }
        return nil
    }
}
