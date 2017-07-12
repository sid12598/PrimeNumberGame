//
//  ViewController.swift
//  PrimeNumberGame
//
//  Created by Siddharth Poduval on 12/07/17.
//  Copyright © 2017 Siddharth Poduval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var score = 0
    var expected: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func trueButton(_ sender: UIButton) {
        checkAnswer(chosen: true)
    }
    @IBAction func falseButton(_ sender: UIButton) {
        checkAnswer(chosen: false)
    }
    
    func loadQuestion() {
        let question = Question()
        questionNumber.text = String(question.number)
        expected = question.answer()
    }
    
    func checkAnswer(chosen: Bool?) {
        trueButton.isEnabled = false
        falseButton.isEnabled = false
        if expected == chosen {
            score += 1
            questionNumber.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        else {
            questionNumber.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
        scoreLabel.text = "Your Score is: \(score)"
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.loadQuestion()
            self.trueButton.isEnabled = true
            self.falseButton.isEnabled = true
        })
    }
}

