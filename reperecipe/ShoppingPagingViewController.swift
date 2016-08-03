//
//  ShoppingPagingViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/06.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class ShoppingPagingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    class func instantiateFromStoryboard() -> ShoppingPagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! ShoppingPagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: R.nib.shoppingSectionHeader.name, bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "ShoppingSectionHeader")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ShoppingPagingViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Here, we use NSFetchedResultsController
        // And we simply use the section name as title
//        let currSection = fetchedResultsController.sections?[section]
//        let title = currSection!.name
//        
        // Dequeue with the reuse identifier
        let cell = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier("ShoppingSectionHeader")
//        let header = cell as! ShoppingSectionHeader
//        header.titleLabel.text = title
        
        return cell
    }
}

extension ShoppingPagingViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell.
        
        return cell
    }
    

}