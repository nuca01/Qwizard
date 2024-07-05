//
//  QuizViewModel.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var questions: [Question]
    var correctAnswers: Int = 0
    var realAnswer: String {
        questions.first?.readAnswer ?? ""
    }
    func poppedQuestions() -> [Question] {
        var poppedQuestions = questions
        poppedQuestions.remove(at: 0)
        return poppedQuestions
    }
    
    init(questions: [Question]) {
        self.questions = questions
    }
}
