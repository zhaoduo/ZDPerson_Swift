//
//  ZDBaseTableTableViewController.swift
//  ZDPerson_Swift
//
//  Created by zdd. on 2017/9/6.
//  Copyright © 2017年 zdd. All rights reserved.
//

import UIKit
protocol ZDBaseTableViewDelegate:NSObjectProtocol {
    
    func tableViewScrollview(_ scrollView:UIScrollView)
}

class ZDBaseTableTableViewController: UITableViewController {

//    func setNewContentOffset(_ offset:CGFloat,tag:Int){}
    
    weak var delegate:ZDBaseTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func scrollViewDidScroll(_ scrollView: UIScrollView){
        if self.delegate != nil {
            delegate!.tableViewScrollview(self.tableView)
        }
    }
    
     func setNewContentOffset(_ offset:CGFloat,tag:Int){
        if tag != self.tableView.tag {
            let tempHeight = HEADERVIEW_HEIGHT - 64 - 44
            
            if offset > tempHeight {
                self.tableView .setContentOffset(CGPoint.init(x: CGFloat(0), y: tempHeight), animated: true)
            }else{
                self.tableView .setContentOffset(CGPoint.init(x: CGFloat(0), y: offset), animated: true)
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
