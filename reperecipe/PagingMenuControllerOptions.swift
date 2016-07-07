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
    let shoppingController = ShoppingPagingViewController.instantiateFromStoryboard()
    return [myRecipeController, menuController, ingredientsController,shoppingController]
}
struct MenuItemMyRecipe: MenuItemViewCustomizable {}
struct MenuItemMenu: MenuItemViewCustomizable {}
struct MenuItemIngredients: MenuItemViewCustomizable {}
struct MenuItemShopping: MenuItemViewCustomizable {}

struct MenuOptions: MenuViewCustomizable {
    var itemsOptions: [MenuItemViewCustomizable] {
        return [MenuItemMyRecipe(), MenuItemMenu(), MenuItemIngredients(),MenuItemShopping()]
    }
    var displayMode: MenuDisplayMode {
        return .Infinite(widthMode: .Fixed(width: 125), scrollingMode: .ScrollEnabled)
    }
    
    var height: CGFloat {
        return 44
    }
    var focusMode: MenuFocusMode {
        return .Underline(height: 4, color: ReperecipeColor.Brand.orange, horizontalPadding: 10, verticalPadding: 0)
    }
    
    struct MenuItemMyRecipe: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "マイレシピ")
            return .Text(title: title)
        }
    }
    struct MenuItemMenu: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "献立")
            return .Text(title: title)
        }
    }
    struct MenuItemIngredients: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "食材")
            return .Text(title: title)
        }
    }
    struct MenuItemShopping: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "買い物")
            return .Text(title: title)
        }
    }
}

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
}


