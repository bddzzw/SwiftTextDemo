//
//  CustomTabbarController.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/23.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
        // Do any additional setup after loading the view.
    }
    private func setupChildController(){
        //从json中拿到数据
        guard let path  = Bundle.main.path(forResource: "test.json", ofType: nil),
            let data  = NSData(contentsOfFile: path),
            let array  = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [[String:String]]
            else {
                return
            }
        var arrayM = [UIViewController]()
        for dict in array! {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers=arrayM
        
        
    }
    private func controller(dict:[String:String])->UIViewController{
        

        guard let clsName=dict["clsName"],
            let title=dict["title"],
            let imageName=dict["imageName"],
            let  cls = NSClassFromString(Bundle.main.namespace+"."+clsName) as? BaseViewController.Type
            else {
            return UIViewController()
            }
        //创建控制器
        let vc = cls.init()
        
        vc.title=title
    
        vc.tabBarItem.image=UIImage(named:imageName)
        
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor:UIColor.orange],
            for: .highlighted)
        
        
        //设置tabbar 文字的大小和颜色
        vc.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14)],
            for: .normal)
    vc.tabBarItem.selectedImage=UIImage(named:imageName+"_red")?.withRenderingMode(.alwaysOriginal)
        
        let nav = CustomNavController(rootViewController:vc)
        
        return nav
        
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
