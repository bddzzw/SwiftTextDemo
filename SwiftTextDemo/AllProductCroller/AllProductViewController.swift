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
    
    private var allPrice = String()
    
    private let BottomHeight:CGFloat = 40.00
    
    private var allPriceLabel = UILabel()
    
    private let allPriceShowLabel = UILabel()
    
    private var CartSize = CGRect()
        
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        countCartAllPrice()
        createMyTableV()
        
        self.navigationItem.rightBarButtonItem = createRightItemBtn()
        
        // Do any additional setup after loading the view.
    }
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
    func createRightItemBtn()->UIBarButtonItem{
        
        let rightItem = UIBarButtonItem()
        
        let rightBtn = UIButton.creatButtonWith(title: "编辑", fontSize: 15, normalColor: UIColor.black, highlightedColor: UIColor.orange)
        rightBtn .setTitle("完成", for: .selected)
        
        rightBtn.addTarget(self, action:#selector(self.cartRightBtnClick(btn:)), for: .touchUpInside)
        
        rightItem.customView = rightBtn
        
        return rightItem
    }
    @objc func cartRightBtnClick(btn:UIButton) -> Void {
        btn.isSelected = !btn.isSelected
        
        if btn.isSelected {
            
            for value in productArray {
                let model = value as? CartModel
                model?.product_isYES = true
                
            }
        }else{
            for value in productArray {
                
                let model = value as? CartModel
                
                 model?.product_isYES = false
            }
        }
        
        countCartAllPrice()
        
        MyTableView.reloadData()
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
        
        
        MyTableView = UITableView (frame: CGRect (x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - BottomHeight - iphoneTabbarHeight ), style: .plain)
        
        MyTableView.delegate = self
        MyTableView.dataSource = self
        
        MyTableView.register(UINib (nibName: "CartViewCell", bundle:nil), forCellReuseIdentifier: "CartViewCell")
        
        MyTableView.register(CartRecommendCell.self, forCellReuseIdentifier: "CartRecommendCell")
        
        self.view.addSubview(MyTableView)
        self.view.addSubview(createCartBottomView())
        
    }
    func createCartBottomView() -> UIView {
        let bottonView = UIView()
    
        bottonView.frame = CGRect(x: 0, y: SCREEN_HEIGHT - BottomHeight - iphoneTabbarHeight, width: SCREEN_WIDTH, height: BottomHeight)
        
        let leftSelectBtn = UIButton.creatButtonWith(title:String("    "+"全部"), fontSize: 15, normalColor: UIColor.black, highlightedColor: UIColor.orange)
        
        leftSelectBtn.frame = CGRect(x: 10, y: 5, width: 80, height: 30)
        
        leftSelectBtn.setImage(UIImage(named: "ico_chose_o"), for: .normal)
        
        leftSelectBtn.setImage(UIImage(named: "ico_chose"), for: .selected)
        
        
        leftSelectBtn.setTitle(String("    "+"取消"), for: .selected)
        
        leftSelectBtn.addTarget(self, action: #selector(self.cartAllSelectBtnClick(_:)), for: .touchUpInside)
        
        bottonView.addSubview(leftSelectBtn)
        
       
        
        allPriceLabel.frame = CGRect(x: SCREEN_WIDTH - CartSize.width - 25, y: 3, width: CartSize.width + 18, height: 34)
        
        allPriceLabel.text = String("￥" + allPrice)
        
        allPriceLabel.font = UIFont.systemFont(ofSize: 15)
        
        bottonView.addSubview(allPriceLabel)
        
       
        
        allPriceShowLabel.frame = CGRect(x: SCREEN_WIDTH - CartSize.width - 25 - 40, y: 3, width: 40, height: 34)
        
        allPriceShowLabel.textAlignment = .right
        
        allPriceShowLabel.text = "总价:"
        
        allPriceShowLabel.font = UIFont.systemFont(ofSize: 15)
        
        bottonView.addSubview(allPriceShowLabel)
        
        return bottonView
    }
    
    @objc func cartAllSelectBtnClick(_ btn:UIButton) -> Void {
        
        if btn.isSelected {
            for value in productArray {
                let model = value as? CartModel
                model?.product_select = true
                
            }
        }else{
            for value in productArray {
                
                let model = value as? CartModel
                
                model?.product_select = false
            }
        }
        
        btn.isSelected = !btn.isSelected
        
        countCartAllPrice()
        
        MyTableView.reloadData()
    }
    //MARK:计算所有价格
    func countCartAllPrice() -> Void {
       
        allPrice = ""
        for value in productArray {
            let model = value as? CartModel
            if (model?.product_select)! {
                
                if allPrice != ""  {
                    allPrice = String(format:"%0.2f",Float(allPrice)! + Float(model!.product_number)! * Float(model!.product_price)!)
                }else{
                    allPrice = String(format:"%0.2f",Float(model!.product_number)! * Float(model!.product_price)!)
                }
                
            }
        }
    
        
        if allPrice == "" {
            allPrice = String("￥0")
        }else{
           allPrice = String("￥" + allPrice)
        }
        
        
       CartSize =  sizeWithText(text: allPrice as String, font: UIFont.systemFont(ofSize: 16), size:CGSize(width: CGFloat(MAXFLOAT), height: 30))
        
        allPriceLabel.text = allPrice
        
        allPriceLabel.frame = CGRect(x: SCREEN_WIDTH - CartSize.width - 25, y: 3, width: CartSize.width + 18, height: 34)
        
        allPriceShowLabel.frame = CGRect(x: SCREEN_WIDTH - CartSize.width - 25 - 40, y: 3, width: 40, height: 34)
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
            
            myCell?.CartNumberTextField.text = String(model.product_number)
            
            myCell?.CartNameLabel.text = model.product_name

            myCell?.CartPeiceLabel.text = String("￥" + model.product_price)
            
            if model.product_isYES {
                
                myCell?.CartAddBtn.isHidden = false
                myCell?.CartPlusBtn.isHidden = false
                myCell?.CartNumberTextField.isHidden = false
                
            }else{

                
                myCell?.CartAddBtn.isHidden = true
                myCell?.CartPlusBtn.isHidden = true
                myCell?.CartNumberTextField.isHidden = true
                
            }
            if model.product_select {
                myCell?.CartIsSelectBtn.isSelected = true
            }else{
                 myCell?.CartIsSelectBtn.isSelected = false
            }
            
            myCell?.returnCart = {(btn,status)in
                if status == "1" {
                    if Int(model.product_number)! > 1 {
                       model.product_number = String(Int(model.product_number)! - 1)
                    }else{
                        print("亲，不能再少了")
                    }
                  
                }else if status == "2"{
                    if Int(model.product_number)! < 10 {
                        model.product_number = String(Int(model.product_number)! + 1)
                    }else{
                        print("亲，不能再多了")
                    }
                }else{
                    model.product_select = !model.product_select
                }
                self.MyTableView.reloadData()
                self.countCartAllPrice()
            }
            
            
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
        
            cell.selectionStyle = .none
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
            
            let model = self.productArray[indexPath.row] as? CartModel
            
            model?.product_isYES = true
            
            
            
            self.MyTableView.reloadData()
            
            
        
        }
        ActionTwo.backgroundColor=UIColor.orange
        
        return [ActionOne,ActionTwo]
    }

}
