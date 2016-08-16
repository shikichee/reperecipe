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
    var realmToken: NotificationToken?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    
    class func instantiateFromStoryboard() -> MyRecipePagingViewController {
        let storyboard = R.storyboard.pagingViewController()
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! MyRecipePagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView!.registerNib(R.nib.recipeCell(), forCellReuseIdentifier: R.reuseIdentifier.recipeCell.identifier)
        updateTitleLabel()
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
    
    func updateTitleLabel() {
        let realm = try! Realm()
        realmToken = realm.objects(Recipe).addNotificationBlock { (change) in
            self.recipes = MyRecipeRepository().getMyRecipe()
            self.recipeTitleLabel.text = R.string.localizable.recipeLabelTitle(self.recipes.count.description)
            self.tableView!.reloadData()
        }
    }
    deinit {
        realmToken?.stop()
    }
}

extension MyRecipePagingViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.recipeCell.identifier) as! RecipeCell
        let recipe = recipes[indexPath.row]
        
        cell.titleLabel?.text = recipe.name
        cell.recipeImageView.image = recipe.image
        cell.refrigeratorNumberLabel.text = recipe.getRefrigeratorNumber().description
        cell.cookedNumberLabel.text = recipe.cookedNumber.description
//        cell.lastCookedLabel.text = recipe.lastCookedDate ?? "-"
//        getDaysFromLastCookedDate().description ?? "-"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        recipe = recipes[indexPath.row]
        performSegueWithIdentifier("showRecipeDetail",sender: nil)
    }
}
extension MyRecipePagingViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section != 0 ? CGFloat(10) : 0
    }
}
