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
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return IntroductionViewModel.titles().count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IntroductionCell") as! IntroductionCell
        
        cell.iconImageView.image = IntroductionViewModel.titles()[indexPath.section].image
        cell.navigationLabel?.text = IntroductionViewModel.titles()[indexPath.section].title
        
//        タップされた際の色の設定
        let selectedView = UIView()
        selectedView.backgroundColor = IntroductionViewModel.titles()[indexPath.section].tappedColor
        cell.selectedBackgroundView =  selectedView
        
        return cell
    }

}

extension IntroductionViewController: UITableViewDelegate {

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = IntroductionViewModel.titles()[indexPath.section].color
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section != 0 ? CGFloat(3) : 0
    }
}