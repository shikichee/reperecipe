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
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
        updateIngredientsInRefrigerator()
    }
    
    static func categories() -> [(id:Int, title:String, image:UIImage)] {
        return [
            (id:0, title:"主菜", image: UIImage(named: "shushoku.png")!),
            (id:1, title:"副菜", image: UIImage(named: "shushoku.png")!),
            (id:2, title:"汁物", image: UIImage(named: "shushoku.png")!),
            (id:3, title:"デザート", image: UIImage(named: "shushoku.png")!),
            (id:4, title:"その他", image: UIImage(named: "shushoku.png")!)
        ]
    }
    
    /// 材料(数)
    var ingredientNumberText: String {
        return R.string.localizable.recipeLabelIngredient(recipe.ingredients.count.description)
    }
    
    /// 冷蔵庫にある材料(数)
    var refrigeratorNumberText: String {
        return R.string.localizable.refrigeratorLabelIngredient(recipe.ingredients.count.description)
    }
    
    func updateIngredientsInRefrigerator() {
        let ingredinets = RefrigeratorRepository().getIngredients()
        recipe.ingredients.forEach { ingredient in
            if let _ = ingredinets.indexOf({$0.id == ingredient.id}) {
                //レシピ中の持っている材料
                ingredient.inRefrigerator = true
            }
        }
    }
    
}
