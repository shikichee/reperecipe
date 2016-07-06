//
//  MyRecipe.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/04.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class MyRecipePagingViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    class func instantiateFromStoryboard() -> MyRecipePagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! MyRecipePagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ReperecipeColor.Background.orange
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyRecipePagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as! RecipeCell
        
        cell.titleLabel.text = "カレーライス"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
extension MyRecipePagingViewController: UITableViewDelegate {
    
}
