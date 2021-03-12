//
//  QuestionSettingsViewController.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var levelOneButton: UIButton!
    @IBOutlet weak var levelTwoButton: UIButton!
    @IBOutlet weak var levelThreeButton: UIButton!
    @IBOutlet weak var levelFourButton: UIButton!
    @IBOutlet weak var levelFiveButton: UIButton!
    @IBOutlet weak var levelSixButton: UIButton!
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
        view.backgroundColor = backgroundColor
        setupButton(button: closeButton, title: "Close", answerButton: false)
    }
    
    func checkLevel() {
        let level = (defaults.integer(forKey: "levelDifficulty"))
        switch level {
        case 1:
            levelOneButton.setTitleColor(backgroundColor, for: .normal)
            levelTwoButton.setTitleColor(UIColor.white, for: .normal)
            levelThreeButton.setTitleColor(UIColor.white, for: .normal)
            levelFourButton.setTitleColor(UIColor.white, for: .normal)
            levelFiveButton.setTitleColor(UIColor.white, for: .normal)
            levelSixButton.setTitleColor(UIColor.white, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        case 2:
            levelOneButton.setTitleColor(UIColor.white, for: .normal)
            levelTwoButton.setTitleColor(backgroundColor, for: .normal)
            levelThreeButton.setTitleColor(UIColor.white, for: .normal)
            levelFourButton.setTitleColor(UIColor.white, for: .normal)
            levelFiveButton.setTitleColor(UIColor.white, for: .normal)
            levelSixButton.setTitleColor(UIColor.white, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        case 3:
            levelOneButton.setTitleColor(UIColor.white, for: .normal)
            levelTwoButton.setTitleColor(UIColor.white, for: .normal)
            levelThreeButton.setTitleColor(backgroundColor, for: .normal)
            levelFourButton.setTitleColor(UIColor.white, for: .normal)
            levelFiveButton.setTitleColor(UIColor.white, for: .normal)
            levelSixButton.setTitleColor(UIColor.white, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        case 4:
            levelOneButton.setTitleColor(UIColor.white, for: .normal)
            levelTwoButton.setTitleColor(UIColor.white, for: .normal)
            levelThreeButton.setTitleColor(UIColor.white, for: .normal)
            levelFourButton.setTitleColor(backgroundColor, for: .normal)
            levelFiveButton.setTitleColor(UIColor.white, for: .normal)
            levelSixButton.setTitleColor(UIColor.white, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        case 5:
            levelOneButton.setTitleColor(UIColor.white, for: .normal)
            levelTwoButton.setTitleColor(UIColor.white, for: .normal)
            levelThreeButton.setTitleColor(UIColor.white, for: .normal)
            levelFourButton.setTitleColor(UIColor.white, for: .normal)
            levelFiveButton.setTitleColor(backgroundColor, for: .normal)
            levelSixButton.setTitleColor(UIColor.white, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        case 6:
            levelOneButton.setTitleColor(UIColor.white, for: .normal)
            levelTwoButton.setTitleColor(UIColor.white, for: .normal)
            levelThreeButton.setTitleColor(UIColor.white, for: .normal)
            levelFourButton.setTitleColor(UIColor.white, for: .normal)
            levelFiveButton.setTitleColor(UIColor.white, for: .normal)
            levelSixButton.setTitleColor(backgroundColor, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
        default:
            levelOneButton.setTitleColor(backgroundColor, for: .normal)
            levelTwoButton.setTitleColor(UIColor.white, for: .normal)
            levelThreeButton.setTitleColor(UIColor.white, for: .normal)
            levelFourButton.setTitleColor(UIColor.white, for: .normal)
            levelFiveButton.setTitleColor(UIColor.white, for: .normal)
            levelSixButton.setTitleColor(UIColor.white, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
    
    func checkQuestionAmount() {
        if (defaults.integer(forKey: "numberOfQuestions")) == 5 {
            fiveQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 10 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 15 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 20 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 25 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 30 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 35 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 40 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 45 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        } else if (defaults.integer(forKey: "numberOfQuestions")) == 50 {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
        } else {
            fiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            tenQuestionsButton.setTitleColor(backgroundColor, for: .normal)
            fifteenQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            twentyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            thirtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fourtyFiveQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            fiftyQuestionsButton.setTitleColor(UIColor.white, for: .normal)
            
            fiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            tenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            fifteenQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            twentyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            thirtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fourtyFiveQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            fiftyQuestionsButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
    
    @IBAction func levelOneButtonTapped(_ sender: UIButton) {
        animateButton(levelOneButton)
        defaults.setValue(1, forKey: "levelDifficulty")
        checkLevel()
    }
    
    @IBAction func levelTwoButtonTapped(_ sender: UIButton) {
        animateButton(levelTwoButton)
        defaults.setValue(2, forKey: "levelDifficulty")
        checkLevel()
    }
    
    @IBAction func levelThreeButtonTapped(_ sender: UIButton) {
        animateButton(levelThreeButton)
        defaults.setValue(3, forKey: "levelDifficulty")
        checkLevel()
    }
    
    @IBAction func levelFourButtonTapped(_ sender: UIButton) {
        animateButton(levelFourButton)
        defaults.setValue(4, forKey: "levelDifficulty")
        checkLevel()
    }
    
    @IBAction func levelFiveButtonTapped(_ sender: UIButton) {
        animateButton(levelFiveButton)
        defaults.setValue(5, forKey: "levelDifficulty")
        checkLevel()
    }
    
    @IBAction func levelSixButtonTapped(_ sender: UIButton) {
        animateButton(levelSixButton)
        defaults.setValue(6, forKey: "levelDifficulty")
        checkLevel()
    }
    
    @IBAction func fiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fiveQuestionsButton)
        defaults.setValue(5, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func tenQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(tenQuestionsButton)
        defaults.setValue(10, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func fifteenQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fifteenQuestionsButton)
        defaults.setValue(15, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func twentyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(twentyQuestionsButton)
        defaults.setValue(20, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func twentyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(twentyFiveQuestionsButton)
        defaults.setValue(25, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func thirtyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(thirtyQuestionsButton)
        defaults.setValue(30, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func thirtyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(thirtyFiveQuestionsButton)
        defaults.setValue(35, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func fourtyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fourtyQuestionsButton)
        defaults.setValue(40, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func fourtyFiveQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fourtyFiveQuestionsButton)
        defaults.setValue(45, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func fiftyQuestionsButtonTapped(_ sender: UIButton) {
        animateButton(fiftyQuestionsButton)
        defaults.setValue(50, forKey: "numberOfQuestions")
        checkQuestionAmount()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        animateButton(closeButton)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
