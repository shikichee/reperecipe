
//  ViewController.swift
//  reperecipe
//
//  Created by 敷地琢也 on 2016/06/26.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import PagingMenuController

class ViewController: UIViewController {
    var options: PagingMenuControllerCustomizable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        options = PagingMenuOptions()
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.setup(options)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: PagingMenuControllerDelegate {
    
}