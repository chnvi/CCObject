//
//  CCLoginController.swift
//  gogogo
//
//  Created by YSCC on 2017/4/5.
//  Copyright © 2017年 陈伟. All rights reserved.
//

import Foundation

typealias CCCompletionBlock = ()->()




class CCLoginController: UIViewController {
    
    private var isRuning: Bool = false
    private var currentTime: NSInteger = 0
    private var maxTime: NSInteger = 60
    
    private var timer: Timer?
    
    let user = User()
    
    class func modalInViewContrller(){
        
        let loginVC = CCLoginController()
        let nav : UINavigationController = UINavigationController(rootViewController: loginVC)
        
        let rootVc = UIApplication.shared.keyWindow?.rootViewController
        
        rootVc?.present(nav, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        initializeComponent()
    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func initializeComponent(){
        
        title = "登陆"
        view.backgroundColor = UIColor.gray
        
//        view.addSubview(messageView)
        
        view.addSubview(whiteBackView)
        view.addSubview(sureBindBtn)
        
        whiteBackView.addSubview(phoneTextField)
        whiteBackView.addSubview(codeBtn)
        whiteBackView.addSubview(codeText)
        
        whiteBackView.snp.makeConstraints { (make) in
            make.top.equalTo(64 + 40)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(100)
        }
        
        sureBindBtn.snp.makeConstraints { (make) in
            make.top.equalTo(whiteBackView.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(25)
        }
        
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(whiteBackView.snp.top)
            make.right.equalTo(codeBtn.snp.left)
            make.left.equalTo(whiteBackView.snp.left)
            make.height.equalTo(30)
        }
        
        codeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(whiteBackView.snp.right).offset(-20)
            make.left.equalTo(phoneTextField.snp.right)
            make.width.equalTo(120)
            make.top.equalTo(whiteBackView.snp.top).offset(5)
        }
        
        codeText.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextField.snp.bottom)
            make.left.equalTo(phoneTextField.snp.left)
            make.right.equalTo(codeBtn.snp.right)
            make.height.equalTo(30)
        }
    }
    
    @objc private func codeButtonTouchUpInside(btn: ActivityIndicatorButton){
        
        codeBtn.isEnabled = false
        codeBtn.setTitle("", for: .normal)
        codeBtn.activityIndicatorView.startAnimating()
        
//        codeBtn.
        LBLoginRequestTools.sharedTools.loadCaptcha(phoneTextField.text!) { (res, error) in
            if error != nil {
                print(error)
                self.codeBtn.isEnabled = true
                self.codeBtn.setTitle("获取验证码", for: .normal)
                self.codeBtn.activityIndicatorView.stopAnimating()
//                self.messageView.showMessage("获取验证码失败")
                return
            }
            
            let dict = res as! [String: AnyObject]
            guard let code = dict["code"] as? NSInteger else {
                return
            }
            guard let msg = dict["msg"] as? String else {
                return
            }
            
            if code == 200 {
                self.runtimer()
            }else{
                self.codeBtn.setTitle("获取验证码", for: .normal)
                self.codeBtn.activityIndicatorView.stopAnimating()
//                self.messageView.showMessage(msg)
            }
        }
    }
    
    private func runtimer() {
        if isRuning {
            return
        }
        
        isRuning = true
        
        currentTime = 0
        codeBtn.isEnabled = false
        codeBtn.activityIndicatorView.stopAnimating()
        codeBtn.backgroundColor = Hex2UIColor(rgbValue: 0xe0e0e0)
        codeBtn.setTitleColor(UIColor.gray, for: UIControlState.normal)
        //        timer = NSTimer(timeInterval: 1, target: self, selector: #selector(LBBindPhoneNum.clocking), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CCLoginController.clocking), userInfo: nil, repeats: true)
        //        timer?.fire()
    }
    
    
    @objc private func registerButtonTouchUpInside(btn: UIButton){
        
        btn.isEnabled = false
        
        var pra = ["mobile": phoneTextField.text!, "avatar": user.avatar, "nickname": user.nickname, "device": user.device, "captcha": codeText.text!, "isThirdPart": 1] as [String : Any]
        
        if (user.qqId != nil) {
            pra["qqId"] = user.qqId
        }
        
        if (user.wechatId != nil) {
            pra["wechatId"] = user.wechatId
        }
        
        if (user.weiboId != nil) {
            pra["weiboId"] = user.weiboId
        }
        
//        LBLoginRequestTools.sharedTools.register(pra) { (res, error) in
//            
//            print(res)
//            print(error)
//            
//            if error != nil {
//                btn.enabled = true
//                SVProgressHUD.showErrorWithStatus("网络故障,请稍后试")
//                return
//            }
//            
//            let dict = res as! [String: AnyObject]
//            
//            btn.enabled = true
//            guard let code = dict["code"] as? NSInteger else {
//                return
//            }
//            guard let msg = dict["msg"] as? String else {
//                return
//            }
//            
//            if code == 200 {
//                print("绑定成功,  do......................")
//                //此处回来用户信息 存储后
//                
//                guard let json = dict["object"] as? [String: AnyObject] else {
//                    print(3)
//                    print(dict)
//                    return
//                }
//                
//                let user = User.yy_modelWithDictionary(json)
//                user!.save()
//                
//                self.navigationController?.navigationBarHidden = false
//                
//                let quickAdd = LBQuickAddFriendController()
//                self.navigationController?.pushViewController(quickAdd, animated: true)
//                print("注册成功\(res )")
//                
//            }else{
//                self.messageView.showMessage(msg)
//            }
//        }
    }
    
    
    @objc private func clocking() {
        if currentTime > maxTime {
            timer!.invalidate()
            timer = nil
            currentTime = 0
            isRuning = false
            codeBtn.isEnabled = true
//            codeBtn.backgroundColor = ThemeColor
            codeBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
            codeBtn.setTitle("获取验证码", for: UIControlState.normal)
        }else{
            
            let title = String(format: "%@(%ld)", "获取验证码", (maxTime-currentTime))
            //            codeBtn.titleLabel?.text = title
            
            codeBtn.backgroundColor = Hex2UIColor(rgbValue: 0xe0e0e0)
            codeBtn.setTitle(title, for: UIControlState.normal)
            codeBtn.setTitleColor(UIColor.gray, for: UIControlState.normal)
            currentTime += 1
        }
    }
    
    //    private lazy var timer: NSTimer = NSTimer(timeInterval: 1, target: self, selector: #selector(LBBindPhoneNum.clocking), userInfo: nil, repeats: true)
