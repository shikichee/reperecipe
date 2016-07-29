//
//  EditIngredientsModalViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/12.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class EditIngredientsModalViewController: UIViewController {
    
    @IBOutlet weak var ingredientsNumberLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newIngredientTextField: UITextField!
    
    var dataSource: UITableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self.dataSource
        tableView.registerNib(UINib(nibName: "EditIngredientsCell", bundle: nil), forCellReuseIdentifier: "EditIngredientsCell")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var ingredients = (tableView.dataSource as! EditIngredientsModalDataSource).ingredients


        ingredientsNumberLabel.text = String(ingredients.count)
        self.tableView.reloadData()
    }
    
    @IBAction func didTapAddIngredientButton(sender: AnyObject) {
        RefrigeratorRepository.addIngredient(self.newIngredientTextField.text!)
        self.tableView.reloadData()
    }
}

extension EditIngredientsModalViewController: UITableViewDelegate {
    
}