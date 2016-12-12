//
//  Ingredient.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/09.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import RealmSwift

class Ingredient: Object {
    dynamic var id = NSUUID().UUIDString
    dynamic var name = ""
    dynamic var category = ""
    var readingName = List<ReadingIngredientName>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class ReadingIngredientName: Object {
    dynamic var name = ""
}