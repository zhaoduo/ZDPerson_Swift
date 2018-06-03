//
//  ZDPersonViewController.swift
//  ZDPerson_Swift
//
//  Created by zdd. on 2017/9/5.
//  Copyright © 2017年 zdd. All rights reserved.
//

import UIKit

class ZDPersonViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ZDBaseTableViewDelegate,ZDHeaderViewDelegate,UIScrollViewDelegate {

    let Celldentifier = "CELL"
    
    var navigationBgView : UIView!
    
    var collectionView : UICollectionView!
    var firstVC : ZDFirstViewController!
    var secondVC : ZDSecondViewController!
    var thirdVC : ZDThreeViewController!
    
    var selectTag : Int = 1000;
    
    var headerView : ZDHeaderView!
    override func viewWillAppear(_ animated: Bool) {
        
//       self.navigationController?.navigationBar.isHidden = true
        
        self.navigationController?.navigationBar .setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.setupUI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableViewScrollview(_ scrollView:UIScrollView){
        
        let offetY = scrollView.contentOffset.y
        
//        print(" 偏移________________\(offetY) ______   tag值为\(scrollView.tag)_____选中————\(selectTag)")
        
        if scrollView.tag != selectTag {
            return
        }
        
        firstVC .setNewContentOffset(offetY, tag: scrollView.tag)
        secondVC .setNewContentOffset(offetY, tag: scrollView.tag)
        thirdVC .setNewContentOffset(offetY, tag: scrollView.tag)
        
        //改变头部视图的位置
        let tempHeight = HEADERVIEW_HEIGHT - IS_NavigationBarHeight - 44
        if offetY <= tempHeight {
            var frame = self.headerView.frame
            let y = -scrollView.contentOffset.y
            frame.origin.y = y
            self.headerView.frame = frame
//            self.navigationBgView.backgroundColor = UIColor.init(white: 1, alpha: offetY/tempHeight)
            self.navigationBgView.backgroundColor = UIColor.brown.withAlphaComponent(offetY/tempHeight)
            
        }else{
            var frame = self.headerView.frame
            let y = -tempHeight
            frame.origin.y = y
            self.headerView.frame = frame
            
            self.navigationBgView.backgroundColor = UIColor.brown
        }
        
        //下拉放大
        if offetY < 0 {
            var rect = self.headerView.myImageView.frame
            rect.origin.y = offetY
            rect.size.height = -offetY + HEADERVIEW_HEIGHT
            self.headerView.myImageView.frame = rect
        }
        
    }
    //MARK - UICollectionViewDataSource
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Celldentifier, for: indexPath)
        //随即色
        
         let vc = self.childViewControllers[indexPath.row]

        cell.contentView.addSubview(vc.view)
        return cell;
        
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.childViewControllers.count;
    }

    //MARK -代理 ZDHeaderViewDelegate
    func headerView(_ headerView:ZDHeaderView ,clickButtonIndex index:NSInteger){
        
        print("你惦记了----------\(index)")
        selectTag = 1000 + index
        let indexPath = NSIndexPath.init(row: index, section: 0);
        self.collectionView .scrollToItem(at: indexPath as IndexPath, at: UICollectionViewScrollPosition.left, animated: true);
    }
    //MARL - 代理 UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offetY = scrollView.contentOffset.x;
        
        if offetY == 0 {
            selectTag = 1000 + 0
            self.headerView .clickHeaderViewButton(0)
            
        } else if(offetY == SCREEN_WIDTH){
         
            selectTag = 1000 + 1
            self.headerView .clickHeaderViewButton(1)
            
        }else{
            
            selectTag = 1000 + 2
            self.headerView .clickHeaderViewButton(2)
        }
        
    }
    
    //MARK: - 初始化视图
    
    func setupUI() {
        
        navigationBgView = UIView.init(frame: CGRect.init(x: CGFloat(0), y: CGFloat(-IS_StateHeight), width: SCREEN_WIDTH, height:IS_NavigationBarHeight))
//        navigationBgView.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.addSubview(navigationBgView)
        
        self.view.backgroundColor = UIColor.brown
        
        selectTag = 1000
        
        firstVC = ZDFirstViewController()
        firstVC.tableView.tag = 1000
        firstVC.delegate = self
        
        secondVC = ZDSecondViewController()
        secondVC.tableView.tag = 1001
        secondVC.delegate = self
        
        thirdVC = ZDThreeViewController()
        thirdVC.tableView.tag = 1002
        thirdVC.delegate = self
        
        self.addChildViewController(firstVC)
        self.addChildViewController(secondVC)
        self.addChildViewController(thirdVC)
        
        let layout = UICollectionViewFlowLayout()
        //cell的大小
        layout.itemSize = CGSize(width: SCREEN_WIDTH, height: SCREENT_HEIGHT);
        
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        //行间距上下
        layout.minimumLineSpacing = 0
        
        //item 左右间距
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView.init(frame: CGRect(x:0,y:0,width:SCREEN_WIDTH,height:SCREENT_HEIGHT - IS_BottomSafeMargin), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self;
        collectionView.backgroundColor = UIColor.white
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Celldentifier)
        
        self.view.addSubview(collectionView)
        
        
        headerView = ZDHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: HEADERVIEW_HEIGHT))
        headerView.delegate = self
        headerView.backgroundColor = UIColor.brown
        self.view.addSubview(headerView)
    }
}
