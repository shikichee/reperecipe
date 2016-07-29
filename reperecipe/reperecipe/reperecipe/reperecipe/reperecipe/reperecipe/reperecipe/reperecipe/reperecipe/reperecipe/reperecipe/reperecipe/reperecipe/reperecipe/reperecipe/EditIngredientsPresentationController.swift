//
//  EditIngredientsPresentationController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/11.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class EditIngredientsPresentationControlelr: OverlayPresentationController {
    
    override func presentationTransitionWillBegin() {
        if let containerView = self.containerView {
            self.overlay = UIView(frame: containerView.bounds)
            self.overlay.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(overlayDidTouch(_:)))]
            self.overlay.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.0)
            containerView.insertSubview(self.overlay, atIndex: 0)
        }
        
        let presented = self.presentedViewController
        presented.transitionCoordinator()?.animateAlongsideTransition({
            [unowned self] context in
            
            self.overlay.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
            presented.view.layer.masksToBounds = true
            presented.view.layer.cornerRadius = 5.0
            
            }, completion: nil)
    }
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: parentSize.height * 0.8)
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var presentedViewFrame = CGRectZero
        let containerBounds = self.containerView!.bounds
        presentedViewFrame.size = self.sizeForChildContentContainer(self.presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = (containerBounds.size.width - presentedViewFrame.size.width) / 2.0
        presentedViewFrame.origin.y = (containerBounds.size.height - presentedViewFrame.size.height) / 5.0
        return presentedViewFrame
    }
}