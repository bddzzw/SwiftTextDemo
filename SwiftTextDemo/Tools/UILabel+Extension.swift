//
//  UILabel+Extension.swift
//  SwiftAllUIDemo
//
//  Created by 新中冠 on 2018/1/31.
//  Copyright © 2018年 新中冠. All rights reserved.
//

import UIKit

extension UILabel {

    func initWidthCreateLabel(text:String,fonSize:CGFloat,color:UIColor,frame:CGRect) -> UILabel {
        let lbl = UILabel(frame: frame)
        
        lbl.text=text
        
        lbl.font = UIFont.systemFont(ofSize: fonSize)
        
        lbl.numberOfLines = 0
        
        return lbl
    }

}
