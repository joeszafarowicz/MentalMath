//
//  ChooseModeViewController.swift
//  MathWiz
//
//  Created by Joseph Szafarowicz on 5/9/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class QuestionTypesViewController: UIViewController {
    
    // Button outlets
    @IBOutlet weak var normalQuestionButton: UIButton!
    @IBOutlet weak var timedQuestionButton: UIButton!
    @IBOutlet weak var missingNumberQuestionButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Get operation statement then set button background images
    func setButtons(operation: String) {
        normalQuestionButton.setBackgroundImage(UIImage(named: "\(operation) Normal.pdf"), for: .normal)
        timedQuestionButton.setBackgroundImage(UIImage(named: "\(operation) Timed.pdf"), for: .normal)
        missingNumberQuestionButton.setBackgroundImage(UIImage(named: "\(operation) Missing.pdf"), for: .normal)
        
        if operation.isEmpty == true {
            normalQuestionButton.setBackgroundImage(UIImage(named: "subtraction Normal.pdf"), for: .normal)
            timedQuestionButton.setBackgroundImage(UIImage(named: "subtraction Timed.pdf"), for: .normal)
            missingNumberQuestionButton.setBackgroundImage(UIImage(named: "subtraction Missing.pdf"), for: .normal)
        }
    }
    
    func showReadyView() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "ReadyView") as! ReadyViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func normalQuestionButtonTapped(_ sender: UIButton) {
        animateButton(normalQuestionButton)
        defaults.set(true, forKey: "normalQuestion")
        defaults.set(false, forKey: "timedQuestion")
        defaults.set(false, forKey: "missingNumberQuestion")
        showReadyView()
    }
    
    @IBAction func timedQuestionButtonTapped(_ sender: UIButton) {
        animateButton(timedQuestionButton)
        defaults.set(false, forKey: "normalQuestion")
        defaults.set(true, forKey: "timedQuestion")
        defaults.set(false, forKey: "missingNumberQuestion")
        showReadyView()
    }
    
    @IBAction func missingNumberQuestionButtonTapped(_ sender: UIButton) {
        animateButton(missingNumberQuestionButton)
        defaults.set(false, forKey: "normalQuestion")
        defaults.set(false, forKey: "timedQuestion")
        defaults.set(true, forKey: "missingNumberQuestion")
        showReadyView()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        animateButton(closeButton)
        checkForOperation.removeAll()
        operationStatement.removeAll()
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let viewController = story.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        animateButton(infoButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuestionInfo")
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
