//
//  RecipeDetailViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/14.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailViewController: UIViewController {
    var ingredients = [Ingredient]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension RecipeDetailViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientOfRecipeCell") as! IngredientOfRecipeCell
        cell.nameLabel.text = ingredients[indexPath.row].name
        
        
        
        return cell
    }
}