//
//  RootPageViewController.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        let signUpVC = sb.instantiateViewController(withIdentifier: "SignUpVC")
        let emailVC = sb.instantiateViewController(withIdentifier: "EmailVC")
        let passwordVC = sb.instantiateViewController(withIdentifier: "PasswordVC")
        
        return [signUpVC, emailVC, passwordVC]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        loadViewControllers()
    }
    
    private func loadViewControllers() {
        if let signUpVC = viewControllerList.first {
            self.setViewControllers([signUpVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let previouseIndex = vcIndex - 1
        guard previouseIndex >= 0,
            viewControllerList.count > previouseIndex else { return nil }
        
        return viewControllerList[previouseIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil}
        
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else { return nil }
        guard viewControllerList.count > nextIndex else { return nil}
        
        return viewControllerList[nextIndex]
    }
    
    
    
}
