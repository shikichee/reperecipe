//
//  EditFoodsModalDataSource.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/12.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class EditFoodsModalDataSource: NSObject, UITableViewDataSource {
    var foods = [Food]()
    
    override init() {
        super.init()
        foods = RefrigeratorRepository().getFoods()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("EditFoodsCell") as! EditFoodsCell
        cell.nameLabel?.text = ingredients[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
}