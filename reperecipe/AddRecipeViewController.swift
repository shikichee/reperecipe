//
//  AddRecipeViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/07.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import RealmSwift

class AddRecipeViewController: UIViewController{
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTabAddRecipe(sender: AnyObject) {
        MyRecipeManager.addMyRecipe(titleTextField.text!)
        self.dismissViewControllerAnimated(true, completion: nil)

    }
}
