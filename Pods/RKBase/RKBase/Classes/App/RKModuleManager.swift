//
//  RKSDKManager.swift
//
//  用来实现统一 Module 初始化管理
//  Created by 金灵波 on 2019/5/5.
//

import Foundation

public class RKModuleManager {

    
    /// 添加指定的模块
    ///
    /// - Parameters:
    ///   - nameString: 如果有module字段 则直接写类名即可如："RKWebApp"，如果不包好模块则需要将模块名字前锥带上：如 RKWeb.RKWebApp
    ///   - module: SDK 模块 ,如：RKBase、RKWebApp 等
    public  static func addModule(className nameString:String,module:String = "") {
        let modulueFullName = module.isEmpty ? nameString : (module + "." + nameString)
        guard let rkModule =  NSClassFromString(modulueFullName) as? RKModuleProtocol.Type else {
            return
        }
        rkModule.setup()
    }
    
    
    /// 动态多个模块添加
    ///
    /// - Parameter fullNames:包括当前SDK名字，如：RKBase.RKMyDemoClass
    public static func addModules(classFullNames fullNames:String...){
        for module in fullNames where NSClassFromString(module) is RKModuleProtocol.Type {
            let classType =  NSClassFromString(module) as! RKModuleProtocol.Type
            classType.setup()
        }
    }
    
    //3、字典形式传递
    
}
