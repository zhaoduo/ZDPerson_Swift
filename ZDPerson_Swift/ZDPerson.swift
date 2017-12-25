//
//  ZDPerson.swift
//  ZDPerson_Swift
//
//  Created by zdd. on 2017/9/4.
//  Copyright © 2017年 zdd. All rights reserved.
//

import UIKit
import Foundation

let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let SCREENT_HEIGHT = UIScreen.main.bounds.size.height

let IS_iPhoneX = (SCREEN_WIDTH == CGFloat(375) && SCREENT_HEIGHT == CGFloat(812))

let IS_NavigationBarHeight : CGFloat = (IS_iPhoneX ? 88.0 : 64.0)

let IS_StateHeight : CGFloat = (IS_iPhoneX ? 44 : 20)

let IS_BottomSafeMargin : CGFloat = (IS_iPhoneX ? 34 : 0)

let HEADERVIEW_HEIGHT  = CGFloat(200);
