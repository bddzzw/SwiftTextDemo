//
//  CartViewCell.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/25.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class CartViewCell: UITableViewCell {

    @IBOutlet weak var CartNumLabel: UILabel!
    
    @IBOutlet weak var CartNameLabel: UILabel!
    
    @IBOutlet weak var CartImageView: UIImageView!
    
    @IBOutlet weak var CartPeiceLabel: UILabel!
    
    @IBOutlet weak var CartPlusBtn: UIButton!
    
    @IBOutlet weak var CartNumberTextField: UITextField!
    
    @IBOutlet weak var CartIsSelectBtn: UIButton!
    
    @IBOutlet weak var CartAddBtn: UIButton!
    
    typealias cartBlock = (_ btn : UIButton,_ statue : String)->()
    var returnCart : cartBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cartBtnPlusClick(_ sender: UIButton) {
       
        returnCart!(sender,"1")
        
    }
    
    @IBAction func cartBtnAddClick(_ sender: UIButton) {
        
        returnCart!(sender,"2")
    }
   
    @IBAction func cartIsSelectBtnClick(_ sender: UIButton) {
         returnCart!(sender,"3")
    }
}
