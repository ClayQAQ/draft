//
//  RKApp+Env.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/2/26.
//


import UIKit

public let RKSCREEN_WIDTH  = UIScreen.main.bounds.width
public let RKSCREEN_HEIGHT = UIScreen.main.bounds.height
public let RKAPP_NAVIGITIONBAR_HEIGHT = UIApplication.shared.statusBarFrame.height
public let RKAPP_KEYBORD_HEIGHT :CGFloat =  UIScreen.main.bounds.height > 736 ? 333.0 - 38.0 :(UIScreen.main.bounds.width > 375.0 ? 271.0: 258.0)

extension RKApp {
   public static  var appName:String {
            guard let  name = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String else {
                return "Rokid-App"
            }
            return name
    }
    
   public static  var userAgent :String{
        get {
            //TODO： - 设置App UserAgent
            let userAgent = "" //Plist 里设置
            let appVersion = Bundle.main.rb_versionString ?? "1.0.0"
            let deviceModel = UIDevice.current.model
            let systermName = UIDevice.current.systemName
            let systermVersion = UIDevice.current.systemVersion
            return "Rokid(\(userAgent)/\(appVersion)/\(deviceModel)/\(systermName)/\(systermVersion))"
        }
    }
    
    public static var webUserAgent: String {
        //TODO: - 设置webUserAgent
        return "webUA"
    }
    
    //环境变量
    public static var Env : String {
        return "Account: \(String(describing: userId ?? ""))" +
            " ;Version: \(String(describing: Bundle.main.rb_versionString))" +
            " ;BuildCode: \(String(describing: Bundle.main.rb_buildCode))" +
            " ;ApplicationId: \(String(describing: Bundle.main.rb_appId))" +
            " ;Model: \(String(describing: UIDevice.current.modelName))" +
            " ;iOS: \(String(describing: UIDevice.current.systemVersion))" +
        " ;Name: \(String(describing: UIDevice.current.name))"
    }
    
    //TODO: - 设备指纹
    public static  var dgf : String {
        get{
             return ""
        }
    }
    
    public static var appId : String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    public static var  appVersion : String {
        return "\(Bundle.main.rb_versionString ?? "")-\(Bundle.main.rb_buildCode ?? "")";
    }
    
    public static var appVersionName:String {
        return Bundle.main.rb_versionString ?? ""
    }
    
    public static var  appBuildCode: Int {
        return Int(Bundle.main.rb_buildCode ?? "0") ?? 0
    }
    
    public static var phoneInfo:String {
        let info = ["model": RKSystem.getDeviceModelName(),
                    "systemName": UIDevice.current.systemName,
                    "systemVersion": UIDevice.current.systemVersion,
                    "deviceName": UIDevice.current.name]
        return info.toJsonString() ?? ""
        
    }
    
    public static var appInfo:String {
        return ["appId": appId,
                "versionName": RKApp.shareInstance.versionName,
                "versionCode": RKApp.shareInstance.versionCode,
                "flavor": RKApp.shareInstance.flavor,
                "appKey": RKApp.shareInstance.appKey,
                "debug": RKApp.shareInstance.debug
            ].toJsonString() ?? ""
    }
}
