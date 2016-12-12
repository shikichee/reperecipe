
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
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "リピレシピ"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        options = PagingMenuOptions()
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.setup(options)
        pagingMenuController.moveToMenuPage(currentPage, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: PagingMenuControllerDelegate {
//    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
//        switch menuController.self {
//            case is MyRecipePagingViewController:
//                self.title = "レシピをみる"
//            case is IngredientsPagingViewController:
//                self.title = "冷蔵庫をみる"
//            case is ShoppingPagingViewController:
//                self.title = "買い物に行く"
//            case is MenuPagingViewController:
//                self.title = "献立を決める"
//            default:
//                self.title = "リピレシピ"
//            
//        }
//    }
}