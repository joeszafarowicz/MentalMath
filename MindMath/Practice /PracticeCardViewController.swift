//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class PracticeCardViewController: UIViewController {
    
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
        practiceMode = true
        
        answerLabel.text?.removeAll()
        scoreButton.isHidden = true
        cardNumberButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getPossibleAnswers()
        defaults.set(true, forKey: "practiceMode")
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
        setNumbers()
        questionNumber = practiceQuestionsAmount
        checkEquation()
        
        if checkQuestion >= questionNumber {
            checkQuestion = 0
        } else if checkQuestion < questionNumber {
            timeButton.setTitle("Card: \(checkQuestion + 1)/\(questionNumber)", for: .normal)
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
        topRandomNumber = practiceNumber
        bottomRandomNumber = getRandomNumber()
        
        if topRandomNumber == 0 && bottomRandomNumber == 0 {
            bottomRandomNumber = getRandomNumber()
        } else if previousTopNumber == topRandomNumber || previousTopNumber == bottomRandomNumber || previousBottomNumber == topRandomNumber || previousBottomNumber == topRandomNumber{
            bottomRandomNumber = getRandomNumber()
        }
    }
    
    // Gets the actual answer to question
    func getPossibleAnswers() {
        questionOrder()

        if checkForOperation.contains("+") {
            actualAnswer = topRandomNumber + bottomRandomNumber
        }
        if checkForOperation.contains("-") {
            actualAnswer = topRandomNumber - bottomRandomNumber
        }
        if checkForOperation.contains("x") {
            actualAnswer = topRandomNumber * bottomRandomNumber
        }
        if checkForOperation.contains("÷") {
            actualAnswer = topRandomNumber / bottomRandomNumber
        }
        question = "\(topRandomNumber) \(checkForOperation) \(bottomRandomNumber) = \(actualAnswer)"
    }
    
    // Button answers
    @IBAction func oneButtonTapped(_ sender: UIButton) {
        animateButton(oneButton)
        answerLabel.text?.append("1")
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
        numberTapped = false
        selectedAnswer = Int(answerLabel.text ?? "0")!
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AnswerView")
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func homebuttonTapped(_ sender: UIButton) {
        animateButton(homeButton)
        
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
