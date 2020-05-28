//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit
import GameKit
import StoreKit

class ResultsViewController: UIViewController, GKGameCenterControllerDelegate {

    @IBOutlet weak var leaderboardsButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!

    @IBOutlet weak var questionsCompletedLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var incorrectAnswersLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
                gcEnabled = true
                
                // Get the default leaderboard ID
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if error != nil { print(error!)
                    } else { gcDefaultLeaderBoard = leaderboardIdentifer! }
                })
            } else {
                // 3. Game center is not enabled on the users device
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
