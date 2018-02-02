//
//  UIButton+Extensions.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/23.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

//UIButton的类方法扩展
extension UIButton {
    
    
    class func creatButtonWith(title : String, fontSize: CGFloat, normalColor:UIColor = UIColor.gray, highlightedColor:UIColor = UIColor.orange) -> UIButton {
        
        //创建按钮
        let  btn = UIButton.init(type: .custom)
    
        btn.setTitle(title, for: .normal)

        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        btn.setTitleColor(normalColor , for: .normal)
        
        btn.setTitleColor(highlightedColor, for: .highlighted)

        //按照背景图片初始化按钮尺寸
        btn.sizeToFit()
        
        //返回按钮
        return btn
        
        
    }
    
}
