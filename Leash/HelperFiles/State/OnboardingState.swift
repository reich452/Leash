//
//  Onboarding.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

class OnboardingState {
    
    // MARK: - Additional Types
    
    enum PageType {
        case signUp
        case email
        case password
    }
    
    enum Page: Int {
        case signUp
        case email
        case password
        
        var type: PageType {
            switch self {
            case .signUp: return .signUp
            case .email: return .email
            case .password: return .password
            }
        }
        static var all: [Page] = [.signUp, .email, .password]
    }

    
    // MARK: - Internal Properties
    
    var page: Page
    
    init(currentPage: Page) {
        self.page = currentPage
    }
    
    func previousPage() -> Page {
        switch page {
        case .signUp: page = .signUp
        case .email: page = .signUp
        case .password: page = .email
        }
        return page
    }
    
    func nextPage() -> Page {
        switch page {
        case .signUp: page = .email
        case .email: page = .password
        case .password: page = .password
        }
        return page
        
    }
    
}
