//
//  IntroductionViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/08.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
     let navigationLabels = ["レシピをみる", "冷蔵庫ををみる", "買い物に行く", "献立を決める"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMenu" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let secondViewController = segue.destinationViewController as! ViewController
                
                secondViewController.currentPage = indexPath.row
            }
        }
    }
    
    
}

extension IntroductionViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigationLabels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IntroductionCell") as! IntroductionCell
        
        cell.navigationLabel?.text = navigationLabels[indexPath.row]
        return cell
    }
}

extension IntroductionViewController: UITableViewDelegate {

}