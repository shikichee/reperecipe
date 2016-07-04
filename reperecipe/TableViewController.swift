//
//  TableViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/02.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//extension TableViewController: UITableViewDataSource {
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
//        cell.numberLabel.text = (indexPath.row + 1).description
//        cell.customLabel.text = self.applications[indexPath.row]["title"]
//        cell.categoryLabel.text = self.applications[indexPath.row]["category"]
//        
//        let url = NSURL(string: self.applications[indexPath.row]["imageUrl"]!)
//        let req = NSURLRequest(URL:url!)
//        
//        NSURLConnection.sendAsynchronousRequest(req, queue:NSOperationQueue.mainQueue()){(res, data, err) in
//            let image = UIImage(data:data!)
//            cell.customImageView.image = image
//        }
//        
        
//        return nil
//    }
//}
