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

let backgroundColor = UIColor(rgb: 0x464D77)
let additionColor = UIColor(rgb: 0x06D6A0)
let subtractionColor = UIColor(rgb: 0xEF476F)
let multiplicationColor = UIColor(rgb: 0x118AB2)
let divisionColor = UIColor(rgb: 0x957FEF)

var gcEnabled = Bool()
var gcDefaultLeaderBoard = String()
var LEADERBOARD_ID = ""

var userSelectedAnswer: String = ""
var checkPage: String = ""
var checkForOperation: String = ""
var operationStatement: String = ""
var question: String = ""

var levelDifficulty: Int = 1
var numberOfQuestions: Int = 10
var randomNumber1: Int = 0
var randomNumber2: Int = 0
var randomNumber3: Int = 0
var randomNumber4: Int = 0
var questionNumber: Int = 0
var checkQuestion: Int = 0
var selectedAnswer: Int = 0
var equation: Int = 0
var score: Int = 0
var topRandomNumber: Int = 0
var bottomRandomNumber: Int = 0
var previousTopNumber: Int = 0
var previousBottomNumber: Int = 0
var correctAnswers: Int = 0
var incorrectAnswers: Int = 0
var previousAnswer: Int = 0
var actualAnswer: Int = 0
var finalScoreValue: Int = 0
var finalPercentValue: Double = 0
var missingNumber: Int = 0

var mixedOperations: Bool = false
var numberTapped: Bool = false
var missingNumberSequenceTop: Bool = false
var normalQuestion: Bool = false
var missingNumberQuestion: Bool = false
