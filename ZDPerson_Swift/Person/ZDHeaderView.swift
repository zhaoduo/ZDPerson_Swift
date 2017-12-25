//
//  ZDHeaderView.swift
//  ZDPerson_Swift
//
//  Created by zdd. on 2017/9/13.
//  Copyright © 2017年 zdd. All rights reserved.
//

import UIKit

protocol ZDHeaderViewDelegate:NSObjectProtocol {
    
    func headerView(_ headerView:ZDHeaderView ,clickButtonIndex index:NSInteger)
    
}

class ZDHeaderView: UIView {

    
//    var selectIndex : NSInteger
    
    var myImageView = UIImageView()
    
    var bottomLineLabel = UILabel()
    
    
    weak var delegate:ZDHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        //添加一个背景视图
        myImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        
        myImageView.image = UIImage.init(named: "header")
        
        self.addSubview(myImageView)
        
        //添加三个按钮
        let btnWidth = SCREEN_WIDTH / 3
        
        let btnHeight : CGFloat = 40
        
        let topHeight = self.frame.size.height - CGFloat(btnHeight)
        
        let titleArr = ["最新","最热","最好"]
        
        for index in 0...2 {
            let btn = UIButton.init(frame: CGRect.init(x: CGFloat(index) * btnWidth, y: topHeight, width: btnWidth, height: btnHeight))
            btn.tag = 100 + index;
            btn .setTitle(titleArr[index], for: .normal)
//            btn .addTarget(self, action: #selector(clickBtn(_:)), for: UIControlEvents.touchUpInside)
            btn .addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
            self.addSubview(btn)
        }
        
        bottomLineLabel = UILabel.init(frame: CGRect.init(x: 0, y: self.frame.size.height - CGFloat(1), width: 30, height: 1))
        bottomLineLabel.backgroundColor = UIColor.white
        bottomLineLabel.center = CGPoint.init(x: self.frame.size.width / CGFloat(3) * 0.5, y: self.frame.size.height - CGFloat(1))
        self.addSubview(bottomLineLabel)
        
        
    }
    @objc func clickBtn(_ btn:UIButton) {
        
        let index = btn.tag - 100
        
        //延迟动画
        UIView.animate(withDuration: 0.2) { 
            self.bottomLineLabel.center = CGPoint.init(x: self.frame.size.width / CGFloat(3) * (CGFloat(0.5) + CGFloat(index)), y: self.bottomLineLabel.center.y)
        }
        
        //判断代理是否实现
        if self.delegate != nil {
            
            self.delegate!.headerView(self, clickButtonIndex: index)
        }
        
    }
    
    func clickHeaderViewButton(_ index:NSInteger){
        
        UIView.animate(withDuration: 0.2) {
            self.bottomLineLabel.center = CGPoint.init(x: self.frame.size.width / CGFloat(3) * (CGFloat(0.5) + CGFloat(index)), y: self.bottomLineLabel.center.y)
        }
    }
    
}
