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
}

extension MyRecipePagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as! RecipeCell
        
        cell.titleLabel?.text = recipes[indexPath.row].name
        cell.recipeImageView.image = recipes[indexPath.row].image
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
}
extension MyRecipePagingViewController: UITableViewDelegate {
    
}
