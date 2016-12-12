//
//  SearchIngredientsTableViewDataSource.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/25.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

//import Foundation
//import UIKit
//
//class SearchIngredientsTableView: NSObject {
//    var searchIngredients = [Ingredient]()
//    
//    override init() {
//        super.init()
//    }
//}
//extension SearchIngredientsTableView: UITableViewDataSource {
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("SearchIngredientsCell") as! EditIngredientsCell
//        cell.nameLabel?.text = searchIngredients[indexPath.row].name
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return searchIngredients.count
//    }
//}
//extension SearchIngredientsTableView: UITableViewDelegate {
//    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        
////        let ingredients = (tableView.dataSource as! EditIngredientsModalDataSource).ingredients
////        ingredientsNumberLabel.text = String(ingredients.count)
//    }
//}