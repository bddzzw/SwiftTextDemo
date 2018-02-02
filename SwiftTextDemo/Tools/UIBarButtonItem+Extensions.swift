//
//  UIBarButtonItem+Extensions.swift
//  Swift小项目
//
//  Created by bddzzw on 2017/10/27.
//  Copyright © 2017年 bddzzw. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
//     let btn = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.gray, highlightedColor: UIColor.orange)
    convenience init(title:String,fontSize:CGFloat,target:AnyObject?,action:Selector,isBack:Bool=false) {
        
        let btn = UIButton.creatButtonWith(title: title, fontSize: fontSize, normalColor: UIColor.gray, highlightedColor: UIColor.orange)
    
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 30);
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            btn.setImage(UIImage(named:imageName), for: .normal)
            btn.setImage(UIImage(named:imageName+"_highlighted"), for: .highlighted)
//            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView:btn)
    }
}
