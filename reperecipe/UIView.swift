//
//  UIView.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/10.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

extension UIView {
    func topBottomBorder(borderWidth borderWidth: CGFloat, borderColor: UIColor?) {
        
        let topLine = CALayer()
        let bottomLine = CALayer()
        
        self.layer.sublayers = nil
        self.layer.masksToBounds = true
        
        topLine.backgroundColor = borderColor!.CGColor
        bottomLine.backgroundColor = borderColor!.CGColor
        
        topLine.frame = CGRectMake(0.0, 0.0, self.frame.width, borderWidth)
        self.layer.addSublayer(topLine)
        bottomLine.frame = CGRectMake(0.0, self.frame.height - borderWidth, self.frame.width, borderWidth)
        self.layer.addSublayer(bottomLine)
    }
}
