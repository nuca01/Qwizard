//
//  ProfilePageViewModel.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

class ProfilePageViewModel: ObservableObject {
    @Published var user: User?
    @Published var score: String?
    @Published var ranking: String?
    @Published var userNotLoggedIn: Bool = true
    
    private func fetchUserInfo() {
        
    }
}
