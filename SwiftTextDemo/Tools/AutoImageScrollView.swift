//
//  AutoImageScrollView.swift
//  SwiftCollectionView
//
//  Created by bddzzw on 2018/1/24.
//  Copyright © 2018年 bddzzw. All rights reserved.
//

import UIKit

class AutoImageScrollView: UIView,UIScrollViewDelegate {
    
   private let pageCollor = UIPageControl()
    private var myTimer = Timer()
   private var  imageArray : [String] = [String]()
    private var autoScroll = UIScrollView()
    
    typealias valueBlock = (Int)->()
    var returnIndex : valueBlock?
    
   
    
    /// bananr自动滚动视图
    ///
    /// - Parameters:
    ///   - frame: 视图大小
    ///   - imageArray: 图片数组
    ///   - action: 点击方法
    func initWidthAutoImageScroll(frame:CGRect,imageAry:[String]) -> UIView {
        
         imageArray=imageAry
        
        if imageArray.count>0 {
            
            imageArray.insert(imageArray.last!, at: 0)
            
            imageArray.append(imageArray[1])
        }
        
        createScrollView(frame: frame)
        
        
        return self
    }
      func createScrollView(frame:CGRect) -> Void {
        
        self.frame=frame
        
        pageCollor.frame=CGRect(x: frame.width/3, y: frame.height-30, width: frame.width/3, height: 30)
        pageCollor.pageIndicatorTintColor=UIColor.gray
        pageCollor.currentPageIndicatorTintColor=UIColor.yellow
        if imageArray.count>2 {
          pageCollor.numberOfPages=imageArray.count - 2
        }
        autoScroll.frame=frame
        autoScroll.contentSize=CGSize(width:CGFloat(Float(imageArray.count) * Float(frame.width)), height: frame.height) //这个貌似Swift 同类型的才能进行运算所以这样写
        
        autoScroll.setContentOffset(CGPoint(x: frame.width, y: 0), animated: true)
        
        autoScroll.isPagingEnabled=true
       
        autoScroll.showsHorizontalScrollIndicator = false
        
        pageCollor.currentPage=0
        
        self.myTimer = Timer.scheduledTimer(timeInterval: 2.00, target: self, selector: #selector(scrollImage), userInfo: nil, repeats: true)
    
//        let runLoop = RunLoop.main.add(<#T##timer: Timer##Timer#>, forMode: <#T##RunLoopMode#>)怎么写都不对先不用吧
        
         autoScroll.delegate=self;
        
        
        for (index,value) in imageArray.enumerated()
        {
            let imageV = UIImageView()
            
            let imageName = String(value)
            
            let imageVMaxX = CGFloat(CGFloat(index)*CGFloat(frame.width))
            
            imageV.frame=CGRect(x: imageVMaxX, y: 0, width: frame.width, height: frame.height)
            
            imageV.image=UIImage(named: imageName)
            
            imageV.isUserInteractionEnabled=true
            
            imageV.tag = index
            
            let tapSingle=UITapGestureRecognizer(target:self,action:#selector(tapClick(_:)))
            
            imageV .addGestureRecognizer(tapSingle)
            
            
            autoScroll.addSubview(imageV)
            
        }
       
        self.addSubview(pageCollor)
        
        self.addSubview(autoScroll)
        
        self.bringSubview(toFront: pageCollor)
        
        
    }
    @objc func tapClick(_ sender:UITapGestureRecognizer) -> Void{
        
        let tap = sender.view?.tag
        
        returnIndex!(tap ?? 0)
        
    }
    @objc func scrollImage() -> Void
    {
        
        var offSetX = autoScroll.contentOffset.x
        
        offSetX = offSetX + frame.width
        
        if offSetX < frame.width/2 {
            if imageArray.count > 2{
                 offSetX = frame.width * CGFloat( imageArray.count - 2 )
            }
           
        }
        if imageArray.count > 2 {
            if offSetX > frame.width/2 + frame.width * CGFloat( imageArray.count - 2 ) {
                offSetX = frame.width * 1
            }
        }
        
        autoScroll.setContentOffset(CGPoint(x: offSetX, y: 0), animated: true)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         //获取偏移量
        
        var offSetX = scrollView.contentOffset.x
        //保证偏移一半的时候就能显示另一页
        offSetX = offSetX + frame.width / 2
        
        var  page = Int(offSetX / frame.width)
        
        if imageArray.count > 2 {
            if page < 1  {
                page = imageArray.count - 2
            }
            if page > imageArray.count - 1 {
                page = 0
            }
        }
        pageCollor.currentPage = Int(page) - 1
        
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        
        myTimer.invalidate()
        
        var offSetX = autoScroll.contentOffset.x
        
        if offSetX < frame.width/2 + frame.width {
            if imageArray.count > 2{
                offSetX = frame.width * CGFloat( imageArray.count - 2 )
            }
            
        }
        if imageArray.count > 2 {
            if offSetX > frame.width/2 + frame.width * CGFloat( imageArray.count - 2 ) {
                offSetX = frame.width * 1
            }
        }
        
        autoScroll.setContentOffset(CGPoint(x: offSetX, y: 0), animated: false)
    
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
         self.myTimer = Timer.scheduledTimer(timeInterval: 2.00, target: self, selector: #selector(scrollImage), userInfo: nil, repeats: true)
    }
    
}










