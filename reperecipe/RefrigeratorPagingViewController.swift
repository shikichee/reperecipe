//
//  refrigeratorPagingViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/04.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit
import RealmSwift

class RefrigeratorPagingViewController: UIViewController {
    var ingredients = [Ingredient]()
    var realmToken: NotificationToken?
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    //冷蔵庫にある食材の個数
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    class func instantiateFromStoryboard() -> RefrigeratorPagingViewController {
        let storyboard = UIStoryboard(name: "PagingViewController", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(self)) as! RefrigeratorPagingViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let realm = try! Realm()
        realmToken = realm.objects(Ingredient).addNotificationBlock { (change) in
            self.ingredients = RefrigeratorRepository().getIngredients()
            self.numberLabel.text = R.string.localizable.refrigeratorLabelIngredient(self.ingredients.count.description)
            self.tableView.reloadData()
        }
        
        // 右下のボタンが押された時、色を変更
        editButton.setBackgroundImage(R.image.btn_function_tapped(), forState: .Highlighted)
        editButton.setImage(R.image.icon_refrigerator_wht(), forState: .Highlighted)
        
        tableView.backgroundColor = ReperecipeColor.Background.white
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    deinit {
        realmToken?.stop()
    }
    
    @IBAction func didTapEditButton(sender: UIButton) {
    
        let firstButtonText = "冷蔵庫に食材を追加・削除"
        let secondButtonText = "買う食材を追加・削除"
        
        let viewController = EditModalViewController.instantiate(sender)
        viewController.setButtonTitle(firstButtonText, secondButtonText: secondButtonText)
        
        let firstViewController = UIStoryboard(name: "EditIngredientsModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("EditIngredientsModal") as! EditIngredientsModalViewController
        
        firstViewController.dataSource = EditIngredientsModalDataSource()
        
        let secondViewController = UIStoryboard(name: "EditIngredientsModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("EditIngredientsModal")
        
        viewController.setButtonTarget(firstViewController, secondViewController: secondViewController)
        
        presentViewController(viewController, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RefrigeratorPagingViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return ingredients.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IngredientCell") as! IngredientCell
        cell.nameLabel?.text = ingredients[indexPath.row].name
        
        cell.layer.borderColor = ReperecipeColor.Line.normal.CGColor
        cell.layer.borderWidth = CGFloat(1)
        
        return cell
    }

}
extension RefrigeratorPagingViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section != 0 ? CGFloat(10) : 0
    }
}

