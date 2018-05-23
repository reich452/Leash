//
//  ErrorCase.swift
//  Leash
//
//  Created by Nick Reichard on 5/23/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth


extension AuthErrorCode {
    // TODO: - Implement when creating users 
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account"
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email"
        case .networkError:
            return "Network error. Please try again."
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .userNotFound:
            return "This user was not found. Please try again"
        case .weakPassword:
            return "Your password is too weak"
        case .wrongPassword:
            return "You entered the wrong password you sill goose"
        default:
            return "Unknown error occurred"
        }
    }
}
