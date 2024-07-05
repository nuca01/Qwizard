//
//  QuizOptionViewModel.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

class QuizOptionViewModel {
    var questions1: [Question] = [
        Question(quest: "how is sleeping in Georgian language?", answer1: "ძილი", answer2: "სირბილი", answer3: "წოლა", readAnswer: "ძილი"),
        Question(quest: "how is a dog in Georgian language?", answer1: "ძაღლი", answer2: "კატა", answer3: "ლომი", readAnswer: "ძაღლი")
    ]
    
    var questions2: [Question] = [
        Question(quest: "how is dreaming in Georgian language?", answer1: "ძილი", answer2: "ოცნება", answer3: "წოლა", readAnswer: "ოცნება"),
        Question(quest: "how is a cat in Georgian language?", answer1: "ძაღლი", answer2: "კატა", answer3: "ლომი", readAnswer: "კატა")
    ]
}
