//
//  Onboarding.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

protocol OnboardingScreen where Self: UIViewController {
    var page: OnboardingState.Page { get }
}
@objc protocol OnboardingPageDelegate {
    func goNextPage(forwardTo postion: Int)
    @objc optional func goPreviousPage(fowardTo position: Int)
}


class Onboarding: UIViewController {
    
    // MARK: - Properties
    
    var pageViewController: UIPageViewController!
    var currentPage = OnboardingState(currentPage: .signUp)
    
    lazy var viewControllersList: [UIViewController] = {
        return[SignUpPage.initializeFromStoryboard(), EmailPage.initializeFromStoryboard(), PasswordPage.initializeFromStoryboard()]
    }()
    
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let nextButton2: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        
        return button
    }()
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
        
        pageViewController.setViewControllers([SignUpPage.initializeFromStoryboard()], direction: .forward, animated: true, completion: nil)
    }
    
    
    // MARK: - Actions
    
    @objc func handleButtonTapped(sender: UIButton) {
    
        switch sender {
        case nextButton:
        
            let prevPage = currentPage.page
            let page = currentPage.nextPage()
            if prevPage == page { return }
            guard let vc = createVCFrom(page: page) as? UIViewController else { return }
            
            pageViewController.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
           
            nextButton.isHidden = true
            nextButton2.isHidden = false
            
        case nextButton2:
          
            let prevPage = currentPage.page
            let page = currentPage.nextPage()
            if prevPage == page { return }
            guard let vc = createVCFrom(page: page) as? UIViewController else { return }
            
            pageViewController.setViewControllers([vc], direction: .forward, animated: true, completion: nil)

        default:
            break
        }
        
    }
    
}

extension Onboarding: OnboardingPageDelegate {
    
    func goNextPage(forwardTo postion: Int) {
        let viewController = viewControllersList[postion]
        pageViewController.setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - Onboarding

extension Onboarding {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifier(for: segue) {
        case .embedPageViewController:
            pageViewController = segue.destination as! UIPageViewController
            pageViewController.dataSource = self
            pageViewController.delegate = self
        }
    }
    
}

// MARK: - Page ViewController Datasource and Delegate

extension Onboarding: UIPageViewControllerDataSource {
    
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

extension Onboarding: UIPageViewControllerDelegate { }

// MARK: - Segue Handling

extension Onboarding: SegueHandling {
    
    enum SegueIdentifier: String {
        case embedPageViewController
    }
    
}

// MARK: - Storyboard Initializable

extension Onboarding: StoryboardInitializable { }


// MARK: - Constraints

extension Onboarding {
    
    func setUpConstraints() {
        view.addSubview(nextButton)
        nextButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 310, paddingLeft: 0, paddingBottom: 0, paddingRight: 40, width: 300, height: 60)
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(nextButton2)
        nextButton2.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 380, paddingLeft: 0, paddingBottom: 0, paddingRight: 40, width: 300, height: 50)
        nextButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton2.isHidden = true
    }
    
    
}




