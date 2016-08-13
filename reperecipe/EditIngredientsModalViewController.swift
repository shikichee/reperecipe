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
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var ingredientsNumberLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newIngredientTextField: UITextField!
    
    var dataSource: UITableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self.dataSource
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: "EditIngredientsCell", bundle: nil), forCellReuseIdentifier: "EditIngredientsCell")
        searchView.layer.borderColor = ReperecipeColor.Line.normal.CGColor
        searchView.layer.borderWidth = CGFloat(1)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let ingredients = (tableView.dataSource as! EditIngredientsModalDataSource).ingredients

        ingredientsNumberLabel.text = String(ingredients.count)
        self.tableView.reloadData()
    }
    
    @IBAction func didTapAddIngredientButton(sender: AnyObject) {
        let ingredient = Ingredient()
        ingredient.name = self.newIngredientTextField.text!
        (tableView.dataSource as! EditIngredientsModalDataSource).ingredients.append(ingredient)
        newIngredientTextField.text = ""
        self.tableView.reloadData()
    }
    @IBAction func didTapSaveButton(sender: AnyObject) {
        let currentIngredients = RefrigeratorRepository().getIngredients()
        let editedIngreidents = (tableView.dataSource as! EditIngredientsModalDataSource).ingredients
        let deletedIngredients = RefrigeratorModel.subtractIngredients(currentIngredients, subtractElememt: editedIngreidents)
        let addedIngredients = RefrigeratorModel.subtractIngredients(editedIngreidents, subtractElememt: currentIngredients)
        
        //Delete and Add ingredients to Realm
        RefrigeratorRepository().deleteIngredients(deletedIngredients)
        RefrigeratorRepository.addIngredients(addedIngredients)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension EditIngredientsModalViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let ingredients = (tableView.dataSource as! EditIngredientsModalDataSource).ingredients
        ingredientsNumberLabel.text = String(ingredients.count)
    }
}

extension EditIngredientsModalViewController: UITextFieldDelegate {
    
}