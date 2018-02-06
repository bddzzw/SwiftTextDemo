//
//  Macro.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/26.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON

// 屏幕的物理宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
// 屏幕的物理高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//tabbar高度
let iphoneTabbarHeight:CGFloat = 49.00
//状态栏高度
let iphonesTatuesHeight:CGFloat = 20.00
//navagetion高度
let iphoneNavigationHeight:CGFloat = 44.00
//加状态栏的导航栏
let iphoneNavAllHtight:CGFloat = 64.00





// RGBA的颜色设置
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
/**
 * 计算字符串长度
 */
func sizeWithText(text: String, font: UIFont, size: CGSize) -> CGRect {
    let attributes = [NSAttributedStringKey.font: font]
    let option = NSStringDrawingOptions.usesLineFragmentOrigin
    let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
    return rect;
}

