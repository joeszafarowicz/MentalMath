//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import Foundation

let defaults = UserDefaults.standard
var fullVersion: Bool = false

// Review Counter
var userViewedCounter: Int = 0

// Practice
var practiceMode: Bool = false
var practiceNumber: Int = 0
var practiceQuestionsAmount: Int = 0
var checkForPracticeOperation: String = ""
var practiceOperationStatement: String = ""

// Checks for what scores page to open
var checkPage: String = ""

//  Checks for level difficulty
var levelOne: Bool = false
var levelTwo: Bool = false
var levelThree: Bool = false
var levelFour: Bool = false
var levelFive: Bool = false
var levelSix: Bool = false

// Checks for how many questions
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

// Check for operation string and bools
var checkForOperation: String = ""
var operationStatement: String = ""
var mixedOperations: Bool = false

// Int value counts everytime user pressed button
var questionNumber: Int = 0
var checkQuestion: Int = 0

// Refresh answers
var continueTimer: Bool = false
var numberTapped: Bool = false

// Int to check values. Answer, Clock, Score, Time
var selectedAnswer: Int = 0
var equation: Int = 0
var score: Int = 0
var missingNumberSequenceTop: Bool = false

// Question number values
var topRandomNumber: Int = 0
var bottomRandomNumber: Int = 0
var previousTopNumber: Int = 0
var previousBottomNumber: Int = 0

// Answer values
var correctAnswers: Int = 0
var incorrectAnswers: Int = 0
var previousAnswer: Int = 0
var actualAnswer: Int = 0
var percentScoreValue: Int = 0
var finalScoreValue: Int = 0
var finalPercentValue: Double = 0

// Values for question overview
var question: String = ""

// Timer values
var minutesTime = 0
var secondsTime = 0
var scoreSeconds = 0
var finalTime: String = "0:00"

// Mode values
var normalQuestion: Bool = false
var timedQuestion: Bool = true
var missingNumberQuestion: Bool = false
var missingNumber: Int = 0

// Game center values
var gcEnabled = Bool()
var gcDefaultLeaderBoard = String()
var LEADERBOARD_ID = ""

// Checks leaderboard ID to set correct one after user answers all questions
func checkLeaderboardID() {
    if (defaults.bool(forKey: "fiveQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.fivequestions"
    }
    if (defaults.bool(forKey: "tenQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.tenquestions"
    }
    if (defaults.bool(forKey: "fifteenQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.fifteenquestions"
    }
    if (defaults.bool(forKey: "twentyQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.twentyquestions"
    }
    if (defaults.bool(forKey: "twentyfiveQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.twentyfivequestions"
    }
    if (defaults.bool(forKey: "thirtyQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.thirtynquestions"
    }
    if (defaults.bool(forKey: "thirtyfiveQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.thirtyfivequestions"
    }
    if (defaults.bool(forKey: "fourtyQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.fourtyquestions"
    }
    if (defaults.bool(forKey: "fourtyfiveQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.fourtyfivequestions"
    }
    if (defaults.bool(forKey: "fiftyQuestions") == true) {
        LEADERBOARD_ID = "com.mindmath.fiftyquestions"
    }
}

// Animate buttons when tapped
func animateButton(_ sender: UIButton) {
    UIButton.animate(withDuration: 0.1,
    animations: { sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96) },
    completion: { finish in UIButton.animate(withDuration: 0.1, animations: { sender.transform = CGAffineTransform.identity })
    })
}
