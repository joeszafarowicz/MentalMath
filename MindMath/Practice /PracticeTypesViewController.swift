//
//  PracticeTypesViewController.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class PracticeTypesViewController: UIViewController {

    @IBOutlet weak var practiceNumberLabel: UILabel!
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var fiveQuestionsButton: UIButton!
    @IBOutlet weak var tenQuestionsButton: UIButton!
    @IBOutlet weak var fifteenQuestionsButton: UIButton!
    @IBOutlet weak var twentyQuestionsButton: UIButton!
    @IBOutlet weak var twentyFiveQuestionsButton: UIButton!
    @IBOutlet weak var thirtyQuestionsButton: UIButton!
    @IBOutlet weak var thirtyFiveQuestionsButton: UIButton!
    @IBOutlet weak var fourtyQuestionsButton: UIButton!
    @IBOutlet weak var fourtyFiveQuestionsButton: UIButton!
    @IBOutlet weak var fiftyQuestionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        practiceNumberLabel.text = "What number would you like to practice \(practiceOperationStatement) with?"
        
        // If full version is purchased enable all question amounts
        if defaults.bool(forKey: "fullVersion") == false {
            thirtyQuestionsButton.isEnabled = false
            thirtyFiveQuestionsButton.isEnabled = false
            fourtyQuestionsButton.isEnabled = false
            fourtyFiveQuestionsButton.isEnabled = false
            fiftyQuestionsButton.isEnabled = false
        }
    }
    
    @IBAction func numberTextFieldTapped(_ sender: UITextField) {
        practiceNumber = Int(numberTextField.text!)!
    }
    
    func checkQuestionAmount() {
        questionsLabel.text = "How many questions would you like to answer? \n\(practiceQuestionsAmount)"
    }
    
    // MARK: Question buttons
    @IBAction func fiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fiveQuestionsButton)
        practiceQuestionsAmount = 5
        checkQuestionAmount()
    }
    
    @IBAction func tenQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(tenQuestionsButton)
        practiceQuestionsAmount = 10
        checkQuestionAmount()
    }
    
    @IBAction func fifteenQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fifteenQuestionsButton)
        practiceQuestionsAmount = 15
        checkQuestionAmount()
    }
    
    @IBAction func twentyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(twentyQuestionsButton)
        practiceQuestionsAmount = 20
        checkQuestionAmount()
    }
    
    @IBAction func twentyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(twentyFiveQuestionsButton)
        practiceQuestionsAmount = 25
        checkQuestionAmount()
    }
    
    @IBAction func thirtyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(thirtyQuestionsButton)
        practiceQuestionsAmount = 30
        checkQuestionAmount()
    }
    
    @IBAction func thirtyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(thirtyFiveQuestionsButton)
        practiceQuestionsAmount = 35
        checkQuestionAmount()
    }
    
    @IBAction func fourtyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fourtyQuestionsButton)
        practiceQuestionsAmount = 40
        checkQuestionAmount()
    }
    
    @IBAction func fourtyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fourtyFiveQuestionsButton)
        practiceQuestionsAmount = 45
        checkQuestionAmount()
    }
    
    @IBAction func fiftyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fiftyQuestionsButton)
        practiceQuestionsAmount = 50
        checkQuestionAmount()
    }
    
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        animateButton(homeButton)
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        animateButton(startButton)
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "PracticeCardView") as! PracticeCardViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
