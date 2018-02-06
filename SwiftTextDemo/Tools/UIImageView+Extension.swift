//
//  UIImageView+Extension.swift
//  SwiftAllUIDemo
//
//  Created by 新中冠 on 2018/1/31.
//  Copyright © 2018年 新中冠. All rights reserved.
//


import UIKit

extension UIImageView {
    
    func initWidthCreateImageView(imageName:String,frame:CGRect) -> UIImageView {
        
        let imageN = UIImage(named: imageName)
        
        let imageV = UIImageView(frame: frame)
        
        imageV.image=imageN
        
        
        return imageV
    }
    
}
