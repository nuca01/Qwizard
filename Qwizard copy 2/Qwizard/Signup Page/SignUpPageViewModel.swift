//
//  SignUpPageViewModel.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

class SignUpPageViewModel: ObservableObject {
    @Published var user: User?
    
    func registerUser() -> Bool {
        return true
    }
}
