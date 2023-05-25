//
//  RKSDKProtocol.swift
//  模块初始化协议，可以动态使用
//
//  Created by 金灵波 on 2019/5/5.
//

import Foundation

public protocol RKModuleProtocol : class{
   
   /// 默认初始化入口
   static func setup()
}
