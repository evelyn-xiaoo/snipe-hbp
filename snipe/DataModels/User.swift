//
//  User.swift
//  snipe
//
//  Created by Evelyn Xiao on 2/8/25.
//

import Foundation
struct FirestoreUser: Codable {
    var id: String
    var name:String
    var bio:String
    var username: String
    // add photo later
    
    init(id: String, name: String, bio: String, username: String) {
        self.id = id
        self.name = name
        self.bio = bio
        self.username = username
    }
    
    static var collectionName: String = "users"
}
