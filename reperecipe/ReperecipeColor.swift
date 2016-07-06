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
    
    /// ブランドカラー
    struct Brand {
        /// オレンジ
        static let orange  = UIColor(0xff9022)
        
        /// 暗いオレンジ
        static let orangeDark = UIColor(0xd16605)
        
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
        static let white   = UIColor(0xffffff)
        
        /// 背景オレンジ
        static let orange = UIColor(0xfff9eb)
        
    }
    
    
}