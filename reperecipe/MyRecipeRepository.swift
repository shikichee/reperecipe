//
//  MyRecipeRepository.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/07.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import RealmSwift

class MyRecipeRepository {
    
    func getMyRecipe() ->  [Recipe] {
        let realm = try! Realm()
        return Array(realm.objects(Recipe))
    }
    
    static func addMyRecipe(recipe: Recipe) {
        recipe.save()
    }
}
