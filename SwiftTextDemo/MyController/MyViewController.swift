//
//  MyViewController.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/23.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class MyViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
   
    private var  mHeaderHeight = 240
    
    private var  headerImV = UIImageView()
    
    private  let baseUIArray = ["动画","贝塞尔","模糊层","加载web","分段栏","弹出视图"]
    
    private var myTableView = UITableView()
    
    private var myInitFrame = CGRect()
    
    
    private var allConsetY = CGFloat()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         self.navigationController?.navigationBar.isHidden = true
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.alpha = 1 ;
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        self.view.addSubview(createHeaderImageV())
        
        createCustomTable()
        
        self.navigationController?.navigationBar.isHidden = true
//
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createHeaderImageV() -> UIImageView {
        
        headerImV = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height:CGFloat(mHeaderHeight) ))
        
        headerImV.image = UIImage(named: "HeaderImage")
        
        myInitFrame = headerImV.frame
        
        return headerImV
    }
    
    func createCustomTable () -> Void {
       
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-44), style: .grouped)
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(self.myTableView)
        
//        automaticallyAdjustsScrollViewInsets = false
//        allConsetY = CGFloat((mheaderHeight + mStatckHeight))
//
        myTableView.contentInset = UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)
        
        let headerV = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height:CGFloat (mHeaderHeight)))
        
        headerV.backgroundColor = UIColor.clear
        
        myTableView.tableHeaderView = headerV
        
        myTableView.backgroundColor=UIColor.clear
        
        
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        }else{
            return baseUIArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            let cellID = "cellidone"
            let myCell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            myCell.textLabel?.text = "第\(indexPath.row)行第\(indexPath.section)组"
            
            cell = myCell
            
        }else{
            let cellID = "cellidtwo"
            let myCell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            
            myCell.textLabel?.text = baseUIArray[indexPath.row]
            
            myCell.accessoryType = .disclosureIndicator
            
            cell = myCell
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                let AVC = AnimationVController()
                self.navigationController?.pushViewController(AVC, animated: true)
            }
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y;
        
        self.navigationController?.navigationBar.isHidden = false
        
        if offsetY < 0
        {
            
            let mheight = myInitFrame.size.height - offsetY
            let mwidth = myInitFrame.size.width + (mheight - myInitFrame.size.height) * 240/SCREEN_WIDTH //240/SCREEN_WIDTH这个是宽高比
            let mx = (mwidth - myInitFrame.size.width)/2
            headerImV.frame = CGRect(x: -mx, y: 0, width: mwidth, height: mheight)
            
        }else{
            
            headerImV.frame.origin.y = myInitFrame.origin.y - offsetY
            
        }
        self.navigationController?.navigationBar.alpha = offsetY/240;
    
    }
}
