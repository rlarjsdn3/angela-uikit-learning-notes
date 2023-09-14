//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false
        )

    }
    
    @objc func updateUI() {
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        
        firstAnswerButton.setTitle(quizBrain.getAnswerText()[0], for: .normal)
        secondAnswerButton.setTitle(quizBrain.getAnswerText()[1], for: .normal)
        thirdAnswerButton.setTitle(quizBrain.getAnswerText()[2], for: .normal)
        
        firstAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
    }
    
}

