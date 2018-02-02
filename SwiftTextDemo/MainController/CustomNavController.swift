//
//  CustomNavController.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/23.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class CustomNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置item的bar
        //            navigationBar.items=[navItem]
        //     设置navBar 的渲染颜色
        self.navigationBar.barTintColor=UIColor.red
        //导航栏的渲染颜色
        //        navigationController?.navigationBar.barTintColor=UIColor.cz_color(withHex: 0xF6F6F6)
        //导航栏字体颜
    self.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        //这只系统按钮的文字渲染颜
        self.navigationBar.tintColor=UIColor.black
        // Do any additional setup after loading the view.
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed=true
            if let vc = viewController as? BaseViewController {
                var title = "返回"
                if childViewControllers.count==1{
                    title = childViewControllers.first?.title ?? "返回"
                }
                vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, fontSize: 16, target: self, action: #selector(popToParent), isBack: true)
            }
        }
        super.pushViewController(viewController, animated: animated) //一定要继承父类的方法，否则出现问题
    }
    @objc private func popToParent(){
        popViewController(animated: true)
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
