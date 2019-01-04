//
//  Question.swift
//  FunktionLernmodus
//
//  Created by Valentin on 15.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import Foundation

// struct is same as a class but:
// structs dont need initializiers, already has got a memberwise initializer
// structs functions must be mutating functions in a struct
// class has got designated initializer
// class is a reference type
// struct is
//struct Question:Codable {
//    let ID:String
//    let Frage:String
//    let Antwort1:String
//    let Antwort2:String
//    let Antwort3:String
//    let Antwort4:String
//    let Correct:String
//    let Notiz:String?
//    let LernsektorID:String
//    let LerneinheitID:String
//    let LernbereichID:String
//    let SchwierigkeitID:String
//
//    enum CodingKeys: String, CodingKey {
//        case ID = "ID"
//        case Frage = "Frage"
//        case Antwort1 = "Antwort1"
//        case Antwort2 = "Antwort2"
//        case Antwort3 = "Antwort3"
//        case Antwort4 = "Antwort4"
//        case Correct = "Correct"
//        case Notiz = "Notiz"
//        case LernsektorID = "LernsektorID"
//        case LerneinheitID = "LerneinheitID"
//        case LernbereichID = "LernbereichID"
//        case SchwierigkeitID = "SchwierigkeitID"
//    }
//    // functions must be mutating functions in a struct
//    //
//}







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
