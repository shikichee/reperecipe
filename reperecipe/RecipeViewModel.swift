//
//  RecipeViewModel.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/15.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class RecipeViewModel {
    static func categories() -> [(id:Int, title:String, image:UIImage)] {
        return [
            (id:0, title:"主菜", image: UIImage(named: "shushoku.png")!),
            (id:1, title:"副菜", image: UIImage(named: "shushoku.png")!),
            (id:2, title:"汁物", image: UIImage(named: "shushoku.png")!),
            (id:3, title:"デザート", image: UIImage(named: "shushoku.png")!),
            (id:4, title:"その他", image: UIImage(named: "shushoku.png")!)
        ]
    }
}
