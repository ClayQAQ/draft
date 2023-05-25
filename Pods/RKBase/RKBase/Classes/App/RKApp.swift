//
//  RKApp.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/2/25.
//

import Foundation



public class RKApp {
    public static let shareInstance = RKApp()
    internal var _userId  :String?
    internal var _userToken  :String?
    internal var _userName :String?
    internal var _rkDeviceID: String?
    internal var _rkDeviceType: String?
    
    public var debug: Bool = false
    public var flavor: String = "rokid"
    
    public let versionName: String = Bundle.main.rb_versionString ?? ""
    public let versionCode: String = Bundle.main.rb_buildCode ?? ""
    public let appId: String =  Bundle.main.rb_appId ?? ""
    
    public var appKey: String = ""
    public var appSecret: String = ""
    public var accessKey: String = ""
    
    /// 用户登录userID
    public static  var  userId : String? {
        get {
            return  RKApp.shareInstance._userId
        }
    }
    
    /// 用户登录userTokend
    public static   var  userToken : String? {
        return RKApp.shareInstance._userToken
    }
    
    public static var userName:String? {
        return RKApp.shareInstance._userName
    }
    
    
    /// 判定是否登录
    public static  var  isLogin :Bool {
        return userId != nil && userToken != nil
    }
    
    /// 全局设置登录信息
    ///
    /// - Parameters:
    ///   - userId: userID
    ///   - token: userToken
    public static   func login(userId:String ,token:String , userName:String?)  {
        RKApp.shareInstance._userId = userId
        RKApp.shareInstance._userToken  = token
        RKApp.shareInstance._userName = userName
    }
    
    /// 退出登录
    public static func  loginOut() {
        RKApp.shareInstance._userId = nil
        RKApp.shareInstance._userToken = nil
        RKApp.shareInstance._userName = nil
    }
}
