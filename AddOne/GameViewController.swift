//
//  ViewController.swift
//  AddOne
//
//  Created by Jennifer Bailey on 4/20/21.
//

import UIKit

class GameViewController: UIViewController {
    var score = 0
    updateScoreLabel()
    updateNumberLabel()
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var numberTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateScoreLabel() {
        scoreLabel?.text = String(score)
    }
    
    func updateNumberLabel() {
        numberLabel?.text = String.randomNumber(length: 4)
    }


}

