//
//  HomePageViewModel.swift
//  Qwizard
//
//  Created by nuca on 04.07.24.
//

import Foundation

class HomePageViewModel: ObservableObject {
    @Published var quizes: [Quiz] = [
        Quiz(title: "Georgian Language", description: "quiz in Georgian languages", startDate: "10 January"),
        Quiz(title: "Georgian Language", description: "quiz in Georgian languages", startDate: "10 January")
    ]
    
    private func fetchQuizes() {
        
    }
}
