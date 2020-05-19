//
//  ViewController.swift
//  Multiplication Cards
//
//  Created by Joseph Szafarowicz on 12/14/17.
//  Copyright © 2017 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import GameKit

class HomeViewController: UIViewController, GKGameCenterControllerDelegate {
    
    // Button outlets
    @IBOutlet weak var additionStartButton: UIButton!
    @IBOutlet weak var subtractionStartButton: UIButton!
    @IBOutlet weak var multiplicationStartButton: UIButton!
    @IBOutlet weak var divisionStartButton: UIButton!
    @IBOutlet weak var mixedOpsStartButton: UIButton!
    @IBOutlet weak var practiceStartButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    // Game center
    var gcEnabled = Bool() // Check if the user has Game Center enabled
    var gcDefaultLeaderBoard = String() // Check the default leaderboardID
    
    var LEADERBOARD_ID = ""

    // Checks leaderboard ID and sets accordingly
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Call the GC authentication controller
//        authenticateLocalPlayer()
//
//        // Check for leaderboard ID then set score
//        checkLeaderboardID()
    }
    
    // MARK: - AUTHENTICATE LOCAL PLAYER
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                // 1. Show login if player is not logged in
                self.present(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.isAuthenticated) {
                // 2. Player is already authenticated & logged in, load game center
                self.gcEnabled = true
                
                // Get the default leaderboard ID
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if error != nil { print(error!)
                    } else { self.gcDefaultLeaderBoard = leaderboardIdentifer! }
                })
            } else {
                // 3. Game center is not enabled on the users device
                self.gcEnabled = false
                print("Local player could not be authenticated!")
                print(error!)
            }
        }
    }
    
    // Delegate to dismiss the GC controller
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    // Resets values for startup
    func setupForStart() {
        // Everytime start button is tapped all values reset
        checkQuestion = 0
        selectedAnswer = 0
        actualAnswer = 0
        correctAnswers = 0
        incorrectAnswers = 0
        finalTime = "0:00"
        minutesTime = 0
        secondsTime = 0
        score = 0
    }
    
    func showQuestionType() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "QuestionType") as! QuestionTypesViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    // Operation button actions
    @IBAction func additonStartButtonTapped(_ sender: UIButton) {
        animateButton(additionStartButton)
        setupForStart()
        checkForOperation = "+"
        operationStatement = "addition"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }
    @IBAction func subtractionStartButtonTapped(_ sender: UIButton) {
        animateButton(subtractionStartButton)
        setupForStart()
        checkForOperation = "-"
        operationStatement = "subtraction"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }
    @IBAction func multiplicationStartButtonTapped(_ sender: UIButton) {
        animateButton(multiplicationStartButton)
        setupForStart()
        checkForOperation = "x"
        operationStatement = "multiplication"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }
    @IBAction func divisionStartButtonTapped(_ sender: UIButton) {
        animateButton(divisionStartButton)
        setupForStart()
        checkForOperation = "÷"
        operationStatement = "division"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }

    @IBAction func mixedStartOperationsTapped(_ sender: UIButton) {
        animateButton(mixedOpsStartButton)
        setupForStart()
        checkForOperation = "Mixed"
        operationStatement = "mixed"
        defaults.set(true, forKey: "mixedOperations")
        showQuestionType()
    }

    @IBAction func practiceStartButtonTapped(_ sender: UIButton) {
        animateButton(practiceStartButton)
        practiceMode = true
        defaults.set(false, forKey: "mixedOperations")
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "Practice") as! PracticeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        animateButton(settingsButton)
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "Settings") as! SettingsViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

