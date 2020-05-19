//
//  Statistics.swift
//  Multiplication Cards
//
//  Created by Joseph Szafarowicz on 1/5/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
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

// Check for purchases
var bundlePurchased: Bool = false

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

// Int answer values
var topRandomNumber: Int = 0
var bottomRandomNumber: Int = 0

var previousTopNumber: Int = 0
var previousBottomNumber: Int = 0
var previousAnswer: Int = 0

var actualAnswer: Int = 0
var answerOne: Int = 0
var answerTwo: Int = 0
var answerThree: Int = 0
var answerFour: Int = 0

// Values for correct and incorrect answers
var correctAnswers: Int = 0
var incorrectAnswers: Int = 0
var percentScoreValue: Int = 0
var finalScoreValue: Int = 0

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

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
