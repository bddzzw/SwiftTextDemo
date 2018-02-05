//
//  CartModel.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/25.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import Foundation

class CartModel: NSObject {
    var product_name = String()
    var product_number = String()
    var product_price = String()
    override init() {
        super.init()
    }
    func setModel(product_name:String ,product_number:String ,product_price:String){
        self.product_name = product_name
        self.product_number = product_number
        self.product_price = product_price
    }
}


