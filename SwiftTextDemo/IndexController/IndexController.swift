//
//  IndexController.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/23.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class IndexController: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    private lazy var  MyCollectionView = UICollectionView()
    private lazy var  bannerScrol = AutoImageScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  layout = UICollectionViewFlowLayout()
        
        MyCollectionView = UICollectionView.init(frame:CGRect(x: 0, y: -20, width: SCREEN_WIDTH, height: SCREEN_HEIGHT+20), collectionViewLayout: layout)
        //加载xib的方法
        
        MyCollectionView.register(UINib(nibName: "CustomCollViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollViewCell")
         //存代码的方法
        
        MyCollectionView.register(BanerCollViewCell.self, forCellWithReuseIdentifier: "BanerCollViewCell")
        
        MyCollectionView.delegate=self
        
        MyCollectionView.dataSource=self
        
        MyCollectionView.backgroundColor = RGBA(r: 237, g: 237, b: 237, a: 1)
        
//        layout.itemSize = CGSize(width: self.view.frame.width/2, height: (self.view.frame.width/2-4)/73*100)
        
        self.view.addSubview(MyCollectionView)
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section==0 {
            return 1
        }
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section==1 {
            return CGSize(width: SCREEN_WIDTH, height: 10)
        }else{
            return CGSize(width: SCREEN_WIDTH, height: 0.01)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var myCell = UICollectionViewCell()
        
        if indexPath.section == 0 {
            let  cell = collectionView .dequeueReusableCell(withReuseIdentifier: "BanerCollViewCell", for: indexPath) as! BanerCollViewCell
            
            //这里是避免重复调用
            if bannerScrol.subviews.count < 1 {
    
                bannerScrol = bannerScrol.initWidthAutoImageScroll(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 200), imageAry: ["banar1","banar2","banar3"]) as! AutoImageScrollView
                
                bannerScrol.returnIndex = {(index) in
                    let alert = UIAlertController(title:"温馨提示", message:"第\(index)张", preferredStyle: .alert)
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
                
                cell.contentView.addSubview(bannerScrol)
            }
           
            
            myCell = cell
            
        }else{
            let  cell = collectionView .dequeueReusableCell(withReuseIdentifier: "CustomCollViewCell", for: indexPath) as! CustomCollViewCell
            
            cell.CustomName.text="产品产品产品产品\(indexPath.row)"
            
             myCell = cell
        }
      
        
        return myCell;
    }
    @objc func banarBlock(num:Int) -> Void {
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section==0 {
             return CGSize(width:SCREEN_WIDTH, height: 200)
        }
        return CGSize(width: self.view.frame.width/2-2, height: (self.view.frame.width/2-4)/73*100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2;
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section>0 {
            
          
            let alert = UIAlertController(title: "产品", message: "产品\(indexPath.section)组\(indexPath.row)行", preferredStyle: .alert)
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
     
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        self.navigationController?.navigationBar.alpha=scrollView.contentOffset.y/150;
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
