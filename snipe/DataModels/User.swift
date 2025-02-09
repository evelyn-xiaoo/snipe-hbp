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
    var email:String
    var username: String
    // add photo later
    
    init(id: String, name: String, email: String, username: String) {
        self.id = id
        self.name = name
        self.email = email
        self.username = username
    }
    
    static var collectionName: String = "users"
}
