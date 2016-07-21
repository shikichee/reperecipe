//
//  AddRecipeModalViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/07.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import RealmSwift

class AddRecipeModalViewController: UIViewController{
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didTapAddImage(sender: AnyObject) {
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

extension AddRecipeModalViewController: UICollectionViewDelegate {
    
}
extension AddRecipeModalViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCellWithReuseIdentifier("IngredientCategoryCell", forIndexPath: indexPath) as! IngredientsCategoryCell
        
        cell.imageView.image = RecipeViewModel.categories()[indexPath.row].image
        cell.nameLabel.text = RecipeViewModel.categories()[indexPath.row].title
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecipeViewModel.categories().count
    }
}