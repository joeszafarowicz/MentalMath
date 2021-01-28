//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class QuestionInfoViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = backgroundColor
        backgroundView.layer.cornerRadius = 15.0
        backgroundView.clipsToBounds = true
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        animateButton(closeButton)
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
