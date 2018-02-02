//
//  CartRecommendCell.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/26.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class CartRecommendCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    private lazy var  MyCollectionView = UICollectionView()
    
    
    typealias cartIDBlock = (Int)->()
    var returnCartID : cartIDBlock?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let  layout = UICollectionViewFlowLayout()
        
        MyCollectionView = UICollectionView.init(frame:CGRect(x: 0, y: 0, width: SCREEN_WIDTH , height: (SCREEN_WIDTH/2-4)/73*100 * 4 + 20), collectionViewLayout: layout)
        
        //加载xib的方法
        MyCollectionView.register(UINib(nibName: "CustomCollViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollViewCell")
        
        MyCollectionView.delegate=self
        
        MyCollectionView.dataSource=self
        
        MyCollectionView.backgroundColor=RGBA(r: 237, g: 237, b: 237, a: 1)
        
        //        layout.itemSize = CGSize(width: self.view.frame.width/2, height: (self.view.frame.width/2-4)/73*100)
        
        self.addSubview(MyCollectionView)
        
        
        MyCollectionView.reloadData()
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: self.frame.width, height: 0.01)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var myCell = UICollectionViewCell()
        
        let  cell = collectionView .dequeueReusableCell(withReuseIdentifier: "CustomCollViewCell", for: indexPath) as! CustomCollViewCell
            
        cell.CustomName.text="产品产品产品产品\(indexPath.row)"
            
        myCell = cell
       
        return myCell;
    }
    @objc func banarBlock(num:Int) -> Void {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width/2-2, height: (self.frame.width/2-4)/73*100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2;
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        returnCartID!(indexPath.row + 12306)
        
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
