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
    
    static func pagingLabels() -> [(id:Int, title:String, image: UIImage)] {
        return [
            (id:0, title:"何からはじめますか？", image: UIImage(named:"img_logo")!),
            (id:1, title:"まずは冷蔵庫の中身をメモしましょう！", image: UIImage(named:"img_refrigerator_main")!),
            (id:2, title:"持ってる食材からすぐ作れるレシピが\nほげほげほげほげほ", image: UIImage(named:"img_recipe_main")!),
            (id:3, title:"足りない食材だけピックアップ！\n買ったものは冷蔵庫リストに自動で保存！", image: UIImage(named:"img_shopping_main")!),
            (id:4, title:"毎日の献立もよく作るレシピ、最後に作ったレシピが記録されますほげほげ", image: UIImage(named:"img_mealmenu_main")!)

        ]
    }
}