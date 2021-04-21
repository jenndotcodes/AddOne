//
//  ViewController.swift
//  AddOne
//
//  Created by Jennifer Bailey on 4/20/21.
//

import UIKit

class GameViewController: UIViewController {
    var score = 0
    var guessNumbers : [Int] = []
    var timer:Timer?
    var seconds = 60
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var numberTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomArray()
        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
    }
    
    func updateScoreLabel() {
        scoreLabel?.text = String(score)
    }
    
    func updateNumberLabel() {
        numberLabel?.text = arrayToString()
    }
    
    @IBAction func inputFieldDidChange(_ sender: Any) {
        guard let numberText = numberLabel?.text, let inputText = numberTextView?.text else {
            return
        }
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.seconds == 0 {
                    self.finishGame()
                } else if self.seconds <= 60 {
                    self.seconds -= 1
                    self.updateTimeLabel()
                }
            }
        }
    }
    
    func createRandomArray() {
        for i in 0..<4 {
            guessNumbers.append(Int.random(in: 0...9))
        }
    }
    
    func arrayToString() -> String {
        var result = ""
        for i in 0..<4 {
            result += "\(guessNumbers[i])"
        }
        return result
    }
    
    func updateTimeLabel() {
        
        let min = (seconds / 60) % 60
        let sec = seconds % 60
        
        timeLabel?.text = String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
    
    func finishGame()
    {
        timer?.invalidate()
        timer = nil
        let alert = UIAlertController(title: "Time's Up!", message: "Your time is up! You got a score of \(score) points. Awesome!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK, start new game", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        createRandomArray()
        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
    }
    
}

