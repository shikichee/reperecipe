//
//  MenuPagingViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/04.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class MenuPagingViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    private var sections: [(title: String, details: [Recipe], extended: Bool)] = []
    
    class func instantiateFromStoryboard() -> MenuPagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! MenuPagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapEditButton(sender: UIButton) {
        let firstButtonText = "献立を決める"
        let secondButtonText = "作った献立を記録"
        
        let viewController = EditModalViewController.instantiate(sender)
        viewController.setButtonTitle(firstButtonText, secondButtonText: secondButtonText)
        
        let firstViewController = UIStoryboard(name: "AddRecipeModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("AddMenuModal") as! AddRecipeModalViewController
        
        let secondViewController = UIStoryboard(name: "AddRecipeModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("AddRecipeModal") as! AddRecipeModalViewController
        
        viewController.setButtonTarget(firstViewController, secondViewController: secondViewController)
        
        presentViewController(viewController, animated: true, completion: nil)
    }
    
}

extension MenuPagingViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as? MenuCustomHeaderFooterView
        if cell == nil {
            cell = MenuCustomHeaderFooterView(reuseIdentifier: "Header")
            cell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader(_:))))
        }
        cell!.textLabel!.text = self.sections[section].title
        cell!.section = section
        cell!.setExpanded(self.sections[section].extended)
        return cell
    }
    
    func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? MenuCustomHeaderFooterView else {
            return
        }
        
        let extended = self.sections[cell.section].extended
        self.sections[cell.section].extended = !extended
        menuTableView.reloadSections(NSIndexSet(index: cell.section), withRowAnimation: .None)
    }
}

extension MenuPagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.recipeCell.identifier) as! RecipeCell
        
        let recipe = self.sections[indexPath.section].details[indexPath.row]
        
        cell.titleLabel?.text = recipe.name
        cell.recipeImageView.image = recipe.image
        cell.refrigeratorNumberLabel.text = recipe.getRefrigeratorNumber().description
        cell.cookedNumberLabel.text = recipe.cookedNumber.description
        cell.lastCookedLabel.text = recipe.getDaysFromLastCookedDate().description
        
        return cell
    }
}
