//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var userAnswerLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        previousTopNumber = topRandomNumber
        previousBottomNumber = bottomRandomNumber
        previousAnswer = actualAnswer
        checkQuestion += 1
        
        if (defaults.bool(forKey: "missingNumberQuestion") == true) {
            actualAnswer = missingNumber
        }
        
        // Check answer that user has selected
        if selectedAnswer == actualAnswer {
            correctAnswers += 1
            answerImageView.image = UIImage(systemName: "checkmark")
            answerImageView.tintColor = additionColor
            userAnswerLabel.text = "\(question)"
            correctAnswerLabel.text = "\(question)"
        } else {
            incorrectAnswers += 1
            answerImageView.image = UIImage(systemName: "xmark")
            answerImageView.tintColor = subtractionColor
            userAnswerLabel.text = "\(userSelectedAnswer)"
            correctAnswerLabel.text = "\(question)"
        }
        
        score = correctAnswers - incorrectAnswers
        
        if score <= 0 {
            score = 0
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        animateButton(nextButton)
        
        if (defaults.bool(forKey: "fiveQuestions") == true) {
            questionNumber = 5
        }
        if (defaults.bool(forKey: "tenQuestions") == true) {
            questionNumber = 10
        }
        if (defaults.bool(forKey: "fifteenQuestions") == true) {
            questionNumber = 15
        }
        if (defaults.bool(forKey: "twentyQuestions") == true) {
            questionNumber = 20
        }
        if (defaults.bool(forKey: "twentyfiveQuestions") == true) {
            questionNumber = 25
        }
        if (defaults.bool(forKey: "thirtyQuestions") == true) {
            questionNumber = 30
        }
        if (defaults.bool(forKey: "thirtyfiveQuestions") == true) {
            questionNumber = 35
        }
        if (defaults.bool(forKey: "fourtyQuestions") == true) {
            questionNumber = 40
        }
        if (defaults.bool(forKey: "fourtyfiveQuestions") == true) {
            questionNumber = 45
        }
        if (defaults.bool(forKey: "fiftyQuestions") == true) {
            questionNumber = 50
        }
        
        if checkQuestion == questionNumber {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let viewController = story.instantiateViewController(withIdentifier: "Results") as! ResultsViewController
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } else {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let viewController = story.instantiateViewController(withIdentifier: "CardView") as! CardViewController
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
}
