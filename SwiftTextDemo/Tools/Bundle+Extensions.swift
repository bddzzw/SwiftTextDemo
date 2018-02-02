//
//  Bundle+Extensions.swift
//  Swift小项目
//
//  Created by bddzzw on 2017/10/26.
//  Copyright © 2017年 bddzzw. All rights reserved.
//

import Foundation

// MARK: - 用反射加载类
extension Bundle{
    //计算型的类型类似于函数 但是没有参数有返回值
    var namespace : String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
