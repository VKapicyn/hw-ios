//
//  Note.swift
//  Lesson_5
//
//  Created by Maxim Vitovitsky on 15.03.2021.
//

import Foundation

class Note: Codable {
    
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "userId"
        case title = "title"
        case body = "body"
    }
    
}
