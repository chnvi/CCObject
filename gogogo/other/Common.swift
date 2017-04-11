//
//  Common.swift
//  weibo
//
//  Created by 陈伟 on 15/10/16.
//  Copyright © 2015年 陈伟. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

let ccRatio = (kScreenWidth/375.0)

let randomColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)

func Hex2UIColor(rgbValue: uint) -> UIColor {
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

let Path_User_captcha = "v1/user/captcha/"
let Path_User_bindMob = "v1/user/bindMobile/"
let Path_v1User_login = "v1/user/login/"
let Path_User_register = "v1/user/register"
let Path_Friend_cloud = "user/friend/cloud"
let Path_seekUser_help = "v1/post/seekUser/help"

let DownLoadUrl = "http://dwz.cn/thethingapp"


let BaseURL = "http://api.yanshu.cc:81/thething/"

func BaseURLAppendWith(_ path: String) -> String{
    return String(format: "%@%@", BaseURL, path)
}
