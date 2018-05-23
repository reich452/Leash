//
//  Post.swift
//  Leash
//
//  Created by Nick Reichard on 5/22/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import Foundation

struct Post {
    
    var postId: String
    var imageFileURL: String
    var user: String
    var votes: Int
    var timestamp: Int
    
    
    // MARK: - Firebase Keys
    
    enum PostInfoKey {
        static let imageFileURL = "imageFileURL"
        static let user = "user"
        static let votes = "votes"
        static let timestamp = "timestamp"
    }
    
    // MARK: - Initialization
    
    init(postId: String, imageFileURL: String, user: String, votes: Int, timestamp: Int = Int(NSDate().timeIntervalSince1970 * 1000)) {
        self.postId = postId
        self.imageFileURL = imageFileURL
        self.user = user
        self.votes = votes
        self.timestamp = timestamp
    
    }
    
    init?(postId: String, postInfo: [String: Any]) {
        guard let imageFileURL = postInfo[PostInfoKey.imageFileURL] as? String,
            let user = postInfo[PostInfoKey.user] as? String,
            let votes = postInfo[PostInfoKey.votes] as? Int,
            let timestamp = postInfo[PostInfoKey.timestamp] as? Int else { return nil }
        
        self.postId = postId
        self.imageFileURL = imageFileURL
        self.user = user
        self.votes = votes
        self.timestamp = timestamp

    }
      
}
