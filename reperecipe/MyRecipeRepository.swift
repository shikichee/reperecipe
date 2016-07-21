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
    
    static func addMyRecipe(name: String, image: UIImage, memo: String) {
        if let title: String = name {
                // Add recipe to Realm
                let recipe = Recipe()
                recipe.name = title
                recipe.image = image
                recipe.memo = memo
                recipe.save()
        }
    }
}
