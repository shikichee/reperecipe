//
//  ViewController.swift
//  reperecipe
//
//  Created by 敷地琢也 on 2016/06/26.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import PageMenu

class ViewController: UIViewController {

    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - UI Setup
        
        self.title = "リピレシピ"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        var controller1 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller1.title = "レシピ"
        controllerArray.append(controller1)
        
        var controller2 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller2.title = "冷蔵庫"
        controllerArray.append(controller2)
        
        var controller3 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller3.title = "買う物リスト"
        controllerArray.append(controller3)
        
        var controller4 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller4.title = "献立"
        controllerArray.append(controller4)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(ReperecipeColor.Background.white),
            .ViewBackgroundColor(ReperecipeColor.Background.white),
            .SelectionIndicatorColor(ReperecipeColor.Brand.orange),
            .BottomMenuHairlineColor(ReperecipeColor.Line.normal),
            .SelectedMenuItemLabelColor(ReperecipeColor.Text.strong),
            .MenuItemWidth(CGFloat(50)),
            .UnselectedMenuItemLabelColor(ReperecipeColor.Text.strong.alpha(0.5)),
            .MenuItemFont(UIFont(name: "HiraKakuProN-W3", size: 24.0)!),
            .MenuHeight(80.0),
            .MenuItemWidth(90.0),
            .CenterMenuItems(true)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

