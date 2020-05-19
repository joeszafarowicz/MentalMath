//
//  FinalScoreViewController.swift
//  Multiplication Cards
//
//  Created by Joseph Szafarowicz on 1/10/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import GameKit
import StoreKit

var currentVC: UIViewController!

class ResultsViewController: UIViewController, GKGameCenterControllerDelegate {
    
    // Button outlets
    @IBOutlet weak var leaderboardsButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    // Game center
    var gcEnabled = Bool() // Check if the user has Game Center enabled
    var gcDefaultLeaderBoard = String() // Check the default leaderboardID
    
    var LEADERBOARD_ID = ""
    
    var finalScoreValue: Int = 0
    var finalPercentValue: Double = 0

    @IBOutlet weak var questionsCompletedLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var incorrectAnswersLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
            LEADERBOARD_ID = "com.mindmath.thirtyquestions"
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
        if (defaults.bool(forKey: "timedQuestion") == true) {
            LEADERBOARD_ID = "com.mindmath.timedquestions"
        }
        if (defaults.bool(forKey: "missingNumberQuestion") == true) {
            LEADERBOARD_ID = "com.mindmath.missingnumberquestions"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if practiceMode == true {
            // Get accuracy percent value
            var finalScoreValue: Int = 0
            var finalPercentValue: Double = 0
            
            finalScoreValue = checkQuestion - incorrectAnswers
            finalPercentValue = Double(finalScoreValue) / Double(checkQuestion) * 100
            let finalPercentValue2 = String(format: "%.0f", finalPercentValue)
            
            questionsCompletedLabel.text = "Chosen number: \(practiceNumber)"
            questionsCompletedLabel.text = "Questions completed: \(checkQuestion)"
            correctAnswersLabel.text = "Correct Answers: \(correctAnswers)"
            incorrectAnswersLabel.text = "Incorrect Answers: \(incorrectAnswers)"
            accuracyLabel.text = "Accuracy: \(finalPercentValue2)%"
            timeLabel.isHidden = true
            scoreLabel.isHidden = true
            leaderboardsButton.isHidden = true
        } else {
            // Get accuracy percent value
            finalScoreValue = checkQuestion - incorrectAnswers
            finalPercentValue = Double(finalScoreValue) / Double(checkQuestion) * 100
            let finalPercentValue2 = String(format: "%.0f", finalPercentValue)
            
            // Set label values
            questionsCompletedLabel.text = "Questions completed: \(checkQuestion)"
            correctAnswersLabel.text = "Correct Answers: \(correctAnswers)"
            incorrectAnswersLabel.text = "Incorrect Answers: \(incorrectAnswers)"
            accuracyLabel.text = "Accuracy: \(finalPercentValue2)%"
            
            if (defaults.bool(forKey: "timedQuestion") == true) {
                timeLabel.isHidden = false
                scoreLabel.isHidden = true
                timeLabel.text = "Time: \(finalTime)"
            } else if (defaults.bool(forKey: "timedQuestion") == false) {
                timeLabel.isHidden = true
                scoreLabel.isHidden = false
                scoreLabel.text = "Score: \(score)"
            }
            
            // Call the GC authentication controller
            authenticateLocalPlayer()
            
            // Check for leaderboard ID then set score
            checkLeaderboardID()
            
            if (defaults.bool(forKey: "timedQuestion") == true) {
                score = scoreSeconds
            }
            
            if score > 0 {
                // Submit score to GC leaderboard
                let bestScoreInt = GKScore(leaderboardIdentifier: LEADERBOARD_ID)
                bestScoreInt.value = Int64(score)
                GKScore.report([bestScoreInt]) { (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        print("Best Score submitted to your Leaderboard!")
                    }
                }
            }
            
            // Unlocks achievements for correct answers
            unlockAchievements()
            
            defaults.set((defaults.integer(forKey: "userViewedCounter") + 1), forKey: "userViewedCounter")
            
            // If user has viewed view 5 times request review
            if defaults.integer(forKey: "userViewedCounter") == 5 {
                SKStoreReviewController.requestReview()
            }
        }
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
    
    // Checks correct answers and unlocks corresponding achievements
    func unlockAchievements(){
        if correctAnswers == 5 {
            let achievement = GKAchievement(identifier: "com.mindmath.fiveoutoffive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 10 {
            let achievement = GKAchievement(identifier: "com.mindmath.tenoutoften")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 15 {
            let achievement = GKAchievement(identifier: "com.mindmath.fifteenoutoffifteen")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 20 {
            let achievement = GKAchievement(identifier: "com.mindmath.twentyoutoftwenty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 25 {
            let achievement = GKAchievement(identifier: "com.mindmath.twentyfiveoutoftwentyfive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 30 {
            let achievement = GKAchievement(identifier: "com.mindmath.thirtyoutofthirty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 35 {
            let achievement = GKAchievement(identifier: "com.mindmath.thirtyfiveoutofthirtyfive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 40 {
            let achievement = GKAchievement(identifier: "com.mindmath.fourtyoutoffourty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 45 {
            let achievement = GKAchievement(identifier: "com.mindmath.fourtyfiveoutoffourtyfive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 50 {
            let achievement = GKAchievement(identifier: "com.mindmath.fiftyoutoffifty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
    }
    
    // User returns home
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        animateButton(doneButton)
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    // Open game center leaderboard
    @IBAction func checkGameCenterLeaderboardTapped(_ sender: AnyObject) {
        animateButton(leaderboardsButton)
        let gcVC = GKGameCenterViewController()
        gcVC.gameCenterDelegate = self
        gcVC.viewState = .leaderboards
        gcVC.leaderboardIdentifier = LEADERBOARD_ID
        present(gcVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
