//
//  EditModalViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/11.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

private enum ButtonOrder: Int {
    case First  = 0
    case Second = 1
}

class EditModalViewController: UIViewController {

    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    var firstButtonText: String?
    var secondButtonText: String?
    
    var firstViewController: UIViewController!
    var secondViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        firstButton.setTitle(firstButtonText, forState: .Normal)
        secondButton.setTitle(secondButtonText, forState: .Normal)
        
        firstButton.setBackgroundImage(R.image.btn_main_tapped(), forState: .Highlighted)
        secondButton.setBackgroundImage(R.image.btn_sub_tapped(), forState: .Highlighted)
        
        firstButton.tag = ButtonOrder.First.rawValue
        secondButton.tag = ButtonOrder.Second.rawValue

    }
    
    override func viewDidAppear(animated: Bool) {
        firstButton.addTarget(self, action: #selector(didTapButton(_:)), forControlEvents: .TouchUpInside)
        secondButton.addTarget(self, action: #selector(didTapButton(_:)), forControlEvents: .TouchUpInside)
    }
    
    func setButtonTitle(firstButtonText: String, secondButtonText: String) {
        self.firstButtonText = firstButtonText
        self.secondButtonText = secondButtonText
    }
    
    func setButtonTarget(firstViewController: UIViewController, secondViewController: UIViewController) {
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        
        self.firstViewController.modalPresentationStyle = .Custom
        self.firstViewController.transitioningDelegate = self
        self.secondViewController.modalPresentationStyle = .Custom
        self.secondViewController.transitioningDelegate = self
        
    }
    
    func didTapButton(sender: UIButton) {
        switch  sender.tag {
        case ButtonOrder.First.rawValue:
            self.presentViewController(firstViewController, animated: true, completion: {
            })
        case ButtonOrder.Second.rawValue:
            self.presentViewController(secondViewController, animated: true, completion: nil)
        default:
            break
        }
    }
    
    static func instantiate(sourceView: UIView, sourceRect: CGRect? = nil) -> EditModalViewController {
        let viewController = UIStoryboard(name: "EditModalViewController", bundle: nil).instantiateViewControllerWithIdentifier("EditModal") as!  EditModalViewController
        viewController.modalPresentationStyle = .Popover
        let size = viewController.view.frame.size
        viewController.preferredContentSize = CGSize(width: size.width, height: 140)
        
        if let presentationController = viewController.popoverPresentationController {
            presentationController.permittedArrowDirections = .Down
            presentationController.sourceView = sourceView
            presentationController.sourceRect = sourceRect ?? sourceView.bounds
            presentationController.delegate = viewController
            presentationController.backgroundColor = UIColor.whiteColor()
        }
                
        return viewController
    }
}

extension EditModalViewController: UIViewControllerTransitioningDelegate{
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        dismissViewControllerAnimated(true, completion: nil)
        return EditIngredientsPresentationControlelr(presentedViewController: presented, presentingViewController: presenting)
    }
}
extension EditModalViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyleForPresentationController(_ : UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}