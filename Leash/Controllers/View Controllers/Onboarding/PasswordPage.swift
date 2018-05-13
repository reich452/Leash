//
//  PasswordPage.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class PasswordPage: UIViewController, OnboardingScreen {
    
    // MARK: - Internal properties
    
    var page: OnboardingState.Page = .signUp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension PasswordPage {
    
    func setupUI() {
        print("Password page")
        view.backgroundColor = UIColor.purple
    }
    
}

extension PasswordPage: StoryboardInitializable {
    
    static var storyboardName: String { return String(describing: Onboarding.self) }
}

