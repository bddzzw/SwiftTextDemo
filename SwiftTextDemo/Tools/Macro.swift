//
//  Macro.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/26.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit
import Foundation


// 屏幕的物理宽度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
// 屏幕的物理高度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height


// RGBA的颜色设置
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
