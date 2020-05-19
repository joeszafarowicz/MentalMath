//
//  QuestionSettingsViewController.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class QuestionSettingsViewController: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var levelOneButton: UIButton!
    @IBOutlet weak var levelTwoButton: UIButton!
    @IBOutlet weak var levelThreeButton: UIButton!
    @IBOutlet weak var levelFourButton: UIButton!
    @IBOutlet weak var levelFiveButton: UIButton!
    @IBOutlet weak var levelSixButton: UIButton!
    
    @IBOutlet weak var questionAmountLabel: UILabel!
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
        checkLevel()
        checkQuestionAmount()
        
        if defaults.bool(forKey: "fullVersion") == false {
            levelFourButton.isEnabled = false
            levelFiveButton.isEnabled = false
            levelSixButton.isEnabled = false
            thirtyQuestionsButton.isEnabled = false
            thirtyFiveQuestionsButton.isEnabled = false
            fourtyQuestionsButton.isEnabled = false
            fourtyFiveQuestionsButton.isEnabled = false
            fiftyQuestionsButton.isEnabled = false
        }
    }
    
    func checkLevel() {
        var level: Int = 0
        
        if defaults.bool(forKey: "levelOne") == true {
            level = 1
        } else if defaults.bool(forKey: "levelTwo") == true {
            level = 2
        } else if defaults.bool(forKey: "levelThree") == true {
            level = 3
        } else if defaults.bool(forKey: "levelFour") == true {
            level = 4
        } else if defaults.bool(forKey: "levelFive") == true {
            level = 5
        } else if defaults.bool(forKey: "levelSix") == true {
            level = 6
        } else {
            level = 1
        }
        levelLabel.text = "Level \(level)"
    }
    
    func checkQuestionAmount() {
        var amount: Int = 0
        
        if defaults.bool(forKey: "fiveQuestions") == true {
            amount = 5
        } else if defaults.bool(forKey: "tenQuestions") == true {
            amount = 10
        } else if defaults.bool(forKey: "fifteenQuestions") == true {
           amount = 15
        } else if defaults.bool(forKey: "twentyQuestions") == true {
            amount = 20
        } else if defaults.bool(forKey: "twentyfiveQuestions") == true {
            amount = 25
        } else if defaults.bool(forKey: "thirtyQuestions") == true {
            amount = 30
        } else if defaults.bool(forKey: "thirtyfiveQuestions") == true {
            amount = 35
        } else if defaults.bool(forKey: "fourtyQuestions") == true {
            amount = 40
        } else if defaults.bool(forKey: "fourtyfiveQuestions") == true {
            amount = 45
        } else if defaults.bool(forKey: "fiftyQuestions") == true {
            amount = 50
        } else {
            amount = 10
        }
        questionAmountLabel.text = "Question Amount \n\(amount)"
    }
    
    // MARK: Level buttons
    @IBAction func levelOneButtonTapped(_ sender: UIButton) {
        animateButton(levelOneButton)
        defaults.set(true, forKey: "levelOne")
        defaults.set(false, forKey: "levelTwo")
        defaults.set(false, forKey: "levelThree")
        defaults.set(false, forKey: "levelFour")
        defaults.set(false, forKey: "levelFive")
        defaults.set(false, forKey: "levelSix")
        checkLevel()
    }
    
    @IBAction func levelTwoButtonTapped(_ sender: UIButton) {
        animateButton(levelTwoButton)
        defaults.set(false, forKey: "levelOne")
        defaults.set(true, forKey: "levelTwo")
        defaults.set(false, forKey: "levelThree")
        defaults.set(false, forKey: "levelFour")
        defaults.set(false, forKey: "levelFive")
        defaults.set(false, forKey: "levelSix")
        checkLevel()
    }
    
    @IBAction func levelThreeButtonTapped(_ sender: UIButton) {
        animateButton(levelThreeButton)
        defaults.set(false, forKey: "levelOne")
        defaults.set(false, forKey: "levelTwo")
        defaults.set(true, forKey: "levelThree")
        defaults.set(false, forKey: "levelFour")
        defaults.set(false, forKey: "levelFive")
        defaults.set(false, forKey: "levelSix")
        checkLevel()
    }
    
    @IBAction func levelFourButtonTapped(_ sender: UIButton) {
        animateButton(levelFourButton)
        defaults.set(false, forKey: "levelOne")
        defaults.set(false, forKey: "levelTwo")
        defaults.set(false, forKey: "levelThree")
        defaults.set(true, forKey: "levelFour")
        defaults.set(false, forKey: "levelFive")
        defaults.set(false, forKey: "levelSix")
        checkLevel()
    }
    
    @IBAction func levelFiveButtonTapped(_ sender: UIButton) {
        animateButton(levelFiveButton)
        defaults.set(false, forKey: "levelOne")
        defaults.set(false, forKey: "levelTwo")
        defaults.set(false, forKey: "levelThree")
        defaults.set(false, forKey: "levelFour")
        defaults.set(true, forKey: "levelFive")
        defaults.set(false, forKey: "levelSix")
        checkLevel()
    }
    
    @IBAction func levelSixButtonTapped(_ sender: UIButton) {
        animateButton(levelSixButton)
        defaults.set(false, forKey: "levelOne")
        defaults.set(false, forKey: "levelTwo")
        defaults.set(false, forKey: "levelThree")
        defaults.set(false, forKey: "levelFour")
        defaults.set(false, forKey: "levelFive")
        defaults.set(true, forKey: "levelSix")
        checkLevel()
    }
    
    // MARK: Question buttons
    @IBAction func fiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fiveQuestionsButton)
        defaults.set(true, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func tenQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(tenQuestionsButton)
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
        checkQuestionAmount()
    }
    
    @IBAction func fifteenQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fifteenQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(true, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func twentyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(twentyQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(true, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func twentyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(twentyFiveQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(true, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func thirtyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(thirtyQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
        defaults.set(true, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func thirtyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(thirtyFiveQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(true, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func fourtyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fourtyQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(true, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func fourtyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fourtyFiveQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(true, forKey: "fourtyfiveQuestions")
        defaults.set(false, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func fiftyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fiftyQuestionsButton)
        defaults.set(false, forKey: "fiveQuestions")
        defaults.set(false, forKey: "tenQuestions")
        defaults.set(false, forKey: "fifteenQuestions")
        defaults.set(false, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
        defaults.set(false, forKey: "thirtyQuestions")
        defaults.set(false, forKey: "thirtyfiveQuestions")
        defaults.set(false, forKey: "fourtyQuestions")
        defaults.set(false, forKey: "fourtyfiveQuestions")
        defaults.set(true, forKey: "fiftyQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        animateButton(homeButton)
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
