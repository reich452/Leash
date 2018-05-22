//
//  OnboardingPageViewController.swift
//  Leash
//
//  Created by Nick Reichard on 5/21/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    
    // MARK: - Internal Properties
    var currentPage = OnboardingState(currentPage: .signUp)
    
    lazy var viewControllersList: [UIViewController] = {
        return[SignUpPage.initializeFromStoryboard(), EmailPage.initializeFromStoryboard(), PasswordPage.initializeFromStoryboard()]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        let secondVC = EmailPage.initializeFromStoryboard()
        secondVC.delegate = self
        setViewControllers([SignUpPage.initializeFromStoryboard()], direction: .forward, animated: true, completion: nil)
    }

}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    
    func createVCFrom(page: OnboardingState.Page) -> OnboardingScreen {
        switch page {
        case .signUp:
            let signUpPage = SignUpPage.initializeFromStoryboard()
            return signUpPage
        case .email:
            let email = EmailPage.initializeFromStoryboard()
            return email
        case .password:
            let password = PasswordPage.initializeFromStoryboard()
            return password
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let prevPage = currentPage.page
        let page = currentPage.previousPage()
        if prevPage == page { return nil }
        let vc = createVCFrom(page: page)
        return vc as? UIViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let prevPage = currentPage.page
        let page = currentPage.nextPage()
        if prevPage == page { return nil }
        let vc = createVCFrom(page: page)
        
        return vc as? UIViewController
    }
}

extension OnboardingPageViewController: OnboardingPageDelegate {
    func goNextPage(forwardTo postion: Int) {
        let viewController = viewControllersList[postion]
        self.setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {}



