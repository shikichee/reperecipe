//
//  IngredientCellOfRecipeDetail.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/28.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

protocol InputTextTableCellDelegate {
    func textFieldDidEndEditing(cell: IngredientCellOfRecipeDetail, value: NSString) -> ()
}

class IngredientCellOfRecipeDetail: UITableViewCell {
    
    var delegate: InputTextTableCellDelegate! = nil
    
    @IBOutlet weak var refrigeratorImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
}

extension IngredientCellOfRecipeDetail: UITextFieldDelegate {
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    internal func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    internal func textFieldDidEndEditing(textField: UITextField) {
        self.delegate.textFieldDidEndEditing(self, value: textField.text!)
    }
}