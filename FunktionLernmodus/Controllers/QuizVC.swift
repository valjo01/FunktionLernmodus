//
//  QuizVC.swift
//  FunktionLernmodus
//
//  Created by Valentin on 15.12.18.
//  Copyright © 2018 Novaheal. All rights reserved.
//


// To Do:
// set up https://github.com/pkluz/PKHUD instead of Progress HUD, that is used

import UIKit

// MARK:- Structs
struct QuestionJson: Decodable {
    
    let ID: String?
    let Frage: String?
    let Antwort1: String?
    let Antwort2: String?
    let Antwort3: String?
    let Antwort4: String?
    let Correct: String?
    let Notiz: String?
    let LernsektorID: String?
    let LerneinheitID: String?
    let LernbereichID: String?
    let SchwierigkeitID: String?
    let Redakteur: String?
    let created_at: String?
    
}

//var QuestionBankJson: [QuestionJson] {
//    var questionListJson = [QuestionJson]()
//
//}

class QuizVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var questionOutlet: UILabel!
    
    
    @IBOutlet weak var progressBarOutlet: UIView!
    @IBOutlet weak var progressBarBckgr: UIView!
    
    @IBOutlet weak var ScoreLabelOutlet: UILabel!
    
    @IBOutlet weak var answerBtn1Outlet: UIButton!
    @IBOutlet weak var answerBtn2Outlet: UIButton!
    @IBOutlet weak var answerBtn3Outlet: UIButton!
    @IBOutlet weak var answerBtn4Outlet: UIButton!
    
    
    // MARK:- Instanzvariable
    let allQuestion = QuestionBank() // Objekt der Klasse Question Bank gespeichert
    // zugreifbar
    // () = Standard Initialisierung
    // ALTERNATIV: let allQuestion = QuestionBankRettonaut()
    
    // MARK:- Var & Let
    var pickedAnswer = 0
    var questionNumber = 0
    
    var score = 0
    
    // Array comments on right/ wrong pick
    let commentsOnCorrectPick = ["Super!", "Sahnig!", "Hammer!"]
    var randomString = ""
    let commentsOnWrongPick = ["Schade!", "Das geht besser!", "Leider falsch!"]
    
    
    var answeredRightStrings = "Sehr sahnige Anwort!" // to do als Array
    var answeredWrongStrings = "Leider nicht richtig!"
    
    var countOfAllQuestion = 0
    var countOfAllQuestionMinusOneForQuiz = 0
    
    var arrayQuestionJson = QuestionBankJson1()
    
    
    
    
    // MARK: - Buttons
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        
        // Ueberpruefen welcher Btn gecklickt wurde
        if sender.tag == 1 {
            pickedAnswer = 1
            print("Antwort1 gedrueckt")
        } else if sender.tag == 2 {
            pickedAnswer = 2
            print("Antwort2 gedrueckt")
        } else if sender.tag == 3 {
            pickedAnswer = 3
            print("Antwort3 gedrueckt")
        } else if sender.tag == 4 {
            pickedAnswer = 4
            print("Antwort4 gedrueckt")
        }
        
        // Antwort checken
        checkAnswer()
        // questionNumber um eins erhoehen
        questionNumber = questionNumber + 1
        // nachste Frage
        nextQuestion()
        // update UI
        updateUI()
        
        
    }
    
    
    // MARK:- Methods
    func updateUI () {
        ScoreLabelOutlet.text = "Score: \(score)" // da String
        
        let numberOfAllQuestions = allQuestion.questionList.count
        print(numberOfAllQuestions)
        
        // MARK:- Progress bar
        let progressBarBckgrHeight = progressBarBckgr.frame.size.height
        let progressBarBckgrHeightInt = Int(progressBarBckgrHeight)
        let progressBarBckgrHeightPiece = progressBarBckgrHeightInt / numberOfAllQuestions
        
        // Solution from StackFlow
        // height decreases while the whole object elevates
        progressBarOutlet.frame = CGRect(x: progressBarOutlet.frame.origin.x,
                                         y: progressBarOutlet.frame.origin.y,
                                         width: progressBarOutlet.frame.width,
                                         height: progressBarOutlet.frame.height + CGFloat(progressBarBckgrHeightPiece))
    }
    
    
    func nextQuestion () {
        // end loading alert
        ProgressHUD.dismiss()
        
        // start loading Information into labels & Buttons
        if questionNumber <= countOfAllQuestionMinusOneForQuiz { // Count of questions - 1
            
            questionOutlet.text = allQuestion.questionList[questionNumber].questionText
            
            let answer1BtnText = allQuestion.questionList[questionNumber].answer1
            let answer2BtnText = allQuestion.questionList[questionNumber].answer2
            let answer3BtnText = allQuestion.questionList[questionNumber].answer3
            let answer4BtnText = allQuestion.questionList[questionNumber].answer4
            answerBtn1Outlet.setTitle(answer1BtnText, for: .normal)
            answerBtn2Outlet.setTitle(answer2BtnText, for: .normal)
            answerBtn3Outlet.setTitle(answer3BtnText, for: .normal)
            answerBtn4Outlet.setTitle(answer4BtnText, for: .normal)
            
        } else {
            print("Quiz Ende")
            // Alert
            let alert = UIAlertController(title: "Geschafft", message: "Willst Du das Quiz neu starten?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Neustart", style: .default) { (alertAction) in
                self.restart()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func checkAnswer(){
        // check which answer is correct
        let correctAnswer = allQuestion.questionList[questionNumber].correct
        
        // check if the picked answer = correct answer
        if correctAnswer == pickedAnswer {
            // right pick
            randomizedCommentWhenCorrect()
            // print("richtig!")
            ProgressHUD.showSuccess(randomString)
            score = score + 10
        } else {
            // wrong pick
            randomizedCommentWhenWrong()
            // print("falsch!")
            ProgressHUD.showError(randomString)
        }
    }
    
    func restart() {
        questionNumber = 0
        score = 0
        nextQuestion()
        ProgressHUD.show("Lade...")
        progressBarOutlet.frame = CGRect(x: progressBarOutlet.frame.origin.x,
                                         y: progressBarOutlet.frame.origin.y,
                                         width: progressBarOutlet.frame.width,
                                         height: CGFloat(0))
    }
    
    func randomizedCommentWhenCorrect(){
        if let randomElement = commentsOnCorrectPick.randomElement() {
            randomString = randomElement
            print(randomElement)
        }
    }
    
    func randomizedCommentWhenWrong() {
        if let randomElement = commentsOnWrongPick.randomElement() {
            randomString = randomElement
            print(randomElement)
        }
    }
    
    
    // MARK: - override func viewDidLoad() super.viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // count questions, because ending the quiz
        let countQuestions = allQuestion.questionList.count
        countOfAllQuestion = countQuestions
        countOfAllQuestionMinusOneForQuiz = countQuestions - 1
        print("Anzahl aller Fragen: \(countOfAllQuestion + 1)")
        print("Dementsprechend var fuer Quiz: \(countOfAllQuestionMinusOneForQuiz)")
        
        // set labels and buttons texts for the first time
        let firstQuestion = allQuestion.questionList[0]
        questionOutlet.text = firstQuestion.questionText
        
        let answer1BtnText = allQuestion.questionList[questionNumber].answer1
        let answer2BtnText = allQuestion.questionList[questionNumber].answer2
        let answer3BtnText = allQuestion.questionList[questionNumber].answer3
        let answer4BtnText = allQuestion.questionList[questionNumber].answer4
        answerBtn1Outlet.setTitle(answer1BtnText, for: .normal)
        answerBtn2Outlet.setTitle(answer2BtnText, for: .normal)
        answerBtn3Outlet.setTitle(answer3BtnText, for: .normal)
        answerBtn4Outlet.setTitle(answer4BtnText, for: .normal)
        
        
        // MARK:- JSON
        // JSON-----------------------------------------------------------------
//        let url = "https://redaktion.pflegonaut.de/service.php"
//        let urlObj = URL(string: url)
//
//        URLSession.shared.dataTask(with: urlObj!) { (data, response, error) in
//            do {
//                var questions = try JSONDecoder().decode([QuestionJson].self, from: data!)
//                // Ausgabe alle Fragen
//                let count = questions.count
//                print("Anzahl entspricht\(count)")
//
//                for question in 0 ... count{
//                    print("+++++++++ \(questions[question].Frage!)")
//                    let question = QuestionJson1(_frage: questions[question].Frage!)
//                    self.arrayQuestionJson.array.append(question)
//
//
//                }
//                // Ausgabe einer Frage
//                //                print(questions[1].Frage!)
//
//            } catch {
//                print("we got an error")
//            }
//            }.resume()
//        // JSON-----------------------------------------------------------------------------------
//
//        print("antwrweke \(arrayQuestionJson.array)")

        // Do any additional setup after loading the view.
    }
    
    // Wird aufgerufen wenn das System wenig Speicher zur Verfügung hat
    override func didReceiveMemoryWarning() {
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
