//
//  IngredientCellOfRecipe.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/25.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class IngredientCellOfRecipe: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var memoTextField: UITextField!
    
    var deleteAction: () -> () = {
    }
 
    @IBAction func didTapDeleteButton(sender: AnyObject) {
        self.deleteAction()
    }
}