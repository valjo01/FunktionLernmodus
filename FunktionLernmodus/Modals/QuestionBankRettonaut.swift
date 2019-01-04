//
//  QuestionBankRettonaut.swift
//  FunktionLernmodus
//
//  Created by Valentin on 15.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//

import Foundation

class QuestionBankRettonaut {

var questionList = [Question]()

    init () {
        
        let question1 = Question(_questionText: "Wie ist das Verhältnis von Kompression zur Beatmung bei der kardiopulmonalen Reanimation", _answer1: "30/2", _answer2: "30/5", _answer3: "20/5", _answer4: "20/10", _correct: 1)
        let question2 = Question(_questionText: "Welche der folgenden sind Rhythmusstörungen?", _answer1: "Extrasystolen", _answer2: "Hypertonie", _answer3: "Tachykardie", _answer4: "TAA", _correct: 1)
        
        questionList.append(question1)
        questionList.append(question2)
    }
}
