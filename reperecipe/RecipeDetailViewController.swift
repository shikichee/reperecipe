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
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var refrigeratorLabel: UILabel!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        if let image = recipe.image {
            recipeImageView.image = image
        } else {
            recipeImageView.hidden = true
        }
        categoryImageView.image = RecipeViewModel.categories()[recipe.categoryId].image
        nameLabel.text = recipe.name
        
        ingredientLabel.text = recipeViewModel.ingredientNumberText
        refrigeratorLabel.text = recipeViewModel.refrigeratorNumberText
        
        memoTextView.text = recipe.memo
        
    }
    @IBAction func didTapStopButton(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }
    @IBAction func didTapEditButton(sender: AnyObject) {
    }
    
    var recipe: Recipe {
        get{
            return recipeViewModel.recipe
        }
        set{
            recipeViewModel = RecipeViewModel(recipe: newValue)
        }
    }
    private var recipeViewModel = RecipeViewModel(recipe: Recipe())
}

extension RecipeDetailViewController: UITableViewDelegate {
    
}
extension RecipeDetailViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.ingredients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.ingredientCellOfRecipeDetail.identifier) as! IngredientCellOfRecipeDetail
        let ingredient = recipe.ingredients[indexPath.row]
        cell.nameLabel.text = ingredient.name
        cell.quantityLabel.text = ingredient.quantityText
        if !ingredient.inRefrigerator {
            cell.refrigeratorImageView.alpha = 0.3
        }
        
        return cell
    }
}