//
//  QuestionBank.swift
//  FunktionLernmodus
//
//  Created by Valentin on 15.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import Foundation
//
//struct QuestionBank: Codable {
//    var questions = [Question]()
//}
//



class QuestionBank{
    var questionList = [Question]() // initialisiertes Array, viele Obj. vom Typ Question
    // Fragen als Objekte
    init(){
        let question1 = Question(_questionText: "Welche der vier genannten Werte steuert den Atemantrieb?", _answer1: "pO2", _answer2: "pCO2", _answer3: "pH", _answer4: "K+", _correct: 2)
        // Objekt aus Array erstellen
        let question2 = Question(_questionText: "Welche Blutzellen sind hauptsächlich für den Sauerstofftransport zuständig?", _answer1: "Erythrozyten", _answer2: "Leukozyten", _answer3: "Thrombozyten", _answer4: "Histamine", _correct: 1)
        let question3 = Question(_questionText: "Wie hoch ist die physiologische Sauerstoffsättigung im Blut", _answer1: "100%", _answer2: "98-100%", _answer3: "95%", _answer4: "85-100%", _correct: 2)
        
        
        questionList.append(question1) // Fragen Objekte in Array Liste questionList
        //Index 0
        questionList.append(question2) // Index 1
        questionList.append(question3)
        
    }
}
