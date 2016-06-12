//
//  UIButton+Extension.swift
//  yzbd
//
//  Created by Romeo on 15/9/5.
//  Copyright © 2015年 it. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title: String, titleColor: UIColor = kNormalColor, backColor: UIColor = kWhiteColor) {
        self.init()
        setTitle(title, forState: UIControlState.Normal)
        setTitleColor(titleColor, forState: UIControlState.Normal)
        backgroundColor = backColor
    }
    convenience init(backgroudImageName: String) {
        self.init()
        
        setBackgroundImage(UIImage(named: backgroudImageName), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: backgroudImageName + "_highlighted"), forState: UIControlState.Highlighted)
        
        sizeToFit()
    }
    /// 便利构造函数
    ///
    /// - parameter title:     title
    /// - parameter imageName: imageName
    /// - parameter color:     color
    /// - parameter fontSize:  fontSize
    ///
    /// - returns: UIButton
    convenience init(title: String, imageName: String, color: UIColor, fontSize: CGFloat) {
        self.init()
        
        setTitle(title, forState: UIControlState.Normal)
        setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        setTitleColor(color, forState: UIControlState.Normal)
        
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)
    }
    
    /// 便利构造函数
    ///
    /// - parameter title:     title
    /// - parameter fontSize:  fontSize
    /// - parameter color:     color
    /// - parameter backColor: backColor 背景颜色
    ///
    /// - returns: UIButton
    convenience init(title: String, fontSize: CGFloat, color: UIColor = UIColor.whiteColor(), backColor: UIColor = UIColor.darkGrayColor()) {
        self.init()
        
        setTitle(title, forState: UIControlState.Normal)
        titleLabel?.font = UIFont.systemFontOfSize(fontSize)

        setTitleColor(color, forState: UIControlState.Normal)
        backgroundColor = backColor
    }
    
    /// 便利构造函数
    ///
    /// - parameter imageName: imageName
    ///
    /// - returns: UIButton
    convenience init(imageName: String) {
        self.init()
        
        setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        
        sizeToFit()
    }
    
    
    convenience init(title: String, backgroudImageName: String, color: UIColor, font: UIFont) {
        self.init()
        
        setTitle(title, forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: backgroudImageName), forState: UIControlState.Normal)
        setTitleColor(color, forState: UIControlState.Normal)
        
        titleLabel?.font = font
    }
    
    
}
