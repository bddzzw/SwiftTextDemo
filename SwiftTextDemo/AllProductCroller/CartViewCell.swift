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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
