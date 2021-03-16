//
//  Note.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 15.03.2021.
//

import Foundation

class Data<T: Codable>: Codable {
    let data: T
}

class User: Codable {
    
    let id: Int
    let email: String
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
