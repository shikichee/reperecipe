//
//  IntroductionViewModel.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/07.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class IntroductionViewModel {
    
    static func titles() -> [(id:Int, title:String, color: UIColor, tappedColor: UIColor, image:UIImage)] {
        return [
            (id:0, title:"冷蔵庫を確認", color: ReperecipeColor.Sub.blue , tappedColor:ReperecipeColor.Sub.blueDark, image: UIImage(named: "icon_refrigerator_wht")!),
            (id:1, title:"レシピを探す", color: ReperecipeColor.Sub.yellow, tappedColor:ReperecipeColor.Sub.yellowDark, image: UIImage(named: "icon_recipe_wht")!),
            (id:2, title:"買い物に行く", color: ReperecipeColor.Sub.red, tappedColor: ReperecipeColor.Sub.redDark, image: UIImage(named: "icon_shopping_wht")!),
            (id:3, title:"献立を決める", color: ReperecipeColor.Sub.green, tappedColor: ReperecipeColor.Sub.greenDark, image: UIImage(named: "icon_mealmenu_wht")!)
        ]
    }
}