//
//  AnimationVController.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/29.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class AnimationVController: BaseViewController {

    private var  animArray = [String]()
    private var animView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animArray = ["fade","push","reveal","moveIn","cube","suckEffect","oglFlip","rippleEffect","pageCurl","cameraIrisHollowOpen","cameraIrisHollowClose","rippleEffect"]
        
        createRightBtn(titleArray: animArray)
        // Do any additional setup after loading the view.
    }
    func createRightBtn(titleArray:[String]) -> Void {
        
        for (index,value)  in titleArray.enumerated() {
            
            let  subBtn = UIButton.creatButtonWith(title: value, fontSize: 12, normalColor: UIColor.black, highlightedColor: UIColor.orange)
            
            
            subBtn.frame = CGRect(x: Int(CGFloat(SCREEN_WIDTH-100)), y:80+index * (10+30), width: 80, height: 30)
            
            subBtn.addTarget(self, action:#selector(self.animaClick(button:)), for:.touchUpInside)
       
            self.view.addSubview(subBtn)
        }
        
        animView = UIImageView.creatImageViewWith(frame: CGRect(x: 30, y: (SCREEN_HEIGHT-30)/2, width: 50, height: 50), imageName: "17113");
        
        view.addSubview(animView)
        
    }
    @objc func animaClick(button:UIButton){
        animationWithType(aniType: button.titleLabel?.text ?? "", aniView: animView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animationWithType(aniType:String,aniView:UIImageView) -> Void {
        let transiton = CATransition()
        //重复次数
        transiton.repeatCount = 1
        //动画类型
        transiton.type = aniType
        //子类型方向
        transiton.subtype=kCATransitionFromLeft
        
        transiton.duration = 3
        
        aniView.layer.add(transiton, forKey: nil)
        
        
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
