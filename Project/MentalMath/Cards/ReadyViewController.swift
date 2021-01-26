//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class ReadyViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        setupButton(button: startButton, title: "Start", answerButton: false)
        setupButton(button: stopButton, title: "Stop", answerButton: false)
        
        checkQuestion = 0
        selectedAnswer = 0
        actualAnswer = 0
        correctAnswers = 0
        incorrectAnswers = 0
        score = 0
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        animateButton(startButton)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "CardView") as! CardViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        animateButton(stopButton)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "QuestionType") as! QuestionTypesViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
