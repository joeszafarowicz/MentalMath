//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import Foundation

let backgroundColor = UIColor(rgb: 0x464D77)
let additionColor = UIColor(rgb: 0x06D6A0)
let subtractionColor = UIColor(rgb: 0xEF476F)
let multiplicationColor = UIColor(rgb: 0x118AB2)
let divisionColor = UIColor(rgb: 0x957FEF)

let defaults = UserDefaults.standard
var checkPage: String = ""

var userViewedCounter: Int = 0
var userSelectedAnswer: String = ""

var levelOne: Bool = false
var levelTwo: Bool = false
var levelThree: Bool = false
var levelFour: Bool = false
var levelFive: Bool = false
var levelSix: Bool = false

var fiveQuestions: Bool = false
var tenQuestions: Bool = false
var fifteenQuestions: Bool = false
var twentyQuestions: Bool = false
var twentyfiveQuestions: Bool = false
var thirtyQuestions: Bool = false
var thirtyfiveQuestions: Bool = false
var fourtyQuestions: Bool = false
var fourtyfiveQuestions: Bool = false
var fiftyQuestions: Bool = false

var checkForOperation: String = ""
var operationStatement: String = ""
var mixedOperations: Bool = false

var questionNumber: Int = 0
var checkQuestion: Int = 0

var numberTapped: Bool = false

var selectedAnswer: Int = 0
var equation: Int = 0
var score: Int = 0
var missingNumberSequenceTop: Bool = false

var topRandomNumber: Int = 0
var bottomRandomNumber: Int = 0
var previousTopNumber: Int = 0
var previousBottomNumber: Int = 0

var correctAnswers: Int = 0
var incorrectAnswers: Int = 0
var previousAnswer: Int = 0
var actualAnswer: Int = 0
var percentScoreValue: Int = 0
var finalScoreValue: Int = 0
var finalPercentValue: Double = 0

var question: String = ""
var normalQuestion: Bool = false
var missingNumberQuestion: Bool = false
var missingNumber: Int = 0

var gcEnabled = Bool()
var gcDefaultLeaderBoard = String()
var LEADERBOARD_ID = ""

func checkLeaderboardID() {
    if (defaults.bool(forKey: "fiveQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.fivequestions"
    }
    if (defaults.bool(forKey: "tenQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.tenquestions"
    }
    if (defaults.bool(forKey: "fifteenQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.fifteenquestions"
    }
    if (defaults.bool(forKey: "twentyQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.twentyquestions"
    }
    if (defaults.bool(forKey: "twentyfiveQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.twentyfivequestions"
    }
    if (defaults.bool(forKey: "thirtyQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.thirtynquestions"
    }
    if (defaults.bool(forKey: "thirtyfiveQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.thirtyfivequestions"
    }
    if (defaults.bool(forKey: "fourtyQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.fourtyquestions"
    }
    if (defaults.bool(forKey: "fourtyfiveQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.fourtyfivequestions"
    }
    if (defaults.bool(forKey: "fiftyQuestions") == true) {
        LEADERBOARD_ID = "com.mentalmath.fiftyquestions"
    }
}

func animateButton(_ sender: UIButton) {
    UIButton.animate(withDuration: 0.1,
    animations: { sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96) },
    completion: { finish in UIButton.animate(withDuration: 0.1, animations: { sender.transform = CGAffineTransform.identity })
    })
}

func setupButton(button: UIButton!, title: String, answerButton: Bool) {
    button.setTitle(title, for: .normal)
    button.layer.cornerRadius = 20
    button.clipsToBounds = true
    button.backgroundColor = UIColor.systemBackground
    
    if answerButton == true {
        if operationStatement == "addition" {
            button.setTitleColor(additionColor, for: .normal)
        } else if operationStatement == "subtraction" {
            button.setTitleColor(subtractionColor, for: .normal)
        } else if operationStatement == "multiplication" {
            button.setTitleColor(multiplicationColor, for: .normal)
        } else if operationStatement == "division" {
            button.setTitleColor(divisionColor, for: .normal)
        }
    } else {
        button.setTitleColor(backgroundColor, for: .normal)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
