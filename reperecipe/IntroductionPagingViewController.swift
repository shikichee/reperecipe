//
//  IntroductionPagingViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/08.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import Foundation
import UIKit
import Pages

class IntroductionPagingViewController: UIViewController, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let startingViewController = viewControllerAtIndex(0)!
        let viewControllers = [startingViewController]
        pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)
        pageViewController.view.frame = self.view.frame
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view!)
        pageViewController.didMoveToParentViewController(self)
        
        //ページコントロールのカラーを変更する。
        let pageControl = UIPageControl.appearance()
        pageControl.backgroundColor = ReperecipeColor.Background.white
        pageControl.pageIndicatorTintColor = UIColor.blueColor()
        pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewControllerAtIndex(index: Int) -> IntroductionContainerViewController? {
        if index >= IntroductionViewModel.pagingLabels().count {
            return nil
        }
        
        let introductionContainerViewController = storyboard!.instantiateViewControllerWithIdentifier("IntroductionContainerViewController") as! IntroductionContainerViewController
        introductionContainerViewController.pageIndex = index
        introductionContainerViewController.name = IntroductionViewModel.pagingLabels()[index].title
        introductionContainerViewController.image = IntroductionViewModel.pagingLabels()[index].image
        
        return introductionContainerViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! IntroductionContainerViewController).pageIndex
        
        if index == 0 {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! IntroductionContainerViewController).pageIndex
        
        index += 1
        
        if index == IntroductionViewModel.pagingLabels().count {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
}

extension IntroductionPagingViewController: UIPageViewControllerDelegate {
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return IntroductionViewModel.pagingLabels().count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}