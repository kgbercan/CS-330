//
//  PageViewController.swift
//  PaceGuide
//
//  Created by Karina Bercan on 5/6/16.
//  Copyright © 2016 Karina Bercan. All rights reserved.
//
//  https://spin.atomicobject.com/2015/12/23/swift-uipageviewcontroller-tutorial/

import UIKit

class PageViewController: UIPageViewController {
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        // the names of the views/pages to flip through
        return [self.newViewController("PaceGuideNavigation"), self.newViewController("RowerTableNavigation")]
    }()
    
    // when the application loads
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController],
                              direction: .Forward,
                              animated: true,
                              completion: nil)
        }
        
    }
}

extension PageViewController: UIPageViewControllerDataSource{
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else{
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else{
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else{
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    private func newViewController(id: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("\(id)Controller")
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }

}

    