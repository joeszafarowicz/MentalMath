//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var topNumberLabel: UILabel!
    @IBOutlet weak var bottomNumberLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPossibleAnswers()
        cardImageView.layer.cornerRadius = 15.0
        cardImageView.clipsToBounds = true

        if (defaults.bool(forKey: "mixedOperations") == true) {
            // Random array that sets answer to specific button
            let operationsArray = ["Addition", "Subtraction", "Multiplication", "Division"]
            let operationsRandomIndex = Int(arc4random_uniform(UInt32(operationsArray.count)))
            
            if operationsArray[operationsRandomIndex] == "Addition" {
                checkForOperation = "+"
                operationStatement = "addition"
            } else if operationsArray[operationsRandomIndex] == "Subtraction" {
                checkForOperation = "-"
                operationStatement = "subtraction"
            } else if operationsArray[operationsRandomIndex] == "Multiplication" {
                checkForOperation = "x"
                operationStatement = "multiplication"
            } else if operationsArray[operationsRandomIndex] == "Division" {
                checkForOperation = "÷"
                operationStatement = "division"
            }
        }
        
        if (defaults.bool(forKey: "normalQuestion") == true) {
            scoreLabel.text = "Score: \(score)"
        }
        
        // If missing number challenge is active hide number
        if (defaults.bool(forKey: "missingNumberQuestion") == true) {
            topNumberLabel.textAlignment = .center
            bottomNumberLabel.textAlignment = .center
            
            if (defaults.bool(forKey: "missingNumberSequenceTop") == true) {
                topNumberLabel.text = "? \(checkForOperation) \(bottomRandomNumber)"
                bottomNumberLabel.text =  "= \(actualAnswer)"
                scoreLabel.text = "Score: \(score)"
            } else {
                topNumberLabel.text = "\(topRandomNumber) \(checkForOperation) ?"
                bottomNumberLabel.text =  "= \(actualAnswer)"
                scoreLabel.text = "Score: \(score)"
            }
        }
    }
    
    func checkEquation() {
        if checkForOperation == "+" {
            // Corrects numbers so top number is alwasy larger than the bottom number
            if bottomRandomNumber > topRandomNumber {
                let one = topRandomNumber
                let two = bottomRandomNumber
                topRandomNumber = two
                bottomRandomNumber = one
                equation = Int(topRandomNumber) + Int(bottomRandomNumber)
            } else {
                equation = Int(topRandomNumber) + Int(bottomRandomNumber)
            }
        }
        if checkForOperation == "-" {
            // Corrects numbers so top number is alwasy larger than the bottom number
            if bottomRandomNumber > topRandomNumber {
                let one = topRandomNumber
                let two = bottomRandomNumber
                topRandomNumber = two
                bottomRandomNumber = one
                equation = Int(topRandomNumber) - Int(bottomRandomNumber)
            } else {
                equation = Int(topRandomNumber) - Int(bottomRandomNumber)
            }
        }
        if checkForOperation == "x" {
            // Corrects numbers so top number is alwasy larger than the bottom number
            if bottomRandomNumber > topRandomNumber {
                let one = topRandomNumber
                let two = bottomRandomNumber
                topRandomNumber = two
                bottomRandomNumber = one
                equation = Int(topRandomNumber) * Int(bottomRandomNumber)
            } else {
                equation = Int(topRandomNumber) * Int(bottomRandomNumber)
            }
        }
        if checkForOperation == "÷" {
            // If statements to assure that if 0 is drawn that both values are at least 1
            if topRandomNumber == 0 {
                topRandomNumber = 1
            }
            if bottomRandomNumber == 0 {
                bottomRandomNumber = 1
            }
            
            // Multiplys two values to get divide value
            var dividevalue = bottomRandomNumber * topRandomNumber
            topRandomNumber = dividevalue
            if dividevalue == 0 {
                dividevalue = 1
                topRandomNumber = dividevalue
            }
            equation = Int(topRandomNumber) / Int(bottomRandomNumber)
        }
        topNumberLabel.text = "\(topRandomNumber)"
        bottomNumberLabel.text = "\(checkForOperation) \(bottomRandomNumber)"
    }
    
    func questionOrder() {
        setQuestionNumbers()
        
        checkEquation()
        questionNumber = (defaults.integer(forKey: "numberOfQuestions"))
        
        if checkQuestion >= questionNumber {
            checkQuestion = 0
        } else if checkQuestion < questionNumber {
            cardLabel.text = "\(checkQuestion + 1)/\(questionNumber)"
        }
    }
    
    func setQuestionNumbers() {
        var randomQuestionNumber = 0
        var randomQuestionNumberBottom = 0
        
        let level = (defaults.integer(forKey: "levelDifficulty"))
        switch level {
        case 1:
            randomQuestionNumber = 11
            randomQuestionNumberBottom = 6
        case 2:
            randomQuestionNumber = 21
            randomQuestionNumberBottom = 11
        case 3:
            randomQuestionNumber = 51
            randomQuestionNumberBottom = 21
        case 4:
            randomQuestionNumber = 101
            randomQuestionNumberBottom = 51
        case 5:
            randomQuestionNumber = 501
            randomQuestionNumberBottom = 251
        case 6:
            randomQuestionNumber = 1001
            randomQuestionNumberBottom = 501
        default:
            randomQuestionNumber = 11
            randomQuestionNumberBottom = 6
        }
        
        topRandomNumber = Int(arc4random_uniform(UInt32(randomQuestionNumber)))
        bottomRandomNumber = Int(arc4random_uniform(UInt32(randomQuestionNumberBottom)))
        
        if topRandomNumber == 0 && bottomRandomNumber == 0 {
            topRandomNumber = Int(arc4random_uniform(UInt32(randomQuestionNumber)))
            bottomRandomNumber = Int(arc4random_uniform(UInt32(randomQuestionNumberBottom)))
        }
    }
    
    func setAnswerTitle() {
        // Random array that sets answer to specific button
        let array = ["Button1", "Button2", "Button3", "Button4"]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        
        if (defaults.bool(forKey: "missingNumberQuestion") == true) {
            let missingNumberArray = ["First", "Second"]
            let missingNumberrandomIndex = Int(arc4random_uniform(UInt32(missingNumberArray.count)))
            
            if missingNumberArray[missingNumberrandomIndex] == "First" {
                missingNumber = topRandomNumber
                defaults.set(true, forKey: "missingNumberSequenceTop")
            } else if missingNumberArray[missingNumberrandomIndex] == "Second" {
                missingNumber = bottomRandomNumber
                defaults.set(false, forKey: "missingNumberSequenceTop")
            }
            
            if array[randomIndex] == "Button1" {
                randomNumber1 = missingNumber
            } else if array[randomIndex] == "Button2" {
                randomNumber2 = missingNumber
            } else if array[randomIndex] == "Button3" {
                randomNumber3 = missingNumber
            } else if array[randomIndex] == "Button4" {
                randomNumber4 = missingNumber
            }
        } else {
            if array[randomIndex] == "Button1" {
                randomNumber1 = actualAnswer
            } else if array[randomIndex] == "Button2" {
                randomNumber2 = actualAnswer
            } else if array[randomIndex] == "Button3" {
                randomNumber3 = actualAnswer
            } else if array[randomIndex] == "Button4" {
                randomNumber4 = actualAnswer
            }
        }
    }
    
    func numberGenerator() -> Int {
        var returnNumber: Int = 0

        if actualAnswer >= 0 && actualAnswer <= 10 {
            returnNumber = Int.random(in: 0..<actualAnswer)
        } else {
            returnNumber = Int.random(in: actualAnswer - 10..<actualAnswer)
        }
        
        return returnNumber
    }
    
    func setAnswers() {
        actualAnswer = equation

        randomNumber1 = numberGenerator()
        randomNumber2 = numberGenerator()
        randomNumber3 = numberGenerator()
        randomNumber4 = numberGenerator()
        
        // Checks for repetitive titles
        if randomNumber1 == randomNumber2 {
            randomNumber1 = numberGenerator()
        }
        if randomNumber1 == randomNumber3 {
            randomNumber1 = numberGenerator()
        }
        if randomNumber1 == randomNumber4 {
            randomNumber1 = numberGenerator()
        }
     
        if randomNumber2 == randomNumber1 {
            randomNumber2 = numberGenerator()
        }
        if randomNumber2 == randomNumber3 {
            randomNumber2 = numberGenerator()
        }
        if randomNumber2 == randomNumber4 {
            randomNumber2 = numberGenerator()
        }
       
        if randomNumber3 == randomNumber1 {
            randomNumber3 = numberGenerator()
        }
        if randomNumber3 == randomNumber2 {
            randomNumber3 = numberGenerator()
        }
        if randomNumber3 == randomNumber4 {
            randomNumber3 = numberGenerator()
        }
   
        if randomNumber4 == randomNumber1 {
            randomNumber4 = numberGenerator()
        }
        if randomNumber4 == randomNumber2 {
            randomNumber4 = numberGenerator()
        }
        if randomNumber4 == randomNumber3 {
            randomNumber4 = numberGenerator()
        }
    }
    
    func getPossibleAnswers() {
        questionOrder()
        setAnswers()

        // If all numbers are 0 reset answers
        if randomNumber1 == 0 && randomNumber2 == 0 && randomNumber3 == 0 && randomNumber4 == 0 {
            setAnswers()
        }
        
        if checkForOperation.contains("+") {
            cardImageView.backgroundColor = additionColor
            setAnswerTitle()
        }
        if checkForOperation.contains("-") {
            cardImageView.backgroundColor = subtractionColor
            setAnswerTitle()
        }
        if checkForOperation.contains("x") {
            cardImageView.backgroundColor = multiplicationColor
            setAnswerTitle()
        }
        if checkForOperation.contains("÷") {
            cardImageView.backgroundColor = divisionColor
            setAnswerTitle()
        }
        
        setupButton(button: answerOneButton, title: "\(randomNumber1)", answerButton: true)
        setupButton(button: answerTwoButton, title: "\(randomNumber2)", answerButton: true)
        setupButton(button: answerThreeButton, title: "\(randomNumber3)", answerButton: true)
        setupButton(button: answerFourButton, title: "\(randomNumber4)", answerButton: true)
        question = "\(topRandomNumber) \(checkForOperation) \(bottomRandomNumber) = \(actualAnswer)"
    }
    
    func userSelection() {
        if (defaults.bool(forKey: "missingNumberQuestion") == true) {
            if (defaults.bool(forKey: "missingNumberSequenceTop") == true) {
                userSelectedAnswer = "\(selectedAnswer) \(checkForOperation) \(bottomRandomNumber) = \(actualAnswer)"
            } else {
                userSelectedAnswer = "\(topRandomNumber) \(checkForOperation) \(selectedAnswer) = \(actualAnswer)"
            }
        }
        
        if (defaults.bool(forKey: "normalQuestion") == true) {
            userSelectedAnswer = "\(selectedAnswer) \(checkForOperation) \(bottomRandomNumber) = \(actualAnswer)"
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AnswerView")
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func answerOneButtonTapped(_ sender: UIButton) {
        animateButton(answerOneButton)
        numberTapped = false
        selectedAnswer = randomNumber1
        userSelection()
    }
    @IBAction func answerTwoButtonTapped(_ sender: UIButton) {
        animateButton(answerTwoButton)
        numberTapped = false
        selectedAnswer = randomNumber2
        userSelection()
    }
    @IBAction func answerThreeButtonTapped(_ sender: UIButton) {
        animateButton(answerThreeButton)
        numberTapped = false
        selectedAnswer = randomNumber3
        userSelection()
    }
    @IBAction func answerFourButtonTapped(_ sender: UIButton) {
        animateButton(answerFourButton)
        numberTapped = false
        selectedAnswer = randomNumber4
        userSelection()
    }
    
    @IBAction func homebuttonTapped(_ sender: UIButton) {
        animateButton(homeButton)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
