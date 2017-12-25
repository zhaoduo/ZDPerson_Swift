//
//  ZDFirstViewController.swift
//  ZDPerson_Swift
//
//  Created by zdd. on 2017/9/5.
//  Copyright © 2017年 zdd. All rights reserved.
//

import UIKit

class ZDFirstViewController: ZDBaseTableTableViewController {

    var myTableView : UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.green
        
        myTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREENT_HEIGHT - IS_BottomSafeMargin), style: UITableViewStyle.plain)
        
        myTableView.dataSource = self
        myTableView.tag = 1000
        myTableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: HEADERVIEW_HEIGHT))
        
        self.tableView = myTableView
    }
    
    
    //MARK: - 代理 UITableViewDelegate && UITableViewDataSource
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 30;
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
        }
        
        cell?.textLabel?.text = " 第" + String(indexPath.row) + "个"
        
        cell?.textLabel?.textColor = UIColor.green
        return cell!
        
    }
    
    // MARK: -UI设置
    
    //override 重写父类方法
    override func setNewContentOffset(_ offset:CGFloat,tag:Int){
        
        if tag != 1000 {
            
            let offetY = self.tableView.contentOffset.y
            
            let tempHeight = HEADERVIEW_HEIGHT - 64 - 44
            
            if offset > tempHeight {
                
                if offetY < tempHeight{
                    
                    self.tableView .setContentOffset(CGPoint.init(x: CGFloat(0), y: tempHeight), animated: true)
                    
                }
            }
            
            if offset <= 0 {
                self.tableView .setContentOffset(CGPoint.init(x: CGFloat(0), y: CGFloat(0)), animated: true)
            }
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
