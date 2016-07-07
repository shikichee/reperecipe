//
//  RecipeCell.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/06.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet weak var recipeView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recipeView.layer.borderWidth = 1.0
        recipeView.layer.borderColor = ReperecipeColor.Line.normal.CGColor
        recipeView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        recipeView.layer.shadowOpacity = 0.5
        recipeView.layer.shadowRadius = 1.0
    }
}