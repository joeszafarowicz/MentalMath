//
//  AnswerViewController.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.layer.cornerRadius = 15.0
        background.clipsToBounds = true
        
        previousTopNumber = topRandomNumber
        previousBottomNumber = bottomRandomNumber
        checkQuestion += 1
        
        if selectedAnswer == actualAnswer {
            correctAnswers += 1
            correctLabel.text = "Correct!"
            problemLabel.text = "\(question)"
        } else {
            incorrectAnswers += 1
            correctLabel.text = "Oops!"
            problemLabel.text = "\(question)"
        }
        
        if practiceMode == false {
            if incorrectAnswers > correctAnswers {
                score = 0
            } else {
                score = correctAnswers - incorrectAnswers
            }
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        animateButton(doneButton)
        
        if checkQuestion == questionNumber || checkQuestion == practiceQuestionsAmount {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let viewController = story.instantiateViewController(withIdentifier: "Results") as! ResultsViewController
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } else {
            if practiceMode == true {
                let story = UIStoryboard(name: "Main", bundle:nil)
                let viewController = story.instantiateViewController(withIdentifier: "PracticeCardView") as! PracticeCardViewController
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
}
