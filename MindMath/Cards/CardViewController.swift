//
//  CardsViewController.swift
//  Multiplication Cards
//
//  Created by Joseph Szafarowicz on 12/15/17.
//  Copyright © 2017 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    let defaults = UserDefaults.standard
    var timer = Timer()
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var cardNumberButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answerLabel.text?.removeAll()
        scoreButton.setTitle("\(score)", for: .normal)

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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getPossibleAnswers()
        
        // If normal challenge is active show score
        if (defaults.bool(forKey: "normalQuestion") == true) {
            scoreButton.setTitle("Score: \(score)", for: .normal)
        }
        
        // If missing number challenge is active hide number
        if (defaults.bool(forKey: "missingNumberQuestion") == true) {
            if (defaults.bool(forKey: "missingNumberSequenceTop") == true) {
                numberLabel.text = "\(bottomRandomNumber) \(checkForOperation) ? = \(actualAnswer)"
            } else {
                numberLabel.text = "\(topRandomNumber) \(checkForOperation) ? = \(actualAnswer)"
            }
            
            if operationStatement == "subtraction" {
                if topRandomNumber > bottomRandomNumber {
                    numberLabel.text = "\(topRandomNumber) \(checkForOperation) ? = \(actualAnswer)"
                } else {
                    numberLabel.text = "\(bottomRandomNumber) \(checkForOperation) ? = \(actualAnswer)"
                }
            }
            
            scoreButton.setTitle("Score: \(score)", for: .normal)
        }
        
        // If timed challenge is active hide score
        if (defaults.bool(forKey: "timedQuestion") == true) {
            scoreButton.setTitle("", for: .normal)
        }

        if (defaults.bool(forKey: "timedQuestion") == true) {
            timerAction()
            
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
            
            if numberTapped == true {
                // Start timer
                self.timer.invalidate() // In case this button is tapped multiple times
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
            }
        }
    }

    
    // Action for timer
    @objc func timerAction() {
        scoreSeconds += 1
        secondsTime += 1
        finalTime = "\(minutesTime):\(secondsTime)"
        
        if secondsTime < 10 {
            finalTime = "\(minutesTime):0\(secondsTime)"
        }
        
        if secondsTime >= 60 {
            minutesTime += 1
            secondsTime = 0
            finalTime = "\(minutesTime):\(secondsTime)"
            
            if secondsTime < 10 {
                finalTime = "\(minutesTime):0\(secondsTime)"
            }
        }
        
        if minutesTime >= 1 {
            secondsTime += 1
            finalTime = "\(minutesTime):\(secondsTime)"
            
            if secondsTime < 10 {
                finalTime = "\(minutesTime):0\(secondsTime)"
            }
        }
        timeButton.setTitle("\(finalTime)", for: .normal)
    }
    
    // Checks for operatin to use when calculating answer
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
        numberLabel.text = "\(topRandomNumber) \(checkForOperation) \(bottomRandomNumber)"
    }
    
    // Sets up questions
    func questionOrder() {
        // Sets question numbers
        setNumbers()
        // Default settings
        // Questions
        if (defaults.bool(forKey: "fiveQuestions") == false) && (defaults.bool(forKey: "tenQuestions") == false) && (defaults.bool(forKey: "fifteenQuestions") == false) && (defaults.bool(forKey: "twentyQuestions") == false) &&
            (defaults.bool(forKey: "twentyfiveQuestions") == false) &&
            (defaults.bool(forKey: "thirtyQuestions") == false) &&
            (defaults.bool(forKey: "thirtyfiveQuestions") == false) &&
            (defaults.bool(forKey: "fourtyQuestions") == false) &&
            (defaults.bool(forKey: "fourtyfiveQuestions") == false) &&
            (defaults.bool(forKey: "fiftyQuestions") == false) {
            defaults.set(false, forKey: "fiveQuestions")
            defaults.set(true, forKey: "tenQuestions")
            defaults.set(false, forKey: "fifteenQuestions")
            defaults.set(false, forKey: "twentyQuestions")
            defaults.set(false, forKey: "twentyfiveQuestions")
            defaults.set(false, forKey: "thirtyQuestions")
            defaults.set(false, forKey: "thirtyfiveQuestions")
            defaults.set(false, forKey: "fourtyQuestions")
            defaults.set(false, forKey: "fourtyfiveQuestions")
            defaults.set(false, forKey: "fiftyQuestions")
        }
        // Numbers
        if (defaults.bool(forKey: "levelOne") == false) && (defaults.bool(forKey: "levelTwo") == false) && (defaults.bool(forKey: "levelThree") == false) && (defaults.bool(forKey: "levelFour") == false) &&
            (defaults.bool(forKey: "levelFive") == false) &&
            (defaults.bool(forKey: "levelSix") == false) {
            defaults.set(false, forKey: "levelOne")
            defaults.set(true, forKey: "levelTwo")
            defaults.set(false, forKey: "levelThree")
            defaults.set(false, forKey: "levelFour")
            defaults.set(false, forKey: "levelFive")
            defaults.set(false, forKey: "levelSix")
        }
        
        // Checks for number of questions
        if (defaults.bool(forKey: "fiveQuestions") == true) {
            checkEquation()
            questionNumber = 5
        }
        if (defaults.bool(forKey: "tenQuestions") == true) {
            checkEquation()
            questionNumber = 10
        }
        if (defaults.bool(forKey: "fifteenQuestions") == true) {
            checkEquation()
            questionNumber = 15
        }
        if (defaults.bool(forKey: "twentyQuestions") == true) {
            checkEquation()
            questionNumber = 20
        }
        if (defaults.bool(forKey: "twentyfiveQuestions") == true) {
            checkEquation()
            questionNumber = 25
        }
        if (defaults.bool(forKey: "thirtyQuestions") == true) {
            checkEquation()
            questionNumber = 30
        }
        if (defaults.bool(forKey: "thirtyfiveQuestions") == true) {
            checkEquation()
            questionNumber = 35
        }
        if (defaults.bool(forKey: "fourtyQuestions") == true) {
            checkEquation()
            questionNumber = 40
        }
        if (defaults.bool(forKey: "fourtyfiveQuestions") == true) {
            checkEquation()
            questionNumber = 45
        }
        if (defaults.bool(forKey: "fiftyQuestions") == true) {
            checkEquation()
            questionNumber = 50
        }
        
        if checkQuestion >= questionNumber {
            timer.invalidate()
            finalTime = (timeButton.titleLabel?.text)!
            checkQuestion = 0
        } else if checkQuestion < questionNumber {
            if (defaults.bool(forKey: "timedQuestion") == true) {
                cardNumberButton.setTitle("Card: \(checkQuestion + 1)/\(questionNumber)", for: .normal)
            } else {
                timeButton.setTitle("Card: \(checkQuestion + 1)/\(questionNumber)", for: .normal)
                cardNumberButton.isHidden = true
            }
        }
    }
    
    func getRandomNumber() -> Int {
        var drawRandomNumber: Int = 0
        
        if (defaults.bool(forKey: "levelOne") == true) {
            drawRandomNumber = 11
        }
        if (defaults.bool(forKey: "levelTwo") == true) {
            drawRandomNumber = 21
        }
        if (defaults.bool(forKey: "levelThree") == true) {
            drawRandomNumber = 51
        }
        if (defaults.bool(forKey: "levelFour") == true) {
            drawRandomNumber = 101
        }
        if (defaults.bool(forKey: "levelFive") == true) {
            drawRandomNumber = 501
        }
        if (defaults.bool(forKey: "levelSix") == true) {
            drawRandomNumber = 1001
        }
        
        return Int(arc4random_uniform(UInt32(drawRandomNumber)))
    }
    
    // Checks and sets question numbers
    func setNumbers() {
        topRandomNumber = getRandomNumber()
        bottomRandomNumber = getRandomNumber()
        
        if topRandomNumber == 0 && bottomRandomNumber == 0 {
            topRandomNumber = getRandomNumber()
            bottomRandomNumber = getRandomNumber()
        } else if previousTopNumber == topRandomNumber {
            topRandomNumber = getRandomNumber()
            bottomRandomNumber = getRandomNumber()
        } else if previousTopNumber == bottomRandomNumber {
            topRandomNumber = getRandomNumber()
            bottomRandomNumber = getRandomNumber()
        } else if previousAnswer == actualAnswer {
            topRandomNumber = getRandomNumber()
            bottomRandomNumber = getRandomNumber()
        }
    }
    
    // Sets button titles
    func setAnswerTitle() {
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
        }
    }
    
    // Function to get all possible answers to set button titles
    func getPossibleAnswers() {
        questionOrder()
        
        // Gets value of actual answer and sets to button title
        if checkForOperation.contains("+") {
            setAnswerTitle()
            actualAnswer = topRandomNumber + bottomRandomNumber
        }
        if checkForOperation.contains("-") {
            setAnswerTitle()
            actualAnswer = topRandomNumber - bottomRandomNumber
        }
        if checkForOperation.contains("x") {
            setAnswerTitle()
            actualAnswer = topRandomNumber * bottomRandomNumber
        }
        if checkForOperation.contains("÷") {
            setAnswerTitle()
            actualAnswer = topRandomNumber / bottomRandomNumber
        }
        question = "\(topRandomNumber) \(checkForOperation) \(bottomRandomNumber) = \(actualAnswer)"
    }
    
    // Button answers
    @IBAction func oneButtonTapped(_ sender: UIButton) {
        animateButton(oneButton)
        answerLabel.text?.append("1")
        numberTapped = true
    }
    
    @IBAction func twoButtonTapped(_ sender: UIButton) {
        animateButton(twoButton)
        answerLabel.text?.append("2")
    }
    
    @IBAction func threeButtonTapped(_ sender: UIButton) {
        animateButton(threeButton)
        answerLabel.text?.append("3")
    }
    
    @IBAction func fourButtonTapped(_ sender: UIButton) {
        animateButton(fourButton)
        answerLabel.text?.append("4")
    }
    
    @IBAction func fiveButtonTapped(_ sender: UIButton) {
        animateButton(fiveButton)
        answerLabel.text?.append("5")
    }
    
    @IBAction func sixButtonTapped(_ sender: UIButton) {
        animateButton(sixButton)
        answerLabel.text?.append("6")
    }
    
    @IBAction func sevenButtonTapped(_ sender: UIButton) {
        animateButton(sevenButton)
        answerLabel.text?.append("7")
    }
    
    @IBAction func eightButtonTapped(_ sender: UIButton) {
        animateButton(eightButton)
        answerLabel.text?.append("8")
    }
    
    @IBAction func nineButtonTapped(_ sender: UIButton) {
        animateButton(nineButton)
        answerLabel.text?.append("9")
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        animateButton(zeroButton)
        answerLabel.text?.append("0")
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        animateButton(cancelButton)
        answerLabel.text = ""
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        animateButton(doneButton)
        
        if answerLabel.text?.isEmpty == false {
            numberTapped = true
            selectedAnswer = Int(answerLabel.text ?? "0")!
            
            // If timer is on stop timer
            if (defaults.bool(forKey: "timedQuestion") == true) {
                self.timer.invalidate()
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AnswerView")
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func homebuttonTapped(_ sender: UIButton) {
        animateButton(homeButton)
        self.timer.invalidate()
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
