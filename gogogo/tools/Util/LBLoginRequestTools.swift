//
//  LBLoginRequestComm.swift
//  thething
//
//  Created by YSCC on 16/6/25.
//  Copyright © 2016年 lbxd. All rights reserved.
//

import Foundation
import Alamofire


class LBLoginRequestTools{
    
    typealias LBRequestCallBack = (_ result: [String : Any]?, _ error: NSError?)->()
    static let sharedTools = LBLoginRequestTools()
    
}

//绑定
extension LBLoginRequestTools {
    
    func bindMod(_ phoneNum: String, capNum: String, finished: @escaping LBRequestCallBack) {
        
        let url = String(format: "%@%@/%@", BaseURLAppendWith(Path_User_bindMob), phoneNum, capNum)
        
//        RequestUtil.requestUseGetAFN(with: url, parameters: nil, timeout: 8, isValidate: false, success: { (_, res) in
//            
//            finished(res as? [String : Any], nil)
//            }) { (_, er) in
//                finished(nil, er as NSError?)
//        }
        
//        RequestUtil.requestUseGetAFN(with: url, parameters: nil, timeout: 8, isValidate: false, success: { (op, res) in
//            
//            finished(res, nil)
//            
////            let dict = res as! [String: AnyObject]
//            
////            btn.enabled = true
////            
////            print(res)
////            guard let code = dict["code"] as? NSInteger else {
////                return
////            }
////            
////            guard let msg = dict["msg"] as? String else {
////                return
////            }
////            
////            if code == 200 {
////                
////            }else{
////                
////                self.messageView.showMessage(msg)
////            }
//        }) { (task, er) in
//            
//            finished(result: nil, error: er)
////            btn.enabled = true
////            
////            print(er)
//        }
    }
}
//登陆
extension LBLoginRequestTools {
    
    func login(_ type: NSInteger, dict: [String: Any], finished: @escaping LBRequestCallBack) {
        let loginUrl = String(format: "%@%ld", BaseURLAppendWith(Path_v1User_login), type)
//        RequestUtil.requestUsePostAFN(with: loginUrl, parameters: dict , timeout: 8, isValidate: false, success: { (_, res) in
//            
//            finished(res as? [String : Any], nil)
//        }) { (_, er) in
//            finished(nil, er as NSError?)
//        }
    }
}

//注册
extension LBLoginRequestTools {
    
    func register(_ dict: [String: AnyObject], finished: @escaping LBRequestCallBack) {
        let url = String(format:"%@", BaseURLAppendWith(Path_User_register))
        
//        RequestUtil.requestUsePostAFN(with: url, parameters: dict, timeout: 8, isValidate: false, success: { (_, res) in
//
//            finished(res as? [String : Any], nil)
//        }) { (_, er) in
//            finished(nil, er as NSError?)
//        }
    }
}


//获取验证码
extension LBLoginRequestTools {
    
    func loadCaptcha(_ string: String, finished: @escaping LBRequestCallBack) {
        
        let url = String(format: "%@%@", BaseURLAppendWith(Path_User_captcha), string)
        
//        RequestUtil.requestUseGetAFN(with: url, parameters: nil, timeout: 8, isValidate: false, success: { (_, res) in
//            let dict = res as! [String: AnyObject]
//            
//            guard let code = dict["code"] as? NSInteger else {
//                return
//            }
//            
//            guard let msg = dict["msg"] as? String else {
//                return
//            }
//            
//            if code == 200 {
//                self.runtimer()
//            }else{
//                self.codeBtn.setTitle("获取验证码", forState: .Normal)
//                self.codeBtn.activityIndicatorView.stopAnimating()
//            }
//            finished(res as? [String : Any], nil)
//        }) { (_, er) in
//            finished(nil, er as NSError?)
//            self.codeBtn.enabled = true
//            self.codeBtn.setTitle("获取验证码", forState: .Normal)
//            self.codeBtn.activityIndicatorView.stopAnimating()
//            self.messageView.showMessage("获取验证码失败")
//        }
        
        getRequest(urlString: url, params: nil, success: { (res) in
            
            
            finished(res, nil)
            
        }) { (er) in
            
            finished(nil, er as NSError?)
            
        }
        

    }
}

//封装
extension LBLoginRequestTools{
    
    
    //MARK: - GET 请求
    //    let tools : NetworkRequest.shareInstance!
    
    func getRequest(urlString: String, params : [String : Any]?, success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.session.configuration.timeoutIntervalForRequest = 30
        
//        let user = User.current()
//        
//        let token = user?.token
//        let uid = user?.id
//        
//        
//        if(!(token != nil) || !(uid != nil))
//        {
//            NSLog("错误：token 或 uid 为空")
//            return
//        }
        
//        let headers = ["token":token!, "ukey":uid!] as [String : Any]
        
        //使用Alamofire进行网络请求时，调用该方法的参数都是通过getRequest(urlString， params, success :, failture :）传入的，而success传入的其实是一个接受           [String : AnyObject]类型 返回void类型的函数
        
        
        Alamofire.request(urlString, method:.get, parameters: params, headers: nil)
            .responseJSON { (response) in/*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    //                    if let value = response.result.value as? [String: AnyObject] {
                    success(value as! [String : AnyObject])
                    //                    }
//                    let json = JSON(value)
//                    PrintLog(json)
                    
                case .failure(let error): break
//                    failture(error)
//                    print("error:\(error)")
                }
        }
        
    }
    //MARK: - POST 请求
    func postRequest(urlString : String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
//                    let json = JSON(value)
                    print(value)
//                    PrintLog(json)
                }
            case .failure(let error):
                failture(error)
//                PrintLog("error:\(error)")
            }
            
        }
    }
    
    
    
}


