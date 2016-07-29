//
//  RefrigeratorModel.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/13.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation

class RefrigeratorModel {
    // A[1,2,3] - B[1] = C[2,3]
    static func subtractIngredients(subtractedElememt: [Ingredient], subtractElememt: [Ingredient]) -> [Ingredient] {
        var ingredients: [Ingredient] = []
        subtractedElememt.forEach { ingredient in
            if subtractElememt.indexOf(ingredient) == nil {
                ingredients.append(ingredient)
            }
        }
        return ingredients
    }

}