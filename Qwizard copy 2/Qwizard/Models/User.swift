//
//  User.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

struct User: Codable, Identifiable {
    var userName: String?
    var email: String?
    var password: String?
    var id: String?
    static var loggedIn: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case userName
        case email
        case password
        case id = "personalNumber"
    }
}
