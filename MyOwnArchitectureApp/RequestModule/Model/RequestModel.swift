//
//  RequestModel.swift
//  MyOwnArchitectureApp
//
//  Created by Ankur Chaudhary on 10/10/22.
//

import Foundation

struct RequestDetail : Codable {
    var uniqueId: Double
    var title: String
    var createdDate: String
    var closedDate: String?
    var user: User
    
    enum CodingKeys: String, CodingKey {
        case uniqueId = "id"
        case title
        case createdDate = "created_at"
        case closedDate = "closed_at"
        case user = "user"
    }
}

struct User: Codable {
    var name: String
    var userId: Double
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case userId = "id"
        case imageUrl = "avatar_url"
    }
    
}
