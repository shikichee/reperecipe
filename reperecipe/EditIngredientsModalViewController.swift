//
//  EditIngredientsModalViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/12.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Moya
import Moya_ObjectMapper

class EditIngredientsModalViewController: UIViewController {
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var ingredientsNumberLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newIngredientTextField: UITextField!
    @IBOutlet weak var searchWordsTableView: UITableView!
    @IBOutlet weak var searchWordsTableViewHeight: NSLayoutConstraint!
    
    var dataSource: UITableViewDataSource!
    let provider = RxMoyaProvider<ReperecipeService>()
    var repos = [IngredientsResponse]()
    
    let bag   = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self.dataSource
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: "EditIngredientsCell", bundle: nil), forCellReuseIdentifier: "EditIngredientsCell")
        searchView.layer.borderColor = ReperecipeColor.Line.normal.CGColor
        searchView.layer.borderWidth = CGFloat(1)
        
//        searchWordsTableView.dataSource = SearchIngredientsTableView()
//        searchWordsTableView.delegate = SearchIngredientsTableView()
        searchWordsTableViewHeight.constant = CGFloat(0)
        
        // 検索に
        _ = newIngredientTextField.rx_text.debounce(0.5, scheduler: MainScheduler.instance).distinctUntilChanged().subscribeNext{ (text) in
            guard !text.isEmpty else {
                return
            }
            self.requestIngredientSearch(text)
        }
    }
    /// インクリメンタルサーチ
    func requestIngredientSearch(text: String) {
        self.provider.request(.SearchIngredients(text))
            .mapArray(IngredientsResponse)
            .subscribe { event -> Void in
                switch event {
                case .Next(let repos):
                    self.repos = repos
                    var names = Variable<[String]>([])
                    for index in self.repos {
                        names.value.append(index.name ?? "")
                    }
                    names.asDriver()
                        .drive(self.searchWordsTableView.rx_itemsWithCellIdentifier("SearchIngredientsCell",cellType: SearchIngredientsCell.self)) { _, name, cell -> Void in
                        cell.nameLabel?.text = name
                        }.addDisposableTo(self.bag)
                    print(repos)
                case .Error(let error):
                    print(error)
                default:
                    break
                }
        }
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