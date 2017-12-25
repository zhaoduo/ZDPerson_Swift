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

    func setNewContentOffset(_ offset:CGFloat,tag:Int){}
    
    weak var delegate:ZDBaseTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }
    
    public override func scrollViewDidScroll(_ scrollView: UIScrollView){
        if self.delegate != nil {
            delegate!.tableViewScrollview(self.tableView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
