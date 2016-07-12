//
//  EditIngredientsModalDataSource.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/12.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class EditIngredientsModalDataSource: NSObject, UITableViewDataSource {
    var ingredients = [Ingredient]()
    
    override init() {
        super.init()
        ingredients = RefrigeratorRepository().getIngredients()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("EditIngredientsCell") as! EditIngredientsCell
        cell.nameLabel?.text = ingredients[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
}