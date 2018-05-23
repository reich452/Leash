//
//  PostController.swift
//  Leash
//
//  Created by Nick Reichard on 5/22/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit
import Firebase

final class PostController {
    
    // MARK: - Properties
    
    static let shared = PostController()
    
    private init() { }
    
    let dataBaseRef = Database.database().reference()
    let postDataBaseRef = Database.database().reference().child("posts")
    let photoStorage = Storage.storage().reference().child("photos")
    
    // MARK: - Firebase URLS
    private enum FBEndpoints {
        case Base
        case Users
        case User(String)
        case PostsUrl
        
        func url() -> Database {
            switch self {
            case .Base:
                return Database.database(url: "https://leash-ios.firebaseio.com/")
            case .Users:
                return Database.database(url: "https://leash-ios.firebaseio.com/users")
            case .User(let n):
                return Database.database(url: "https://leash-ios.firebaseio.com/\(n)")
            case .PostsUrl:
                return Database.database(url: "https://leash-ios.firebaseio.com/posts")
            }
        }
    }
    
    // MARK: - Create
    
    typealias uploadCompletionHandler = (_ completion: UIImage?) -> Void
    
    func uploadImage(image: UIImage, completion: uploadCompletionHandler) {
        
    }
        
}
