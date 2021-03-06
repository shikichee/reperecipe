//
//  ReperecipeService.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/19.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import Moya

enum ReperecipeService {
    case SearchIngredients(String)
}

extension ReperecipeService: TargetType {
    var baseURL: NSURL {
        return  NSURL(string: "http://localhost:8080/api/v1")!
    }
    
    var path: String {
        switch self {
        case .SearchIngredients(_):
            return "/ingredients/search"
        }
    }
    var method: Moya.Method {
        switch self {
        case .SearchIngredients:
            return .GET
        }
    }
    var parameters: [String: AnyObject]? {
        switch self {
        case .SearchIngredients(let text):
            return ["q": text]
        }
    }
    var sampleData: NSData {
        switch self {
        case .SearchIngredients(_):
            return "[{\"id\": \"1\",\"name\": \"イノシシ\",\"readingName\": [\"いのしし\"],\"category\": \"MEAT\"}".UTF8EncodedData
        }
    }
    
    var multipartBody: [Moya.MultipartFormData]? { return nil }
}
private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    var UTF8EncodedData: NSData {
        return self.dataUsingEncoding(NSUTF8StringEncoding)!
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString
}