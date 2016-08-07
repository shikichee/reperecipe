//
//  IntroductionViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/08.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.scrollEnabled = false
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
        return IntroductionViewModel.titles().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IntroductionCell") as! IntroductionCell
        
        cell.iconImageView.image = IntroductionViewModel.titles()[indexPath.row].image
        cell.navigationLabel?.text = IntroductionViewModel.titles()[indexPath.row].title
        return cell
    }
}

extension IntroductionViewController: UITableViewDelegate {

}