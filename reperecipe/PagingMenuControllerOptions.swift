//
//  PagingMenuControllerOptions.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/05.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import PagingMenuController

private var pagingControllers: [UIViewController] {
    let myRecipeController = MyRecipePagingViewController.instantiateFromStoryboard()
    let menuController = MenuPagingViewController.instantiateFromStoryboard()
    let ingredientsController = IngredientsPagingViewController.instantiateFromStoryboard()
    return [myRecipeController, menuController, ingredientsController]
}
struct MenuItemMyRecipe: MenuItemViewCustomizable {}
struct MenuItemMenu: MenuItemViewCustomizable {}
struct MenuItemIngredients: MenuItemViewCustomizable {}

struct MenuOptions: MenuViewCustomizable {
    var itemsOptions: [MenuItemViewCustomizable] {
        return [MenuItemMyRecipe(), MenuItemMenu(), MenuItemIngredients()]
    }
    var displayMode: MenuDisplayMode {
        return .Infinite(widthMode: .Fixed(width: 80), scrollingMode: .ScrollEnabled)
    }
    
    struct MenuItemMyRecipe: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "献立")
            return .Text(title: title)
        }
    }
    struct MenuItemMenu: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "マイレシピ")
            return .Text(title: title)
        }
    }
    struct MenuItemIngredients: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "食材")
            return .Text(title: title)
        }
    }
}

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
}


