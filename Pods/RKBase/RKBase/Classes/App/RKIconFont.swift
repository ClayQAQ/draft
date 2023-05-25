//
//  RKIconFont.swift
//  rokid
//
//  Created by 朝辉贾 on 12/06/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation

public class RKIconFont {
    
    public static var fontName = "iconfont"
    public static func registerFont(with url: URL) {
        guard let dp = CGDataProvider(url: url as CFURL) else {
            assert(false)
            return
        }
        let font = CGFont(dp)
        CTFontManagerRegisterGraphicsFont(font!, nil)
    }
    
    public static func font(size: CGFloat) -> UIFont {
        var font = UIFont(name: self.fontName, size: size)
        if font == nil {
            guard let url = Bundle.main.url(forResource: self.fontName, withExtension: "ttf") else {
                return UIFont.systemFont(ofSize:size)
            }
            self.registerFont(with: url)
            font = UIFont(name: self.fontName, size: size)
        }
        return font!
    }
    
}



public extension RKIconFont {
    static let rerecord = "\u{e664}"
    static let mini_play = "\u{e663}"
    static let offline = "\u{e637}"
    static let question = "\u{e60b}"
    static let singer = "\u{e62a}"
    static let uparrow = "\u{e629}"
    static let mic = "\u{e628}"
    static let refresh = "\u{e606}"
    static let status = "\u{e611}"
    static let search = "\u{e627}"
    static let settings = "\u{e626}"
    static let mute = "\u{e625}"
    static let fill = "\u{e624}"
    static let move = "\u{e623}"
    static let del = "\u{e622}"
    static let clear = "\u{e621}"
    static let selected = "\u{e633}"
    static let next = "\u{e61a}"
    static let more = "\u{e635}"
    static let close = "\u{e619}"
    static let alienDemoClose = "\u{e649}"
    static let back = "\u{e618}"
    static let menu = "\u{e617}"
    static let add = "\u{e616}"
    static let `switch` = "\u{e620}"
    static let downarrow = "\u{e615}"
    static let ask = "\u{e610}"
    static let arrow = "\u{e602}"
    static let backquote = "\u{e64c}"
    static let closequote = "\u{e64b}"
    static let eye = "\u{e608}"
    static let untick = "\u{e62f}"
    static let tick = "\u{e62e}"
    static let link = "\u{e630}"
    static let downtriangle = "\u{e613}"
    static let uptriangle  = "\u{e614}"
    static let play2 = "\u{e639}"
    static let wave = "\u{e641}"
    static let deviceSelected = "\u{e633}"
    static let device_switch = "\u{e659}"
    static let navRightAdd = "\u{e648}"
    static let editMore = "\u{e640}"
    static let showPassword = "\u{e646}"
    static let hiddenPassword = "\u{e63f}"
    static let wifiSignal = "\u{e63b}"

    static let modifyVoice = "\u{e64a}"

    /// 播放器
    static let play = "\u{e64f}"
    static let play_prev = "\u{e652}"
    static let play_next = "\u{e650}"
    static let pause = "\u{e658}"
    static let like = "\u{e64e}"
    static let linking = "\u{e651}"
    static let dislike = "\u{e64d}"
    static let mini_player_default = "\u{e65a}"
    static let backward_15 = "\u{e656}"
    static let forward_15 = "\u{e657}"
    static let loop = "\u{e655}"
    // magic nav
    static let magic_nav_search = "\u{e65c}"
    
    // Media detail
    static let playStatus = "\u{e666}"
    
    static let menuButtonUp = "\u{e66d}"
    static let menuButtonDown = "\u{e66c}"
    static let iotConfigColor = "\u{e670}"
}
