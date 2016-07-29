//
//  EditIngredientsCell.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/12.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class EditIngredientsCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
 
    var deleteAction: () -> () = {
    }
    
    @IBAction func didTapDeleteButton() {
        self.deleteAction()
    }
}
