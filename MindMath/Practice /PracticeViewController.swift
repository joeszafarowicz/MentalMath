//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {
    
    @IBOutlet weak var additionStartButton: UIButton!
    @IBOutlet weak var subtractionStartButton: UIButton!
    @IBOutlet weak var multiplicationStartButton: UIButton!
    @IBOutlet weak var divisionStartButton: UIButton!
    
    func setupForPracticeStart() {
        // Everytime start button is tapped reset all values 
        checkQuestion = 0
        selectedAnswer = 0
        actualAnswer = 0
        correctAnswers = 0
        incorrectAnswers = 0
    }
    
    func showPracticeTypesView() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "PracticeTypes") as! PracticeTypesViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func additonStartButtonTapped(_ sender: UIButton) {
        animateButton(additionStartButton)
        setupForPracticeStart()
        checkForOperation = "+"
        operationStatement = "addition"
        showPracticeTypesView()
    }
    @IBAction func subtractionStartButtonTapped(_ sender: UIButton) {
        animateButton(subtractionStartButton)
        setupForPracticeStart()
        checkForOperation = "-"
        operationStatement = "subtraction"
        showPracticeTypesView()
    }
    @IBAction func multiplicationStartButtonTapped(_ sender: UIButton) {
        animateButton(multiplicationStartButton)
        setupForPracticeStart()
        checkForOperation = "x"
        operationStatement = "multiplication"
        showPracticeTypesView()
    }
    @IBAction func divisionStartButtonTapped(_ sender: UIButton) {
        animateButton(divisionStartButton)
        setupForPracticeStart()
        checkForOperation = "÷"
        operationStatement = "division"
        showPracticeTypesView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
