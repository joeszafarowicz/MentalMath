//
//  InformationViewController.swift
//  MathWiz
//
//  Created by Joseph Szafarowicz on 5/10/18.
//  Copyright © 2018 Joseph Szafarowicz. All rights reserved.
//

import UIKit

class QuestionInfoViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.layer.cornerRadius = 15.0
        background.clipsToBounds = true
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        animateButton(closeButton)
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
