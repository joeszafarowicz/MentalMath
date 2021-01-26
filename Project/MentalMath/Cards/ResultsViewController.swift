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

    @IBOutlet weak var questionsCompletedLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var incorrectAnswersLabel: UILabel!
    @IBOutlet weak var accuracyLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var leaderboardButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateLocalPlayer()
        checkLeaderboardID()
        view.backgroundColor = backgroundColor

        finalScoreValue = checkQuestion - incorrectAnswers
        finalPercentValue = Double(finalScoreValue) / Double(checkQuestion) * 100
        let finalPercentValue2 = String(format: "%.0f", finalPercentValue)
        
        questionsCompletedLabel.text = "Questions completed: \(checkQuestion)"
        correctAnswersLabel.text = "Correct Answers: \(correctAnswers)"
        incorrectAnswersLabel.text = "Incorrect Answers: \(incorrectAnswers)"
        accuracyLabel.text = "Accuracy: \(finalPercentValue2)%"
        
        scoreLabel.isHidden = false
        scoreLabel.text = "Score: \(score)"
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
        unlockAchievements()
        defaults.set((defaults.integer(forKey: "userViewedCounter") + 1), forKey: "userViewedCounter")
        if defaults.integer(forKey: "userViewedCounter") == 5 {
            SKStoreReviewController.requestReview()
        }
    }
    
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if((ViewController) != nil) {
                self.present(ViewController!, animated: true, completion: nil)
            } else if (localPlayer.isAuthenticated) {
                gcEnabled = true
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if error != nil { print(error!)
                    } else { gcDefaultLeaderBoard = leaderboardIdentifer! }
                })
            } else {
                gcEnabled = false
                print("Local player could not be authenticated!")
                print(error!)
            }
        }
    }
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    func unlockAchievements(){
        if correctAnswers == 5 {
            let achievement = GKAchievement(identifier: "com.mentalmath.fiveoutoffive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 10 {
            let achievement = GKAchievement(identifier: "com.mentalmath.tenoutoften")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 15 {
            let achievement = GKAchievement(identifier: "com.mentalmath.fifteenoutoffifteen")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 20 {
            let achievement = GKAchievement(identifier: "com.mentalmath.twentyoutoftwenty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 25 {
            let achievement = GKAchievement(identifier: "com.mentalmath.twentyfiveoutoftwentyfive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 30 {
            let achievement = GKAchievement(identifier: "com.mentalmath.thirtyoutofthirty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 35 {
            let achievement = GKAchievement(identifier: "com.mentalmath.thirtyfiveoutofthirtyfive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 40 {
            let achievement = GKAchievement(identifier: "com.mentalmath.fourtyoutoffourty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 45 {
            let achievement = GKAchievement(identifier: "com.mentalmath.fourtyfiveoutoffourtyfive")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
        if correctAnswers == 50 {
            let achievement = GKAchievement(identifier: "com.mentalmath.fiftyoutoffifty")
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = true
            
            GKAchievement.report([achievement], withCompletionHandler: nil)
        }
    }
    
    @IBAction func leaderboardButtonTapped(_ sender: AnyObject) {
        animateButton(leaderboardButton)
        let gcVC = GKGameCenterViewController()
        gcVC.gameCenterDelegate = self
        gcVC.viewState = .leaderboards
        gcVC.leaderboardIdentifier = LEADERBOARD_ID
        present(gcVC, animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        animateButton(doneButton)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
