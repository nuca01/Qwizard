//
//  Question.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

struct Question: Codable, Identifiable {
    var id: String?
    var quest: String?
    var answer1: String?
    var answer2: String?
    var answer3: String?
    var answer4: String?
    var readAnswer: String?
}
