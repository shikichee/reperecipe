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
    let refrigeratorController = RefrigeratorPagingViewController.instantiateFromStoryboard()
    let myRecipeController = MyRecipePagingViewController.instantiateFromStoryboard()
    let shoppingController = ShoppingPagingViewController.instantiateFromStoryboard()
    let menuController = MenuPagingViewController.instantiateFromStoryboard()
    return [refrigeratorController, myRecipeController, shoppingController, menuController]
}

struct MenuItemRefrigerator: MenuItemViewCustomizable {}
struct MenuItemMyRecipe: MenuItemViewCustomizable {}
struct MenuItemShopping: MenuItemViewCustomizable {}
struct MenuItemMenu: MenuItemViewCustomizable {}

struct MenuOptions: MenuViewCustomizable {
    var itemsOptions: [MenuItemViewCustomizable] {
        return [MenuItemRefrigerator(), MenuItemMyRecipe(), MenuItemShopping(), MenuItemMenu()]
    }
    var displayMode: MenuDisplayMode {
        return .Infinite(widthMode: .Fixed(width: 125), scrollingMode: .PagingEnabled)
    }
    
    var height: CGFloat {
        return 44
    }
    var focusMode: MenuFocusMode {
        return .Underline(height: 4, color: ReperecipeColor.Brand.orange, horizontalPadding: 10, verticalPadding: 0)
    }
    struct MenuItemRefrigerator: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "冷蔵庫")
            return .Text(title: title)
        }
    }
    struct MenuItemMyRecipe: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "レシピ")
            return .Text(title: title)
        }
    }
    struct MenuItemShopping: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "買い物")
            return .Text(title: title)
        }
    }
    struct MenuItemMenu: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "献立")
            return .Text(title: title)
        }
    }
}

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
}


