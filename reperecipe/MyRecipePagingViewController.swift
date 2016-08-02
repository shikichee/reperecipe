//
//  MyRecipe.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/04.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import RealmSwift

class MyRecipePagingViewController: UIViewController {
    var recipes = [Recipe]()
    var recipe: Recipe?
    
    @IBOutlet var tableView: UITableView?
    
    class func instantiateFromStoryboard() -> MyRecipePagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! MyRecipePagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        recipes = MyRecipeRepository().getMyRecipe()
        self.tableView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapEditButton(sender: UIButton) {
        let firstButtonText = "レシピを新規作成"
        let secondButtonText = "献立を決める"
        
        let viewController = EditModalViewController.instantiate(sender)
        viewController.setButtonTitle(firstButtonText, secondButtonText: secondButtonText)
        
        let firstViewController = UIStoryboard(name: "AddRecipeModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("AddRecipeModal") as! AddRecipeModalViewController
        
        let secondViewController = UIStoryboard(name: "AddRecipeModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("AddRecipeModal") as! AddRecipeModalViewController
        
        viewController.setButtonTarget(firstViewController, secondViewController: secondViewController)
        
        presentViewController(viewController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRecipeDetail" {
            let recipeDetailViewController = segue.destinationViewController as! RecipeDetailViewController
            
            if recipe != nil {
                recipeDetailViewController.recipe = recipe!
            }
        }
    }
}

extension MyRecipePagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.recipeCell.identifier) as! RecipeCell
        let recipe = recipes[indexPath.row]
        
        cell.titleLabel?.text = recipe.name
        cell.recipeImageView.image = recipe.image
        cell.refrigeratorNumberLabel.text = String(recipe.refrigeratorNumber)
        cell.cookedNumberLabel.text = String(recipe.cookedNumber)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        recipe = recipes[indexPath.row]
        performSegueWithIdentifier("showRecipeDetail",sender: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
}
extension MyRecipePagingViewController: UITableViewDelegate {
    
}
