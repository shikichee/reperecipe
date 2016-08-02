//
//  Menu.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/02.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import RealmSwift

class Menu: Object {
    dynamic var id = ""
    dynamic var date = NSDate(timeIntervalSince1970: 0)
    var recipe = List<Recipe>()
}
