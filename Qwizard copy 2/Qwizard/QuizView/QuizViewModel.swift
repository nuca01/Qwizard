//
//  QuizViewModel.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var questions: [Question]
    
    func poppedQuestions() -> [Question] {
        var poppedQuestions = questions
        poppedQuestions.remove(at: 0)
        return poppedQuestions
    }
    
    init(questions: [Question]) {
        self.questions = questions
    }
}
