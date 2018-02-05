//
//  AllProductViewController.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/23.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class AllProductViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var MyTableView = UITableView()
    
    private lazy var sectionView = UIView()
    
    private lazy var headerTitleLabel = UILabel()
    
    private lazy var  productArray = [AnyObject]()
    
    private lazy var recommendArray = [AnyObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        createMyTableV()
        
        // Do any additional setup after loading the view.
    }
    /*  guard let path  = Bundle.main.path(forResource: "test.json", ofType: nil),
     let data  = NSData(contentsOfFile: path),
     let array  = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [[String:String]]
     else {
     return
     }*/
    func loadData() -> Void
    {
        guard let path = Bundle.main.path(forResource: "cartData.json", ofType: nil),
            let data = NSData(contentsOfFile: path),
            let dataDic = try? JSONSerialization.jsonObject(with:data as Data, options: []) as? [String:[[String:String]]]
            else{

            return
        }
        
        let productAry = (dataDic!["product"])!
        
        for (_,value) in productAry.enumerated() {
            
            let cartModel = CartModel()
            cartModel.setModel(product_name:value["product_name"]!,product_number:value["product_number"]!,product_price: value["product_price"]! )

            productArray.append(cartModel)
        }
        let recomAry = (dataDic!["product"])!
        
        for (_,value) in recomAry.enumerated() {
            
            let cartModel = CartModel()
            cartModel.setModel(product_name:value["product_name"]!,product_number:value["product_number"]!,product_price: value["product_price"]! )
            
            recommendArray.append(cartModel)
        }
       
    }
    func createSectionHeader(title:String) -> UIView {
        
        sectionView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40));
        sectionView.backgroundColor = RGBA(r: 244, g: 244, b: 244, a: 0.8)
        
        headerTitleLabel = UILabel(frame: CGRect(x: (SCREEN_WIDTH-100)/2, y: 5, width: 100, height: 30))
        
        headerTitleLabel.text = title
        
        headerTitleLabel.textColor = UIColor.darkGray
        
        headerTitleLabel.backgroundColor = UIColor.clear
        
        headerTitleLabel.textAlignment = .center
        
        sectionView.addSubview(headerTitleLabel)
    
        return sectionView
        
    }

    
    private func createMyTableV() -> Void {
        
        
        MyTableView = UITableView (frame: CGRect (x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        
        MyTableView.delegate = self
        MyTableView.dataSource = self
        
        MyTableView.register(UINib (nibName: "CartViewCell", bundle:nil), forCellReuseIdentifier: "CartViewCell")
        
        MyTableView.register(CartRecommendCell.self, forCellReuseIdentifier: "CartRecommendCell")
        
        self.view.addSubview(MyTableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return productArray.count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.section==0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "CartViewCell", for: indexPath) as? CartViewCell
            let model = productArray[indexPath.row] as! CartModel
            
            myCell?.CartNumLabel.text = String("X"+model.product_number)
            
            myCell?.CartNameLabel.text = model.product_name

            myCell?.CartPeiceLabel.text = String(model.product_price)
            
            cell = myCell!
        }else{
            let cellID = "CartRecommendCell"
            let myCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CartRecommendCell
            
            myCell?.recomArray = recommendArray
            
            myCell?.returnCartID = {(CartID) in
                
                let alert = UIAlertController(title:"温馨提示", message:"您点击产品id是\(CartID)", preferredStyle: .alert)
                let canselAct = UIAlertAction(title: "取消", style: .cancel) { (action:UIAlertAction)->Void in
                    print("取消")
                }
                let defautAct = UIAlertAction(title: "确定", style: .default) { (action:UIAlertAction)->Void in
                    print("确定")
                }
                alert .addAction(canselAct)
                alert.addAction(defautAct)
                self.present(alert, animated: true, completion: nil)
                
            }
        
            
            cell = myCell!
            
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 {
            return 110
        }else{
            
            return (SCREEN_WIDTH/2-4)/73*100 * 4 + 20
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1
        {
            return createSectionHeader(title: "为您推荐")
        }else{
            return nil
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.01
        }else{
            return  40
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return true
        }else{
            return false
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let ActionOne = UITableViewRowAction(style: .normal, title: "删除") { (action, index) in
            self.productArray.remove(at: indexPath.row)
            self.MyTableView.reloadData()
        }
        ActionOne.backgroundColor=UIColor.red
        
        let ActionTwo = UITableViewRowAction(style: .normal, title: "编辑") { (action, index) in
            print("编辑")
        }
        ActionTwo.backgroundColor=UIColor.orange
        
        return [ActionOne,ActionTwo]
    }

}
