//
//  ViewController.swift
//  EggTimer
//
//  Created by Jay Ramirez on 03/13/2022.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
//    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720 ]
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7 ]
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!


    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timerLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            let percentageProgress = Float(Float(secondsPassed)/Float(totalTime))
            progressBar.progress = percentageProgress
            
            secondsPassed += 1
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            timerLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                       player = try! AVAudioPlayer(contentsOf: url!)
                       player.play()
        }
    }
}
