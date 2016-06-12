//
//  YRPCommonModalView.swift
//  shancai
//
//  Created by dengrui on 16/4/6.
//  Copyright © 2016年 yirupay. All rights reserved.
//

import UIKit

/// 屏幕适配
let kScreenWidth = UIScreen.mainScreen().bounds.width
let kScreenHeight = UIScreen.mainScreen().bounds.height
let kSCREEN_WIDTH_RATIO:CGFloat = kScreenWidth < 375 ? 1 : kScreenWidth/375.0
let kSCREEN_HEIGHT_RATIO:CGFloat = kScreenHeight < 667 ? 1 : kScreenHeight/667.0
func kAutoWEX(w:CGFloat)->CGFloat {
    return w*kSCREEN_WIDTH_RATIO
}
func kAutoHEX(h:CGFloat)->CGFloat {
    return h*kSCREEN_HEIGHT_RATIO
}
/**
*  这里修改每一行的高度
*/
let kModelViewCellHeight = kAutoHEX(55)
/**
*  颜色
*/
let kNormalColor = UIColor(HEX: "#333333")
let kRedColor = UIColor(HEX: "#df473b")
let kWhiteColor = UIColor(HEX: "#ffffff")
let kLineColor = UIColor(HEX: "#dddddd")
let kGrayColor = UIColor(HEX: "#666666")
let kBackGroundColor = UIColor(HEX: "#f4f4f4")
let kLightGrayColor = UIColor(HEX: "#999999")
let kGreenColor = UIColor(HEX: "#81c16d")


protocol YRPCommonModalViewDelegate:NSObjectProtocol {
    func clickBtnWithIndexAndView(index:Int,arr:[String])
}

internal class YRPCommonModalView: UIView {
    
    weak var modalViewDelegate:YRPCommonModalViewDelegate?
    var arr:[String]?
    init(arr: [String]) {
        super.init(frame: CGRectZero)
        self.frame = CGRect(x: 0, y: kScreenHeight, width: kScreenWidth, height: CGFloat(arr.count + 1) * kModelViewCellHeight + 5)
        self.arr = arr
        setupUI(arr)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(arr: [String]) {
        backgroundColor = kWhiteColor
        
        for i in 0..<arr.count {
            let btn = UIButton(title: arr[i])
            btn.tag = i
            btn.frame = CGRect(x: 0, y: CGFloat(i) * kModelViewCellHeight, width: kScreenWidth, height: kModelViewCellHeight)
            btn.addTarget(self, action: "clickBtns:", forControlEvents: .TouchUpInside)
            let line = UIView(frame: CGRect(x: 0, y: CGFloat(i) * kModelViewCellHeight, width: kScreenWidth, height: 0.5))
            line.backgroundColor = kLineColor
            addSubview(btn)
            addSubview(line)
        }
        let btn = UIButton(title: "取消", titleColor: kRedColor)
        btn.frame = CGRect(x: 0, y: CGFloat(arr.count) * kModelViewCellHeight + 5, width: kScreenWidth, height: kModelViewCellHeight)
        btn.addTarget(self, action: "clickBtns:", forControlEvents: .TouchUpInside)
        btn.tag = arr.count
        addSubview(btn)
        
    }
    
    @objc
    private func clickBtns(sender:UIButton) {
        
        if let del = modalViewDelegate {
            del.clickBtnWithIndexAndView(sender.tag, arr:self.arr!)
        }
        
        dismiss()
    }
    
    @objc
    private func dismiss() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame.origin.y = kScreenHeight
            }, completion: { (finish) -> Void in
                self.dismissBtn.hidden = true
                self.dismissBtn.removeFromSuperview()
                self.hidden = true
                self.removeFromSuperview()
        })
    }
    
    func show() {
        let window = UIApplication.sharedApplication().keyWindow
        dismissBtn.addTarget(self, action: "dismiss", forControlEvents: .TouchUpInside)
        window?.addSubview(self)
        window?.insertSubview(dismissBtn, belowSubview: self)
        hidden = false
        dismissBtn.hidden = true
        UIView.animateWithDuration(0.5) {
            () -> Void in
            self.dismissBtn.hidden = false
            self.frame.origin.y = kScreenHeight - (CGFloat(self.arr!.count + 1) * kModelViewCellHeight + 5)
        }
    }
    
    /// 遮罩
    private var dismissBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        btn.backgroundColor = UIColor(white: 0, alpha: 0.2)
        return btn
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
