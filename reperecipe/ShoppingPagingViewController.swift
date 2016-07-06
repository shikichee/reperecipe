//
//  ShoppingPagingViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/06.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class ShoppingPagingViewController: UIViewController {
    
    class func instantiateFromStoryboard() -> ShoppingPagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! ShoppingPagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
