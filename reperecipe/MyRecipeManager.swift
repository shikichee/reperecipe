//
//  MyRecipeManager.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/07.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import RealmSwift

class MyRecipeManager {
    
    func getMyRecipe() ->  [Recipe] {
        let realm = try! Realm()
        return Array(realm.objects(Recipe))
    }
    
    static func addMyRecipe(text: String) {
        let realm = try! Realm()
        try! realm.write {
            if let title: String = text {
                // Add recipe to Realm
                let recipe = Recipe()
                recipe.title = title
                realm.add(recipe)
            }
        }
    }
}
