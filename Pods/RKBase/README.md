# RKBase

[![CI Status](https://img.shields.io/travis/金灵波/RKBase.svg?style=flat)](https://travis-ci.org/金灵波/RKBase)
[![Version](https://img.shields.io/cocoapods/v/RKBase.svg?style=flat)](https://cocoapods.org/pods/RKBase)
[![License](https://img.shields.io/cocoapods/l/RKBase.svg?style=flat)](https://cocoapods.org/pods/RKBase)
[![Platform](https://img.shields.io/cocoapods/p/RKBase.svg?style=flat)](https://cocoapods.org/pods/RKBase)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

``` ruby
 s.dependency  'SDWebImage'
```


## Installation

RKBase is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RKBase'
```

## Author

金灵波, lingbo.jin@rokid.com

## License

RKBase is available under the MIT license. See the LICENSE file for more info.



## 1 RKApp 相关信息使用


### 1.1） 用户相关全局信息


``` swift
//用户模块登录完成之后，下沉注册模型
RKApp.login(userId:"136***089",token:"abdfe123***xdafad")
//退出登录
RKApp.loginOut()
//判定用户是否登录
let islogin = RKApp.isLogin
//获取userId 和token
let userId = RKApp.userId
let userToken = RKApp.userToken
```


### 1.2） 当前Rokid 智能设备信息设置和获取

``` swift 
//设置当前选中设备
//已经移除到mobilecore 之中

```

### 1.3） 当前iPhone相关的设备信息


``` swift 
// appName
RKApp.appName

//appId
RKApp.appId

//appVersion
RKApp.appVersion

//appVersionName
RKApp.appVersionName

// 网络请求userAgent 设置
 RKApp.userAgent    // Rokid(/1.0/iPhone/iOS/12.1)

//webUI webUserAgent 设置
RKApp.webUserAgent

//环境变量信息
RKApp.Env


```

## 2 RKApp 密钥 设置

设置appkey 和 appSecret


``` swift

RKApp.shareInstance.appKey  //get,set
RKApp.shareInstance.appSecret //get ,set
RKApp.shareInstance.accessKey  //get ,set


```

## 3 IconFont 使用
IconFont 是采用阿里iconfont 集成，用来展示统一图标

``` swift

 let label = UILabel()
 label.text = RKIconFont.clear  // RKIconFont.clear 值为 "\u{e621}"
 label.font = RKIconFont.font(size: size)
 label.textColor = UIColor.hexColor(0x9A9A9A)
 label.sizeToFit()

```


## 4 SecurityUtil 使用
 字典加密


``` swift
let signString = SecurityUtil.sign(params: ["key1":"values","key2":"value2"], secret: "secret")

```

## 5 Foundation 各种常用扩展使用

### 5.1 String

| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
| String  | md5     |  "123".md5 |  md5加密|
| String  | trim()     |  "123".trim() | 去除 空白|
| String  | subString(from:Int) |  "123".subString(from:1) (结果为：23) | 截取 from 位置后的所有字符，from 超过字符串长度，返回空字符 ""|
| String  | subString(to:Int)     |  "123".subString(to:1)(结果为1) | 从起始位置开始截取到 to 位置的所有字符，to 超过字符串长度，返回整个字符串|
| String  | localize     |  "我的".localize | 本地化 中英文切换|
| String  | matchPattern(patter:)     |  "13656660222".matchPattern(pattern: 正则表达式) |正则规则判定 |
| String  | isChinaPhone()     |  "123".isChinaPhone() | 是否是中国手机号|
| String  | isAmericaPhone()     |  "123".isAmericaPhone() | 是否是美国手机号|
| String  | checkPasswordRull()     | "123".checkPasswordRull() | 目前密码规则为：密码强度设置8位及以上，同时包含大/小写英文字符、数字字符与符号其中的2种。具体需求见附件prd。（保持当前符号规则不变，即手机端输入法键盘中支持输入的字符） |
| String  | isAmericaPhone()     |  "123".isAmericaPhone() | 是否是美国手机号|
| String  | isURL()     |  "123".isURL() | url判定|
| String  | compare(version:)     |  "0.1.1".compare(version:"2.0.0") |  版本号判定|
| String  | multiLineSize(with:fontSize:)     |  "123".multiLineSize(with: RKStyles.Layout.screenWidth-60-49-24*2, fontSize: 14) | 计算多行字符串的size|



### 5.2 Data
| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
| Data    | GZip     |    |  压缩|
| Data    | GUnZip     |    |  解压缩|
| Data    | md5     |    |  md5值获取|

### 5.3 Codable

| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
| Encodable    | toJsonString()     |    |   实现encodable的模型对象可以转成jsonString|
| Encodable    | toDictionary()     |    |  实现encodable模型对象转字典|
| Encodable    | toJsonData()     |    |  实现encodable模型对象转Data|
| Decodable    | decodeFrom(jsonData:, ignoreErrorLog:)     |    | 从jsonData中还原模型|
| Decodable    | decodeFrom(jsonString:）     |    | 从jsonString中还原模型|

### 5.4 Array
| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
|   Array  |    toJsonString()   |   ["1","2"].toJsonString() | 转jsonsting  |
|   Array  |    toJsonData()   |   ["1","2"].toJsonData() | 转toJsonData  |

### 5.5 Dictionary
| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
|   Dictionary  |    toJsonString()   |   ["1":"2"].toJsonString() | 转jsonsting  |
|   Dictionary  |    toJsonData()   |   ["1":"2"].toJsonData() | 转toJsonData  |
|   Dictionary  |    rk_StringValue()   |  ["dic":["doubleKey": 3.0]].rk_StringValue("dic.doubleKey") |  实现嵌套，直接获取string类型，已经自动处理float、Int、Double等基本格式|
|   Dictionary  |    rk_IntValue()   |  ["dic":["doubleKey": 3.0]].rk_IntValue("dic.doubleKey") |  实现嵌套，直接获取Int类型，已经自动处理float、Int、Double、String等基本格式|
|   Dictionary  |    rk_FloatValue()   |  ["dic":["doubleKey": 3.0]].rk_FloatValue("dic.doubleKey") |  实现嵌套，直接获取Float类型，已经自动处理float、Int、Double、String等基本格式|
|   Dictionary  |    rk_DoubleValue()   |  ["dic":["doubleKey": 3.0]].rk_DoubleValue("dic.doubleKey") |  实现嵌套，直接获取Double类型，已经自动处理float、Int、Double、String等基本格式|
|   Dictionary  |    rk_BoolValue()   |  ["dic":["bool": 1]].rk_BoolValue("dic.bool") |  实现嵌套，直接获取Bool类型，已经自动处理float、Int、Double、String等基本格式|
|   Dictionary  |    rk_ArrayValue()   |  ["array":["value1","value2"]].rk_ArrayValue("array") |  嵌套获取Array 数组|
|   Dictionary  |    rk_anyValue()   |    ["dic1":["dic2",["name":"rokid"]].rk_anyValue("dic1.dic2.name") |  跟据 keyPath获取任意类型值|




### 5.6 Optional

| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
|   Optional  |    let<U>(block:)   |   defaultIndex.let { index in if index < self.options!.count {self.optionsView.selectRow(at: index)}} |  快捷的unwrap 方法  |

### 5.6 URL
| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
|   URL  |    queryDictionary  |  url.queryDictionary |  将参数转字典获取 |


## 6 UI 各种扩展(Extension)

### 6.1 UIViewController
| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
|   UIViewController  |  class  rk_topViewController()  |  UIViewController.rk_topViewController() |  类方法获取顶层VC |
|   UIViewController  |  class  rk_topViewController(root:)  |  UIViewController.rk_topViewController(root:vc) |  类方法获取顶层VC |
|   UIViewController  |    rk_topViewController()  |  vc.rk_topViewController() |   实例方法获取顶层VC  |
|   UIViewController  |    alert(message:)  |  vc.alert(message:"确定离开吗？") |   模态框  |
|   UIViewController  |    alert(title:, message:,onOk:)  |  vc.alert(title:"测试",message:"确定离开吗？",onOK:{}) |  模态框  |
|   UIViewController  |   rk_push(viewController: ,animated:)      |    vc.rk_push(viewController:newVC)        | push |
|   UIViewController  |   rk_popToRoot(animated:)      |    vc.rk_popToRoot()        | popToRoot|
|   UIViewController  |   rk_pop(animated:)      |    vc.rk_pop()        | pop|
|   UIViewController  |   rk_popTo(viewController: ,animated:)      |    vc.rk_popTo(viewController:aTargetVC)        | 跳转到指定的VC |


### 6.2 UIView

| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
|  UIView    |     safeAreaInsetsOrZero    |         |     save适配    |
|  UIView    |     safeAreaInsetsOr20    |         |     save适配    |
|  UIView    |     safeAreaLayoutGuideOrNil    |         |     save适配    |
|  UIView    |     viewController    |    view.viewController     |     当前view 对应的ViewController    |
|  UIView    |     roundCorners(corners: ,radius:)    |    view.roundCorners(corners: [.topLeft, .topRight], radius: 12)     |     当前view 任意圆角设置    |
|  UIView    |     configSideRadius(corner_rect: UIRectCorner, widget_height: CGFloat)    |        self.importBtn.configSideRadius(corner_rect: .allCorners, widget_height: 42.0) |    应对用snpkit约束的控件进行圆角的设置用此api    |
| UIView     |   showBlurEffectWithUIVibrancyEffect()  |   | 图层玻璃毛边效果设置  |
| UIView     |   setHorizontalGradientBackground(rightColor:UIColor, leftColor:UIColor, rect: CGRect)  |  self.maskView.setHorizontalGradientBackground(rightColor: UIColor.white,leftColor: UIColor.white,rect: CGRect.init(x: 0, y: 0, width: 10, height: 41) )  | 水平渐变效果  |
| UIView |setGradientBackground(topLeftColor:UIColor, rightBottomColor:UIColor)  | |  左上角到右下角渐变效果|

### 6.3 UIColor 
 
| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
| UIColor | init(hexValue:Int,alpha:CGFloat) | UIColor(hexValue:0x333333,alpha:1.0) | 十六进制颜色获取 |
| UIColor | init(hexValue:Int) | UIColor(hexValue:0x333333) | 十六进制颜色获取 |
| UIColor | init(hexString:Int) | UIColor(hexString:"333333") | 十六进制颜色获取 |

### 6.4 UIDevice


| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
| UIDevice| modelName |  device.modelName| 获取系统modelName 如:iPhone X (GSM)|
| UIDevice| isIphone6Plus() |  device.isIphone6Plus()| iphone6 手机判定|
| UIDevice| isIphone5() |  device.isIphone5()| iphone5 手机判定|
| UIDevice| isIphoneX() |  device.isIphoneX()| iphoneX 手机判定|

### 6.5 UIImage

| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
| UIImge | rk_image(imageName:String,bundle:(anyClass:AnyClass?,bundleName:String?)?) |UIImage.rk_image(imageName: "search_icon", bundle: (anyClass: RKApp.self, bundleName: "RKBase")  |  framework 内部使用图片资源获取|
| UIImage| imageWithTintColor(_ tintColor: UIColor, blendMode: CGBlendMode = .destinationIn) -> UIImage?| image.imageWithTintColor(UIColor.hexColor(0xB3B3BB)) |根据颜色生成图片|
| UIImge |resize(to size: CGSize) -> UIImage| image.resize(to:CGSize(width:20,height:20) |重新缩放图片，如果size.width==0会根据height等比缩放|


### 6.6  UIImageView

| Type    | 方法     |  案例   |   备注    |
|---------|---------|---------|---------|
| UIImageView |setWebImage(with urlString: String,size: CGSize = CGSize.zero,placeholder: UIImage? = nil,animated: Bool = true,completion: ((Bool) -> Void)? = nil) | | 设置网络加载图|







 

 





