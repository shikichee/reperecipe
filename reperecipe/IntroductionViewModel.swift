//
//  IntroductionViewModel.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/07.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class IntroductionViewModel {
    
    static func titles() -> [(id:Int, title:String, color: UIColor, image:UIImage)] {
        return [
            (id:0, title:"冷蔵庫を確認", color: ReperecipeColor.Sub.blue , image: UIImage(named: "icon_refrigerator_blu")!),
            (id:1, title:"レシピを探す", color: ReperecipeColor.Sub.yellow, image: UIImage(named: "icon_recipe_yel")!),
            (id:2, title:"買い物に行く", color: ReperecipeColor.Sub.red,image: UIImage(named: "icon_shopping_red")!),
            (id:3, title:"献立を決める", color: ReperecipeColor.Sub.green, image: UIImage(named: "icon_mealmenu_grn")!)
        ]
    }
}