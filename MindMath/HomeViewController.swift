//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import GameKit

class HomeViewController: UIViewController, GKGameCenterControllerDelegate {

    @IBOutlet weak var additionStartButton: UIButton!
    @IBOutlet weak var subtractionStartButton: UIButton!
    @IBOutlet weak var multiplicationStartButton: UIButton!
    @IBOutlet weak var divisionStartButton: UIButton!
    @IBOutlet weak var mixedOpsStartButton: UIButton!
    @IBOutlet weak var practiceStartButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call the GC authentication controller
        authenticateLocalPlayer()

        // Check for leaderboard ID then set score
        checkLeaderboardID()
    }
    
    // MARK: - Authenticate local player for leaderboards
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                // Show login if player is not logged in
                self.present(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.isAuthenticated) {
                // Player is already authenticated & logged in, load game center
                gcEnabled = true
                
                // Get the default leaderboard ID
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if error != nil { print(error!)
                    } else { gcDefaultLeaderBoard = leaderboardIdentifer! }
                })
            } else {
                // Game center is not enabled on the users device
                gcEnabled = false
                print("Local player could not be authenticated!")
                print(error!)
            }
        }
    }
    
    // Delegate to dismiss the GC controller
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    // Resets values for startup everytime start button is tapped
    func setupForStart() {
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
    
    // Presents the question types view
    func showQuestionType() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "QuestionType") as! QuestionTypesViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    // MARK: - Button actions used when a user chooses an operation
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

