//
//  ViewController.swift
//  AddOne
//
//  Created by Jennifer Bailey on 4/20/21.
//

import UIKit

class GameViewController: UIViewController {
    var guessNumbers: [Int] = []
    var score = 0
    var timer:Timer?
    var seconds = 20
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }
    
    func resetGame() {
        
        guessNumbers = createRandomArray()
        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
        numberTextView.text = ""
        
    }
    
    func updateScoreLabel() {
        scoreLabel?.text = String(score)
    }
    
    func updateNumberLabel() {
        numberLabel?.text = arrayToString(array: guessNumbers)
    }
    
    @IBAction func inputFieldDidChange(_ sender: Any) {
        guard let inputText = numberTextView?.text else {
            return
        }
        
        guard inputText.count == 4 else {
            return
        }
        
        var usersGuess = stringToArray(string: inputText)
        
        var isCorrect = true;
        for i in 0..<4 {
            if usersGuess[i] == 0 {
                usersGuess[i] = 10
            }
            if(guessNumbers[i]+1 != usersGuess[i]) {
                isCorrect = false
                break
            }
        }
        
        if isCorrect {
            score += 1
        }
        else {
            score -= 1
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
        resetGame()
    }
    
    func createRandomArray() -> [Int] {
        var array : [Int] = []
        for _ in 0..<4 {
            array.append(Int.random(in: 0...9))
        }
        return array
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
        alert.addAction(UIAlertAction(title: "OK, start new game", style: .default, handler: {_ in
            self.score = 0
            self.seconds = 20
            self.resetGame()
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func arrayToString(array: [Int]) -> String {
        var result = ""
        for i in 0..<4 {
            result += "\(array[i])"
        }
        return result
    }
    
    func stringToArray(string: String) -> [Int] {
        var array : [Int] = []
        for char in string {
            array.append(Int(String(char)) ?? 0)
        }
        
        for i in 0..<4 {
            print(array[i])
        }
        return array
    }
}

