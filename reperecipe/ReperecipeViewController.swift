//
//  ReperecipeViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/03.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class ReperecipeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//extension ReperecipeViewController: UITableViewDataSource {
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        //        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
//        //        cell.numberLabel.text = (indexPath.row + 1).description
//        //        cell.customLabel.text = self.applications[indexPath.row]["title"]
//        //        cell.categoryLabel.text = self.applications[indexPath.row]["category"]
//        //
//        //        let url = NSURL(string: self.applications[indexPath.row]["imageUrl"]!)
//        //        let req = NSURLRequest(URL:url!)
//        //
//        //        NSURLConnection.sendAsynchronousRequest(req, queue:NSOperationQueue.mainQueue()){(res, data, err) in
//        //            let image = UIImage(data:data!)
//        //            cell.customImageView.image = image
//        //        }
//        //        
//        
//        return nil
//    }
//}