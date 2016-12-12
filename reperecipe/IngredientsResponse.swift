//
//  IngredientsResponse.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/19.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import ObjectMapper

struct IngredientsResponse: Mappable {
    
    var id: String?
    var name: String?
    var readingName: [String]?
    var category: String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        readingName <- map["readingName"]
        category    <- map["category"]
    }
}