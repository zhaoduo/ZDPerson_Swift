//
//  ViewController.swift
//  ZDPerson_Swift
//
//  Created by zdd. on 2017/9/4.
//  Copyright © 2017年 zdd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.brown
        
        let btn = UIButton.init(frame: CGRect(x:100,y:100,width:100,height:40))
        
        
        btn.setTitle("个人主页", for: UIControlState.normal)
        btn.setTitleColor(UIColor.green, for: UIControlState.normal)
        btn.center = CGPoint.init(x: SCREEN_WIDTH * 0.5, y: SCREENT_HEIGHT * 0.5)
        btn .addTarget(self, action: #selector(ViewController.clickPerson(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    
        
    }
    @objc func clickPerson(_ btn:UIButton){
        
        print("_________哈哈啊_________")
        let personVC = ZDPersonViewController()
        
        self.navigationController?.pushViewController(personVC, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