//    private let messageView = WUMessageView.init(withDefault: ())
    
    private lazy var whiteBackView: UIView = {
        
        let whiteV: UIView = UIView()
        whiteV.backgroundColor = UIColor.white
        return whiteV
        
    }()
    
    private lazy var phoneTextField: UITextField = {
        
        let phoneText: UITextField = UITextField()
        phoneText.textColor = Hex2UIColor(rgbValue: 0x4d4d4d)
        phoneText.keyboardType = .numberPad
        phoneText.placeholder = "请输入手机号"
        return phoneText
    }()
    
    private lazy var codeBtn: ActivityIndicatorButton = {
        
        let code: ActivityIndicatorButton = ActivityIndicatorButton()
//        code.backgroundColor = ThemeColor
        code.radius = 4
        code.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(), size: 24)
        //        code.titleLabel?.font = Font.fontWithType(FontType.FZLanTingHei_L_GBK, size: 14)
//        code.setTitle("获取验证码", for: .Normal)
        code.setTitle("获取验证码", for: .normal)
        code.addTarget(self, action: #selector(CCLoginController.codeButtonTouchUpInside(btn:)), for: .touchUpInside)
        return code
    }()
    
    private lazy var codeText: UITextField = {
        let c = UITextField()
        c.keyboardType = .numberPad
        c.placeholder = "请输入验证码"
        return c
    }()
    
    private lazy var sureBindBtn: ActivityIndicatorButton = {
        let sureBtn = ActivityIndicatorButton()
        sureBtn.setTitle("确认绑定", for: UIControlState.normal)
        sureBtn.addTarget(self, action: #selector(CCLoginController.codeButtonTouchUpInside(btn:)), for: .touchUpInside)
        return sureBtn
    }()
}
