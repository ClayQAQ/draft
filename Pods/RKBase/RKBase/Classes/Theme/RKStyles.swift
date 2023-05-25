//
//  RKStyles.swift
//  rokid
//
//  Created by lamo on 2017/5/4.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation
public struct RKStyles {

    public struct Layout {

        public static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
        public static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
        
        public static let scale = screenWidth / 375.0

        public static let statusBarHeight: CGFloat = 20
        public static let navBarHeight: CGFloat = 44
        public static let tabBarHeight: CGFloat = 49
        public static let margin: CGFloat = 20
        public static let singleInputTopMargin: CGFloat = 25
        public static let highToolbarHeight: CGFloat = 60
        public static let lineHeight: CGFloat = 1.0/UIScreen.main.scale
        public static let cornerRadius: CGFloat = 6
        public static let iPhoneXTopAreaHeight: CGFloat = 44
        public static let iPhoneXBottomAreaHeight: CGFloat = 34

        public static let tableViewSectionTopMargin: CGFloat = 25
        public static let tableViewSectionBottomMargin: CGFloat = 30
        public static let tableViewCellVerticalMargin: CGFloat = 5
        public static let tableViewHeaderHeight: CGFloat = 39
        public static let lightCircleMenuHorizentalMargin: CGFloat = 15
        public static let darkButtonCellHeight: CGFloat = 58

        public static let inputHeight: CGFloat = 50
        public static let inputHeaderTopMargin: CGFloat = 20
        public static let inputHeaderBottomMargin: CGFloat = 13
        public static let inputTipTopMargin: CGFloat = 16
        public static let inputAssistantTopMargin: CGFloat = 10

        public static let tagViewHeight: CGFloat = 36
        public static let tagViewPaddingX: CGFloat = 9
        public static let tagViewPrioPaddingX: CGFloat = 35

        public static let primaryButtonHeight: CGFloat = 48

        public static let navItemHeight: CGFloat = 30
        public static let navIconFontItemWidth: CGFloat = 30
        public static let navRightItemPaddingX: CGFloat = 3

        public static let cardMargin: CGFloat = {
            let screenWidth = UIScreen.main.bounds.width
            if screenWidth > 321 {
                return 30
            } else {
                return 20
            }
        }()
        public static let cardBottomMargin: CGFloat = {
            let screenWidth = UIScreen.main.bounds.width
            if screenWidth > 321 {
                return 20
            } else {
                return 10
            }
        }()
        public static let cardSpace: CGFloat = 13
        public static let cardListInsets = UIEdgeInsets(top: 15, left: 13, bottom: 13, right: 13)

        public static let deviceContentTopMargin: CGFloat = 46
        public static let deviceContentBottomMargin: CGFloat = 35

        public static let hudHorizontalMargin: CGFloat = 21
        public static let hudHeight: CGFloat = 50
        
        //切换菜单栏view的底部横线的高度
        public static let rks_bottomLbl_height:CGFloat = 3.0

    }

    
    

    public static func initApperance() {
        UITextField.appearance().tintColor = Color.themeColor
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: RKStyles.Color.darkPrimaryText], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Color.themeColor], for: .selected)
        UINavigationBar.appearance().isTranslucent = false
        UITableView.appearance().separatorColor = .clear
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
                                                             NSAttributedString.Key.foregroundColor: RKStyles.Color.navigationItem],
                                                            for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)],
                                                            for: .highlighted)
        UISearchBar.appearance().setImage(UIImage.rk_image(imageName: "search_icon", bundle: (anyClass: RKApp.self, bundleName: "RKBase")), for: .search, state: .normal)
    }
}
extension RKStyles {
    public struct Color {
        /// 4.8.0
        public static let customMaskViewBgColor = UIColor.hexColor(0x000000, alpha: 0.3)
        
        /// 4.0
        public static let magicNavButtonHighlightColor = UIColor.lightGray
        public static let magicNavButtonDarkColor = UIColor.hexColor(0x555556)
        public static let magicNavButtonLightColor = UIColor.white
        
        ///3.2.0之后的规范
        public static let navigationItem = UIColor.hexColor(0x5B5B5B)
        public static let navigationBackItem = UIColor.hexColor(0x555556)
        
        ///3.0规范
        public static let themeColor = UIColor.hexColor(0x408CFF)
        public static let lightBackground = UIColor.white
        public static let commGrayBackground =  UIColor.hexColor(0xf7f7f7)
        
        public static let darkPopoverMask = UIColor(white: 0.0, alpha: 0.6)
        
        public static let blackLine = UIColor(white: 0, alpha: 0.1)
        public static let grayLine = UIColor.hexColor(0xDFE1E4)
        public static let lightGrayLine = UIColor.hexColor(0x323233)
        public static let whiteLine = UIColor(white: 1, alpha: 0.2)
        public static let lightWhiteLine = UIColor(white: 1, alpha: 0.05)
        public static let lightBarLine = UIColor(white: 1, alpha: 0.15)
        public static let darkBarLine = UIColor(white: 0, alpha: 0.1)
        
        public static let darkTouchableText = UIColor(white: 0.0, alpha: 0.3)
        public static let offlineBgColor = UIColor(white: 0.0,  alpha: 0.2)
        public static let offlinelabelTextColor = UIColor(red: 44/255, green: 44/255, blue: 45/255, alpha: 1.0)
        public static let offilneOtherLabelTextColor = UIColor.hexColor(0x408CFF)
        
        public static let darkPrimaryText = UIColor.hexColor(0x323233)
        public static let grayPrimaryText = UIColor.hexColor(0x9A9A9A)
        
        public static let importMusicPlacehodlerText = UIColor(white: 0.0, alpha: 0.2)
        public static let importMusicTextViewbgColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        public static let leadMusicSuccessColor = UIColor.hexColor(0x408CFF, alpha: 0.2)
        public static let importSongFailColor = UIColor.hexColor(0xFF6060, alpha: 0.2)
        public static let darkPlaceholder = UIColor(white: 0.0, alpha: 0.3)
        
        public static let lightPrimaryText = UIColor.white
        
        public static let grayPlaceholder = UIColor.hexColor(0x9FA0A5)
        
        public static let offlineBackground = UIColor.hexColor(0xFFF6F4)
        public static let commomeRedText = UIColor.hexColor(0xF90210)
    }
}

extension RKStyles {
    public struct FontSize {
        ///3.2.0这之后的规范
        public static let navigationTitle: CGFloat = 18
        
        
        ///3.0规范
        public static let navIconFont: CGFloat = 14
        public static let nav: CGFloat = 15
        public static let normalIconFont: CGFloat = 14 // iconFont比默认字体稍粗，所以字号减1
        public static let iconFontInPrimaryButton: CGFloat = 11
        
        public static let normal: CGFloat = 15
        public static let minor: CGFloat = 13
        public static let little: CGFloat = 12
        
        public static let deviceBigTitle: CGFloat = 22
    }
}
