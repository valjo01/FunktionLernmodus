//
//  Question.swift
//  FunktionLernmodus
//
//  Created by Valentin on 15.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import Foundation

class Question {
    let questionText:String
    let answer1:String
    let answer2:String
    let answer3:String
    let answer4:String
    let correct:Int
    
    init(_questionText:String, _answer1:String, _answer2:String, _answer3:String, _answer4:String, _correct:Int) {
        questionText = _questionText
        answer1 = _answer1
        answer2 = _answer2
        answer3 = _answer3
        answer4 = _answer4
        correct = _correct
    }
    
}
