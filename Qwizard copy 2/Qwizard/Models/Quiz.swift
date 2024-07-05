//
//  Quiz.swift
//  Qwizard
//
//  Created by nuca on 05.07.24.
//

import Foundation

struct Quiz: Codable {
    var title: String?
    var description: String?
    var startDate: String?
    var questions: [Question]?
}
