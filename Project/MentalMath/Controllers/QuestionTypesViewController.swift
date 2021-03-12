//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class QuestionTypesViewController: UIViewController {

    @IBOutlet weak var normalQuestionButton: UIButton!
    @IBOutlet weak var missingNumberQuestionButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        setupButton(button: normalQuestionButton, title: "Normal", answerButton: false)
        setupButton(button: missingNumberQuestionButton, title: "Missing", answerButton: false)
        setupButton(button: infoButton, title: "Info", answerButton: false)
        setupButton(button: closeButton, title: "Close", answerButton: false)
    }
    
    func presentReadyView() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "ReadyView") as! ReadyViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func normalQuestionButtonTapped(_ sender: UIButton) {
        animateButton(normalQuestionButton)
        defaults.set(true, forKey: "normalQuestion")
        defaults.set(false, forKey: "missingNumberQuestion")
        presentReadyView()
    }
    
    @IBAction func missingNumberQuestionButtonTapped(_ sender: UIButton) {
        animateButton(missingNumberQuestionButton)
        defaults.set(false, forKey: "normalQuestion")
        defaults.set(true, forKey: "missingNumberQuestion")
        presentReadyView()
    }
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        animateButton(infoButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuestionInfo")
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        animateButton(closeButton)
        checkForOperation.removeAll()
        operationStatement.removeAll()
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
