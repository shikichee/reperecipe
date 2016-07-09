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
}

extension MyRecipePagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as! RecipeCell
        
        cell.titleLabel?.text = recipes[indexPath.row].title
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
}
extension MyRecipePagingViewController: UITableViewDelegate {
    
}
