//
//  IngredientsRepository.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/09.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import RealmSwift

class RefrigeratorRepository {
    
    func getIngredients() ->  [Ingredient] {
        let realm = try! Realm()
        return Array(realm.objects(Ingredient))
    }

    static func addIngredient(text: String) {
        let realm = try! Realm()
        try! realm.write {
            if let title: String = text {
                // Add recipe to Realm
                let ingredient = Ingredient()
                ingredient.name = title
                realm.add(ingredient)
            }
        }
    }
    
    static func addIngredients(ingredients: [Ingredient]) {
        let realm = try! Realm()
        try! realm.write {
            for ingredient in ingredients{
                if let title: String = ingredient.name {
                    // Add recipe to Realm
                    let ingredient = Ingredient()
                    ingredient.name = title
                    realm.add(ingredient)
                }
            }
        }
    }
    
    func deleteIngredients(ingredients: [Ingredient]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(ingredients)
        }
    }
}
