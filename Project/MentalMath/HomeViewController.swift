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

    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var mixedButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        authenticateLocalPlayer()
        checkLeaderboardID()
    }
    
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
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    func showQuestionType() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "QuestionType") as! QuestionTypesViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func additonButtonTapped(_ sender: UIButton) {
        animateButton(additionButton)
        checkForOperation = "+"
        operationStatement = "addition"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }
    @IBAction func subtractionButtonTapped(_ sender: UIButton) {
        animateButton(subtractionButton)
        checkForOperation = "-"
        operationStatement = "subtraction"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }
    @IBAction func multiplicationButtonTapped(_ sender: UIButton) {
        animateButton(multiplicationButton)
        checkForOperation = "x"
        operationStatement = "multiplication"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }
    @IBAction func divisionButtonTapped(_ sender: UIButton) {
        animateButton(divisionButton)
        checkForOperation = "÷"
        operationStatement = "division"
        defaults.set(false, forKey: "mixedOperations")
        showQuestionType()
    }

    @IBAction func mixedButtonTapped(_ sender: UIButton) {
        animateButton(mixedButton)
        checkForOperation = "Mixed"
        operationStatement = "mixed"
        defaults.set(true, forKey: "mixedOperations")
        showQuestionType()
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

