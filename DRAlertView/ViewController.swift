//
//  ViewController.swift
//  DRAlertView
//
//  Created by dengrui on 16/6/12.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YRPCommonModalViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func show(sender: AnyObject) {
        modalView.show()
    }
    
    private func setupUI() {
        modalView.modalViewDelegate = self
    }
    /**
     代理方法
     
     - parameter index: 按钮的下标
     - parameter arr:   按钮字段的数组
     */
    func clickBtnWithIndexAndView(index:Int,arr:[String]) {
        print(index)
    }
    
    private var modalView: YRPCommonModalView = {
        let modalView = YRPCommonModalView(arr: ["哈哈", "呵呵"])
        return modalView
    }()
}

