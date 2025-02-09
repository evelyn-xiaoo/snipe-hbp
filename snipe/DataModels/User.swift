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
    var username: String
    // add photo later
    
    init(id: String, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
    
    static var collectionName: String = "users"
}
