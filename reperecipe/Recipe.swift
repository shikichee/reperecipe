//
//  Recipe.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/02.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//
//
import Foundation
import UIKit
import RealmSwift
import ObjectMapper

class Recipe: Object {
    dynamic var id = NSUUID().UUIDString
    dynamic var title = ""
    let ingredients = List<IngredientsOfRecipe>()
    dynamic var memo = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class IngredientsOfRecipe: Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var quantityText = ""
}
