//
//  PostController.swift
//  Leash
//
//  Created by Nick Reichard on 5/22/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation
import Firebase

final class PostController {
    
    // MARK: - Properties
    
    static let shared = PostController()
    
    private init() { }
    
    // MARK: - Firebase
    
    let dataBaseRef = Database.database().reference()
    let postDataBaseRef = Database.database().reference().child("posts")
    let photoStorage = Storage.storage().reference().child("photos")
}
