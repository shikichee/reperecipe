//
//  refrigeratorPagingViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/04.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class RefrigeratorPagingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    class func instantiateFromStoryboard() -> RefrigeratorPagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! RefrigeratorPagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension RefrigeratorPagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientCell") as! IngredientCell
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
extension RefrigeratorPagingViewController: UITableViewDelegate {
    
}

