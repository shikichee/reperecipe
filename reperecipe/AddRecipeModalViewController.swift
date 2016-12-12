//
//  AddRecipeModalViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/07.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import RealmSwift
import Toucan
import ActionSheetPicker_3_0

class AddRecipeModalViewController: UIViewController{
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleBarLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryBarLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!

    
    @IBOutlet weak var ingredientBarLabel: UILabel!
    
    @IBOutlet weak var searchIngredientVIew: UIView!
    @IBOutlet weak var ingredientSearchTextField: UITextField!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var ingredientTableViewHeight: NSLayoutConstraint!
  
    @IBOutlet weak var memoBarLabel: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBOutlet weak var imageBarLabel: UILabel!
    @IBOutlet weak var imageEditVIew: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var image: UIImage!
    var categoryId: Int = 0
    var ingredients = [IngredientsOfRecipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        ingredientTableView.registerNib(UINib(nibName: "IngredientCellOfRecipe", bundle: nil), forCellReuseIdentifier: "IngredientCellOfRecipe")
        
        categoryView.userInteractionEnabled = true
        categoryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCategoryView(_:))))
        imageEditVIew.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapAddImage(_:))))
        
        searchIngredientVIew.layer.borderColor = ReperecipeColor.Line.normal.CGColor
        
        searchIngredientVIew.layer.borderWidth = 1.0
        
        // ボタンのタップされた際の画像差し替え
        saveButton.setBackgroundImage(R.image.btn_main_tapped(), forState: .Highlighted)
        cancelButton.setBackgroundImage(R.image.btn_sub_tapped(), forState: .Highlighted)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        titleBarLabel.topBottomBorder(borderWidth: 1.0, borderColor: ReperecipeColor.Line.normal)
        categoryBarLabel.topBottomBorder(borderWidth: 1.0, borderColor: ReperecipeColor.Line.normal)
        ingredientBarLabel.topBottomBorder(borderWidth: 1.0, borderColor: ReperecipeColor.Line.normal)
        memoBarLabel.topBottomBorder(borderWidth: 1.0, borderColor: ReperecipeColor.Line.normal)
        imageBarLabel.topBottomBorder(borderWidth: 1.0, borderColor: ReperecipeColor.Line.normal)
    }
    
    func didTapCategoryView(sender: UITapGestureRecognizer) {
        ActionSheetStringPicker.showPickerWithTitle("Nav Bar From Picker", rows: ["One", "Two", "A lot"], initialSelection: 1, doneBlock: {
            picker, value, index in
            
            print("value = \(value)")
            print("index = \(index)")
            print("picker = \(picker)")
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    func didTapAddImage(sender: AnyObject) {
        let actionSheet = UIAlertController(title:"写真", message: "取得方法を選択", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let actionCancel = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.Cancel, handler: {action in
            //nothing
        })
        let actionNormal1 = UIAlertAction(title: "アルバムから選ぶ", style: UIAlertActionStyle.Default, handler: {action in
            let imagePickerVc = UIImagePickerController()
            imagePickerVc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePickerVc.delegate = self
            self.presentViewController(imagePickerVc, animated: true, completion: nil)
        })
        let actionNormal2 = UIAlertAction(title: "写真を撮る", style: UIAlertActionStyle.Default, handler: {action in
            let imagePickerVc = UIImagePickerController()
            imagePickerVc.sourceType = UIImagePickerControllerSourceType.Camera
            imagePickerVc.delegate = self
            self.presentViewController(imagePickerVc, animated: true, completion: nil)
        })
        actionSheet.addAction(actionCancel)
        actionSheet.addAction(actionNormal1)
        actionSheet.addAction(actionNormal2)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    @IBAction func didTapAddIngredientButton(sender: AnyObject) {
        if let ingredient = ingredientSearchTextField.text {
            let ing = IngredientsOfRecipe()
            ing.name = ingredient
            let iP = NSIndexPath(forItem: ingredients.count, inSection: 0)
            ingredients.append(ing)
            
            ingredientTableViewHeight.constant = CGFloat(80 * ingredients.count)
            viewHeight.constant = viewHeight.constant + 80
            
            ingredientTableView.insertRowsAtIndexPaths([iP], withRowAnimation: UITableViewRowAnimation.Fade)
            ingredientTableView.reloadData()
        }
    }
    
    @IBAction func didTapSaveButton(sender: AnyObject) {
        let recipe = Recipe()
        recipe.name = titleTextField.text!
        if let _ = image {
            recipe.image = Toucan(image: image).resize(CGSize(width: 400, height: 400), fitMode: Toucan.Resize.FitMode.Crop).image
        }
        recipe.categoryId = categoryId
        recipe.memo = memoTextView.text!
        ingredients.forEach{
            recipe.ingredients.append($0)
        }
        
        MyRecipeRepository.addMyRecipe(recipe)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
  
}

extension AddRecipeModalViewController: UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.dismissViewControllerAnimated(true, completion: nil)
        let _image = info[UIImagePickerControllerOriginalImage] as! UIImage
        previewImageView.image = _image
        image = _image
    }
}
extension AddRecipeModalViewController: UINavigationControllerDelegate {

}

//extension AddRecipeModalViewController: UICollectionViewDelegate {
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//        let returnSize = CGSize(width: view.frame.width/6, height: 120)
//        
//        return returnSize
//    }
//    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        for i in 0..<RecipeViewModel.categories().count {
//            let iP = NSIndexPath(forItem: i, inSection: 0)
//            let cell = collectionView.cellForItemAtIndexPath(iP) as! IngredientsCategoryCell
//            
//            if iP != indexPath {
//                //選択されたセル以外のセル
//                cell.imageView.alpha = 0.3
//            } else {
//                cell.imageView.alpha = 1.0
//                categoryId = cell.id
//            }
//        }
//        
//    }
//}
//}
//extension AddRecipeModalViewController: UICollectionViewDataSource {
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = categoryCollectionView.dequeueReusableCellWithReuseIdentifier("IngredientCategoryCell", forIndexPath: indexPath) as! IngredientsCategoryCell
//        
//        cell.id = RecipeViewModel.categories()[indexPath.row].id
//        cell.imageView.image = RecipeViewModel.categories()[indexPath.row].image
//        cell.nameLabel.text = RecipeViewModel.categories()[indexPath.row].title
//        
//        return cell
//    }
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return RecipeViewModel.categories().count
//    }
//}

extension AddRecipeModalViewController: UITableViewDelegate {
    
}
extension AddRecipeModalViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ingredientTableView.dequeueReusableCellWithIdentifier("IngredientCellOfRecipe") as! IngredientCellOfRecipe
        
        cell.nameLabel?.text = ingredients[indexPath.row].name

        cell.deleteAction =  {
            self.ingredients.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.ingredientTableViewHeight.constant = self.ingredientTableViewHeight.constant - 80
            self.viewHeight.constant = self.viewHeight.constant - 80
            tableView.reloadData()
        }
        
        return cell
    }
    
}