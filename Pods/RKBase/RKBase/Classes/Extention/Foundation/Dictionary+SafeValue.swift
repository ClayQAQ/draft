//
//  Dictionary+SaveValue.swift
//  FBSnapshotTestCase
//
//  Created by 金灵波 on 2019/5/10.
//

import Foundation

public extension Dictionary{
    
    ///
    ///   1、自动将 float、Double、Int、Bool 转化为String 格式
    ///   2、通过keyPath 获取指定的字符串信息
    ///   3、可以设默认值
    /// - Parameters:
    ///   - keyPath:  访问路径，比如如果字典且套，可以通过 key1.key2.key3 形式进行获取值
    ///   - defaultValue: 可以填写默认值
    /// - Returns: String
    func rk_StringValue(keyPath:String,defaultValue:String = "") -> String {
        return rk_value(keyPath: keyPath,defaultValue: defaultValue,  convert: { (any) in
            String.rk_String(anyValue: any)
        }) ?? defaultValue
    }
    
    ///
    ///   1、自动将 float、Double、Int、Bool 转化为Int 格式
    ///   2、通过keyPath 获取指定的Int串信息
    ///   3、可以设默认值
    /// - Parameters:
    ///   - keyPath:  访问路径，比如如果字典且套，可以通过 key1.key2.key3 形式进行获取值
    ///   - defaultValue: 可以填写默认值
    /// - Returns: Int
    func rk_IntValue(keyPath:String,defaultValue:Int = 0) -> Int {
        return rk_value(keyPath: keyPath,defaultValue: defaultValue,  convert: { (any) in
            Int.rk_Int(anyValue: any)
        }) ?? defaultValue
    }
    
    ///
    ///   1、自动将 float、Double、Int、Bool 转化为Float 格式
    ///   2、通过keyPath 获取指定的Float信息
    ///   3、可以设默认值
    /// - Parameters:
    ///   - keyPath:  访问路径，比如如果字典且套，可以通过 key1.key2.key3 形式进行获取值
    ///   - defaultValue: 可以填写默认值
    /// - Returns: Float
    func rk_FloatValue(keyPath:String,defaultValue:Float = 0.0) -> Float {
        return rk_value(keyPath: keyPath,defaultValue: defaultValue,  convert: { (any) in
            Float.rk_Float(anyValue: any)
        }) ?? defaultValue
    }
    
    ///
    ///   1、自动将 float、Double、Int、Bool 转化为Double 格式
    ///   2、通过keyPath 获取指定的Double信息
    ///   3、可以设默认值
    /// - Parameters:
    ///   - keyPath:  访问路径，比如如果字典且套，可以通过 key1.key2.key3 形式进行获取值
    ///   - defaultValue: 可以填写默认值
    /// - Returns: Double
    func rk_DoubleValue(keyPath:String,defaultValue:Double = 0.0) -> Double {
        return rk_value(keyPath: keyPath,defaultValue: defaultValue,  convert: { (any) in
            Double.rk_Double(anyValue: any)
        }) ?? defaultValue
    }
    
    ///
    ///   1、自动将 float、Double、Int、Bool 转化为Bool 格式
    ///   2、通过keyPath 获取指定的Bool信息
    ///   3、可以设默认值
    /// - Parameters:
    ///   - keyPath:  访问路径，比如如果字典且套，可以通过 key1.key2.key3 形式进行获取值
    ///   - defaultValue: 可以填写默认值
    /// - Returns: Bool
    func rk_BoolValue(keyPath:String,defaultValue:Bool = false) -> Bool {
        return rk_value(keyPath: keyPath,defaultValue: defaultValue,  convert: { (any) in
            Bool.rk_Bool(anyValue: any)
        }) ?? defaultValue
    }
    
    ///   1、通过keyPath 获取指定的Array信息
    ///   2、可以设默认值
    /// - Parameters:
    ///   - keyPath:  访问路径，比如如果字典且套，可以通过 key1.key2.key3 形式进行获取值
    ///   - defaultValue: 可以填写默认值
    /// - Returns: Array
    func rk_ArrayValue(keyPath:String,defaultValue:[Any] = []) -> [Any] {
        return rk_value(keyPath: keyPath,defaultValue: defaultValue,  convert: { (any) in
            any as? [Any]
        }) ?? defaultValue
    }
    
    ///   1、通过keyPath 获取指定的Any信息
    ///   2、可以设默认值
    /// - Parameters:
    ///   - keyPath:  访问路径，比如如果字典且套，可以通过 key1.key2.key3 形式进行获取值
    ///   - defaultValue: 可以填写默认值
    /// - Returns: Array
    func rk_anyValue(keyPath:String,defaultValue :Any? = nil) -> Any? {
        return rk_value(keyPath: keyPath,defaultValue: defaultValue)
    }
    
    private func  rk_value<T>(keyPath:String,defaultValue :T? = nil, convert:((Any)->T?)? = nil) -> T?{
        for (key,value) in self {
            guard let strKey = key as? String else  {
                continue
            }
            if strKey == keyPath {
                return convert?(value) ?? (value as? T)
            }
            if  keyPath.count >= strKey.count , keyPath.hasPrefix(strKey) ,let dicValue = value as? [String:Any]     {
                let startIndex = keyPath.index(keyPath.startIndex, offsetBy: strKey.count + 1) //必定有一个. 符号，因此需要添加一个字符
                let nextKeyPath = keyPath[startIndex...]
                let nextPath = String(nextKeyPath)
                return dicValue.rk_value(keyPath: nextPath ,convert:convert)
            }
        }
        return defaultValue
    }
}
