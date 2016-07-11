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
    
    var firstButtonText: String?
    var secondButtonText: String?
    
    var firstViewController: ViewController!
    var secondViewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        firstButton.setTitle(firstButtonText, forState: .Normal)
        secondButton.setTitle(secondButtonText, forState: .Normal)
        
        firstButton.addTarget(self, action: #selector(didTapFirstButton), forControlEvents: .TouchUpInside)
        firstButton.addTarget(self, action: #selector(didTapSecondButton), forControlEvents: .TouchUpInside)
    }
    
    func setButtonTitle(firstButtonText: String, secondButtonText: String) {
        self.firstButtonText = firstButtonText
        self.secondButtonText = secondButtonText
    }
    
    func setButtonTarget(firstViewController: ViewController, secondViewController: ViewController){
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
    }
    
    func didTapFirstButton() {
        self.presentViewController(firstViewController, animated: true, completion: nil)
    }
    
    func didTapSecondButton() {
        self.presentViewController(secondViewController, animated: true, completion: nil)
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
extension EditModalViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyleForPresentationController(_ : UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}