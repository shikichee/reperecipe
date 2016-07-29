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
    var recipe = Recipe()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapStopButton(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }
}

extension RecipeDetailViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.ingredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientOfRecipeCell") as! IngredientOfRecipeCell
        cell.nameLabel.text = recipe.ingredients[indexPath.row].name
     
        return cell
    }
}