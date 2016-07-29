//
//  OverlayPresentaitonConttoller.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/07/11.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit

class OverlayPresentationController: UIPresentationController {
    
    var overlay: UIView!
    
    func overlayDidTouch(sender: AnyObject) {
        self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func presentationTransitionWillBegin() {
        let containerView = self.containerView!
        
        self.overlay = UIView(frame: containerView.bounds)
        self.overlay.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(overlayDidTouch(_:)))]
        self.overlay.backgroundColor = UIColor.blackColor()
        self.overlay.alpha = 0.0
        containerView.insertSubview(self.overlay, atIndex: 0)
        
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition({
            [unowned self] context in
            self.overlay.alpha = 0.5
            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        self.presentedViewController.transitionCoordinator()?.animateAlongsideTransition({
            [unowned self] context in
            self.overlay.alpha = 0.0
            }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            self.overlay.removeFromSuperview()
        }
    }
    
    override func containerViewWillLayoutSubviews() {
        overlay.frame = containerView!.bounds
        self.presentedView()!.frame = self.frameOfPresentedViewInContainerView()
    }
}