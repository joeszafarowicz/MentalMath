//
//  Functions.swift
//  MentalMath
//
//  Created by Joseph Szafarowicz on 3/12/21.
//  Copyright © 2021 Joseph Szafarowicz. All rights reserved.
//

import UIKit

func checkLeaderboardID() {
    
    let questions = (defaults.integer(forKey: "levelDifficulty"))
    switch questions {
    case 5:
        LEADERBOARD_ID = "com.mentalmath.fivequestions"
    case 10:
        LEADERBOARD_ID = "com.mentalmath.tenquestions"
    case 15:
        LEADERBOARD_ID = "com.mentalmath.fifteenquestions"
    case 20:
        LEADERBOARD_ID = "com.mentalmath.twentyquestions"
    case 25:
        LEADERBOARD_ID = "com.mentalmath.twentyfivequestions"
    case 30:
        LEADERBOARD_ID = "com.mentalmath.thirtyfivequestions"
    case 35:
        LEADERBOARD_ID = "com.mentalmath.fourtyquestions"
    case 40:
        LEADERBOARD_ID = "com.mentalmath.fourtyquestions"
    case 45:
        LEADERBOARD_ID = "com.mentalmath.fourtyfivequestions"
    case 50:
        LEADERBOARD_ID = "com.mentalmath.fiftyquestions"
    default:
        LEADERBOARD_ID = "com.mentalmath.tenquestions"
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
