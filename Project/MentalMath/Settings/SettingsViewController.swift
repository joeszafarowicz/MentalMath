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
        if defaults.bool(forKey: "levelOne") == true {
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
        } else if defaults.bool(forKey: "levelTwo") == true {
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
        } else if defaults.bool(forKey: "levelThree") == true {
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
        } else if defaults.bool(forKey: "levelFour") == true {
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
        } else if defaults.bool(forKey: "levelFive") == true {
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
        } else if defaults.bool(forKey: "levelSix") == true {
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
        } else {
            levelOneButton.setTitleColor(backgroundColor, for: .normal)
            levelTwoButton.setTitleColor(UIColor.white, for: .normal)
            levelThreeButton.setTitleColor(UIColor.white, for: .normal)
            levelFourButton.setTitleColor(UIColor.white, for: .normal)
            levelFiveButton.setTitleColor(UIColor.white, for: .normal)
            levelSixButton.setTitleColor(UIColor.white, for: .normal)
            
            levelOneButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelTwoButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelThreeButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFourButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelFiveButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            levelSixButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
        }
    }
    
    func checkQuestionAmount() {
        if defaults.bool(forKey: "fiveQuestions") == true {
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
        } else if defaults.bool(forKey: "tenQuestions") == true {
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
        } else if defaults.bool(forKey: "fifteenQuestions") == true {
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
        } else if defaults.bool(forKey: "twentyQuestions") == true {
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
        } else if defaults.bool(forKey: "twentyfiveQuestions") == true {
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
        } else if defaults.bool(forKey: "thirtyQuestions") == true {
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
        } else if defaults.bool(forKey: "thirtyfiveQuestions") == true {
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
        } else if defaults.bool(forKey: "fourtyQuestions") == true {
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
        } else if defaults.bool(forKey: "fourtyfiveQuestions") == true {
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
        } else if defaults.bool(forKey: "fiftyQuestions") == true {
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
        defaults.set(true, forKey: "twentyQuestions")
        defaults.set(false, forKey: "twentyfiveQuestions")
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
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        animateButton(closeButton)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
