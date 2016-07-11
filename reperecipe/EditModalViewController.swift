//
//  EditModalViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/11.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class EditModalViewController: UIViewController {
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    var firstButtonText:String?
    var secondButtonText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        firstButton.setTitle(firstButtonText, forState: .Normal)
        secondButton.setTitle(secondButtonText, forState: .Normal)
    }
    
    func setButtonTitle(firstButtonText: String, secondButtonText: String) {
        self.firstButtonText = firstButtonText
        self.secondButtonText = secondButtonText
    }
    
    static func instantiate(sourceView: UIView, sourceRect: CGRect? = nil) -> EditModalViewController {
        let viewController = UIStoryboard(name: "EditModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("EditModal") as!  EditModalViewController
        viewController.modalPresentationStyle = .Popover
        let size = viewController.view.frame.size
        viewController.preferredContentSize = CGSize(width: size.width, height: 165)
//        viewController.preferredContentSize = viewController.view.frame.size
        
        if let presentationController = viewController.popoverPresentationController {
            presentationController.permittedArrowDirections = .Down
            presentationController.sourceView = sourceView
            presentationController.sourceRect = sourceRect ?? sourceView.bounds
            presentationController.delegate = viewController
        }
        
        return viewController
    }
}
extension EditModalViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyleForPresentationController(_ : UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}