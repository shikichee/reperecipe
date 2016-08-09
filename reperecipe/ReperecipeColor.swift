//
//  ReperecipeColor.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/03.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import HxColor

internal struct ReperecipeColor {
    
    struct Alpha {
        static let normal = CGFloat(0.3)
    }
    
    /// ブランドカラー
    struct Brand {
        /// オレンジ
        static let orange  = UIColor(0xFFB871)
    }
    
    struct Sub {
        //青
        static let blue = UIColor(0xB8DEFC)
        
        //濃い青
        static let blueDark = UIColor(0x5FA8E2)
        
        //黄色
        static let yellow = UIColor(0xFDDA7B)
        
        //濃い黄色
        static let yellowDark = UIColor(0xEBAA26)
        
        //赤
        static let red = UIColor(0xFFBFB1)
        
        //濃い赤
        static let redDark = UIColor(0xEA705C)
        
        //緑
        static let green = UIColor(0xBFE296)
        
        //濃い緑
        static let greenDark = UIColor(0x6EB441)
    }
    
    /// 文字色
    struct Text {
        /// メイン
        static let main = UIColor(0x49320a)
        
        /// 弱めテキストカラー
        static let sub   = UIColor(0xc4975c)
        
        /// 強調
        static let strong  = UIColor(0xff9022)
        
        /// アラート
        static let alert    = UIColor(0xff5555)
    }
    
    /// 線色
    struct Line {
        /// 通常
        static let normal = UIColor(0xcccccc)
    }
    
    /// 背景色
    struct Background {
        /// 背景白
        static let white   = UIColor(0xfffcf4)
        
        /// 背景オレンジ
        static let orange = UIColor(0xfff9eb)
        
    }
    
    
}