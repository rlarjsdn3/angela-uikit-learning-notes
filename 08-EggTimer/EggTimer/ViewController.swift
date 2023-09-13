//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 420,
        "Hard": 720
    ]
    
    var timer: Timer?
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer?.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
    }
    
    @objc func updateTimer() {
        secondsPassed += 1
        let percentageProgress = Float(secondsPassed) / Float(totalTime)
        progressBar.progress = percentageProgress
        
        if secondsPassed >= totalTime {
            timer?.invalidate()
            titleLabel.text = "DONE!"
            playAlarm()
        }
    }
    
    func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        let player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
