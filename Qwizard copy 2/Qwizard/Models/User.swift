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
    
    enum CodingKeys: String, CodingKey {
        case userName
        case email
        case password
        case id = "personalNumber"
    }
}

class UserManager: ObservableObject {
    static let shared = UserManager()

    @Published var loggedIn: Bool = false
    @Published var score: Int = 0
    @Published var ranking: Int = 0

    private init() {}
}
