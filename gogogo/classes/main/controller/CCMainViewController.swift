//
//  CCMainViewController.swift
//  gogogo
//
//  Created by 陈伟 on 2017/3/21.
//  Copyright © 2017年 陈伟. All rights reserved.
//

import UIKit

private let kCCMainTableCellId = "kCCMainTableCellId"

class CCMainViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Alamofire
        initializeComponent()
    }
    
    private func initializeComponent() {
        
        let tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView);
        tableView.backgroundColor = UIColor.gray
        tableView.dataSource = self
        
        navigationController?.setNavigationBarHidden(true, animated: false)
//        let navView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 44))
        self.view.addSubview(navView)
        
        
        
        tableView.register(CCMainTableViewCell.self, forCellReuseIdentifier: kCCMainTableCellId)
        
    }
    
    lazy var navView : UIView = {
        
        
        let navView = UIView(frame: CGRect(x: 0, y: 22, width: kScreenWidth, height: 44))
        navView.backgroundColor = UIColor.yellow
        
        let iconImg = UIImageView(image: UIImage(named: "main_headerimg"))
        iconImg.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CCMainViewController.iconClick))
        tap.numberOfTapsRequired = 1
        iconImg.addGestureRecognizer(tap)
        
        let leftView : UIView = self.topSelectView()
        leftView.tag = 1
        let rightView : UIView = self.topSelectView()
        rightView.tag = 2
        
        navView.addSubview(iconImg)
        navView.addSubview(leftView)
        navView.addSubview(rightView)
        
        iconImg.snp.makeConstraints({ (make) -> Void in
            make.left.equalToSuperview().offset(15*ccRatio)
            make.centerY.equalToSuperview()
            make.width.equalTo(30*ccRatio)
            make.height.equalTo(30*ccRatio)
        })
        
        leftView.snp.makeConstraints({ (make) -> Void in
            make.left.equalTo(iconImg.snp.right).offset(10*ccRatio)
            make.centerY.equalToSuperview()
            make.height.equalTo(30*ccRatio)
//            make.width.equalTo(rightView.snp.width)
        })
        
        rightView.snp.makeConstraints({ (make) -> Void in
            make.right.equalToSuperview().offset(-15*ccRatio)
            make.centerY.equalToSuperview()
            make.left.equalTo(leftView.snp.right).offset(10*ccRatio)
            make.width.equalTo(leftView.snp.width)
        })
        
        
        return navView
    }()
    
    @objc private func iconClick(){
        
        SLSlideMenu.slideMenu(withFrame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), delegate: self, direction: SLSlideMenuDirection.left, slideOffset: 250, allowSwipeCloseMenu: true, aboveNav: true, identifier: "left")
        
    }
    
    
    fileprivate lazy var pickerView : UIPickerView = {
       
        let pv = UIPickerView(frame: CGRect(x: 0, y: kScreenHeight, width: kScreenWidth, height: 220*ccRatio))
        
        pv.delegate = self
        pv.dataSource = self
        
        return pv
    }()
    
    private func topSelectView() -> UIView{
        
        let backView = UIView()
//        view.backgroundColor = randomColor
        backView.backgroundColor = UIColor.green
        let label = UILabel()
        label.text = "说个数吧"
        let arrowImg = UIImageView(image: UIImage(named: "main_downArrow"))
        
        backView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CCMainViewController.topSelectViewClick))
        tap.numberOfTapsRequired = 1
        backView.addGestureRecognizer(tap)
        
        backView.addSubview(label)
        backView.addSubview(arrowImg)
        
        arrowImg.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15*ccRatio)
        }
        
        label.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15*ccRatio)
        }
        
        return backView
    }
    
    @objc private func topSelectViewClick(gesture : UITapGestureRecognizer) {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = self.view.bounds
        
        effectView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CCMainViewController.effectViewTouch))
        tap.numberOfTapsRequired = 1
        effectView.addGestureRecognizer(tap)
        self.view.addSubview(effectView)
        
        if gesture.view?.tag == 1 {//
            
        }else{
            
        }
        
        
    }
    
//    private lazy var
    @objc func effectViewTouch(){
        
        
        
    }
    
}

extension CCMainViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCCMainTableCellId, for: indexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击%@", indexPath);
    }
    
}

extension CCMainViewController: UITableViewDelegate{
    
    
    
    
}

extension CCMainViewController: SLSlideMenuProtocol{
    func slideMenu(_ slideMenu: SLSlideMenu!, prepareSubviewsForMenuView menuView: UIView!) {
        
        let headView = UIImageView(image: UIImage(named: "main_headerimg"))
        
        let nameLB = UILabel()
        nameLB.text = "点击登录"
        
        menuView.addSubview(headView)
        menuView.addSubview(nameLB);
        
        headView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100*ccRatio)
            make.size.equalTo(CGSize(width: 50*ccRatio, height: 50*ccRatio))
        }
        
        nameLB.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(headView.snp.bottom)
        }
    }
}


class CCSelectView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupUI()

    }
    
    let label = UILabel()
    
    func setupUI() {
        
//        let view = UIView()
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CCSelectView.clickView))
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        
        let arrowImg = UIImageView(image: UIImage(named: "main_downArrow"))
        
        addSubview(label)
        addSubview(arrowImg)
        
        arrowImg.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15*ccRatio)
        }
        
        label.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15*ccRatio)
        }
        
    }
    
    @objc private func clickView(){
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

extension CCMainViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}

