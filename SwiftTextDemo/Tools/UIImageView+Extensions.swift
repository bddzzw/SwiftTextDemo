//
//  UIImageView+Extensions.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/29.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit
extension UIImageView {
    
    
    class func creatImageViewWith(frame:CGRect,imageName:String,userIn:Bool=false) -> UIImageView {
        
        //创建按钮
        let imgV = UIImageView(frame: frame)
        
        imgV.isUserInteractionEnabled = userIn
        
        imgV.image = UIImage(named: imageName)
        
       
        return imgV
        
        
    }
    
}
