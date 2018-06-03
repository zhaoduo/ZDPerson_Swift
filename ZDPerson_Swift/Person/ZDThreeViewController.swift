//
//  ZDThreeViewController.swift
//  ZDPerson_Swift
//
//  Created by zdd. on 2017/9/5.
//  Copyright © 2017年 zdd. All rights reserved.
//

import UIKit

class ZDThreeViewController: ZDBaseTableTableViewController {
    
    var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.brown
        myTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREENT_HEIGHT - IS_BottomSafeMargin), style: UITableViewStyle.plain)
        myTableView.dataSource = self
        myTableView.tag = 1002

        myTableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: HEADERVIEW_HEIGHT))
        self.tableView = myTableView
    }

    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 30
    }
    
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
        }
        
        cell?.textLabel?.text = "第" + String(indexPath.row)
        cell?.textLabel?.textColor = UIColor.brown
        return cell!
        
    }
    
    
    //override 重写父类方法
    
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
