//
//  EmailPage.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class EmailPage: UIViewController, OnboardingScreen {
    
    // MARK: - Internal properties
    
    var page: OnboardingState.Page = .signUp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
}

private extension EmailPage {
    
    func setupUI() {
        print("Email page")
        view.backgroundColor = .blue
    }
    
}

extension EmailPage: StoryboardInitializable {
    
    static var storyboardName: String { return String(describing: Onboarding.self) }
}
