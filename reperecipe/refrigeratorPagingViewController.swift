//
//  refrigeratorPagingViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/04.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class RefrigeratorPagingViewController: UIViewController {
    var ingredients = [Ingredient]()
    
    @IBOutlet weak var tableView: UITableView!
    //冷蔵庫にある食材の個数
    @IBOutlet weak var numberLabel: UILabel!
    
    class func instantiateFromStoryboard() -> RefrigeratorPagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! RefrigeratorPagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        ingredients = RefrigeratorRepository().getIngredients()
        numberLabel.text = String(ingredients.count)
        self.tableView?.reloadData()
    }
    
    @IBAction func didTapEditButton(sender: UIButton) {
        
        let firstButtonText = "冷蔵庫に食材を追加・削除"
        let secondButtonText = "買う食材を追加・削除"
        
        let viewController = EditModalViewController.instantiate(sender)
        viewController.setButtonTitle(firstButtonText, secondButtonText: secondButtonText)
        
        let firstViewController = UIStoryboard(name: "EditIngredientsModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("EditIngredientsModal")
        
        let secondViewController = UIStoryboard(name: "EditIngredientsModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("EditIngredientsModal")
        
        viewController.setButtonTarget(firstViewController, secondViewController: secondViewController)
        
        presentViewController(viewController, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RefrigeratorPagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientCell") as! IngredientCell
        cell.nameLabel?.text = ingredients[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
}
extension RefrigeratorPagingViewController: UITableViewDelegate {
    
}

