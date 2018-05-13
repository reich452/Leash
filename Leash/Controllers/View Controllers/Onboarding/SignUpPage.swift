//
//  SignUpPage.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class SignUpPage: UIViewController, OnboardingScreen {
    
    // MARK: - Internal properties
    
    var page: OnboardingState.Page = .signUp

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

private extension SignUpPage {
    
    func setupUI() {
        print("Signup page")
        view.backgroundColor = .red
    }
    
}

extension SignUpPage: StoryboardInitializable {
    
    static var storyboardName: String { return String(describing: Onboarding.self) }
}
