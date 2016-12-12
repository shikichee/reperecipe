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
    static let realm = try! Realm()
    
    dynamic var id = NSUUID().UUIDString
    dynamic var name = ""
    dynamic var categoryId = 0
    var ingredients = List<IngredientsOfRecipe>()
    dynamic var memo = ""
    dynamic var cookedNumber = 0
    dynamic var lastCookedDate =  NSDateZero
    dynamic private var _image: UIImage? = nil
    dynamic var image: UIImage? {
        set{
            self._image = newValue
            if let value = newValue {
                self.imageData = UIImagePNGRepresentation(value)
            }
        }
        get{
            if let image = self._image {
                return image
            }
            if let data = self.imageData {
                self._image = UIImage(data: data)
                return self._image
            }
            return nil
        }
    }
    dynamic private var imageData: NSData? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    override static func ignoredProperties() -> [String] {
        return ["image", "_image"]
    }

    func save() {
        try! Recipe.realm.write{
            Recipe.realm.add(self, update: true)
        }
    }
    func getRefrigeratorNumber() -> Int {
        return ingredients.filter { $0.inRefrigerator == true }.count
    }
    
    func getDaysFromLastCookedDate() -> Int {
        return  NSCalendar.currentCalendar().components(NSCalendarUnit.Day, fromDate: lastCookedDate, toDate: NSDate(), options: []).day
    }
}

class IngredientsOfRecipe: Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var quantityText = ""
    dynamic var inRefrigerator = false
    
    override static func ignoredProperties() -> [String] {
        return ["inRefrigerator"]
    }
}
