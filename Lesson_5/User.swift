//
//  Note.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 15.03.2021.
//

import Foundation

class Data: Codable {
    let data: [User]
}

class User: Codable {
    
    let id: Int
    let email: Int
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
}
