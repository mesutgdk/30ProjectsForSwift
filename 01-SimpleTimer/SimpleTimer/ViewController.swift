//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Mesut Gedik on 28.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!

    
    var isPause = true
    var count : Double = 0
    var timer : Timer = Timer()
    var countString : String = ""



    @IBAction func playButtonPressed(_ sender: UIButton) {
        if isPause {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            isPause = false
    }
}
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        if !isPause {
            timer.invalidate()
            isPause = true
           
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        if count > 0 {
        count = 0
        timer.invalidate()
        timerLabel.text = "0.0"
        isPause = true
        }
    }
    
    @ objc func update () -> Void {
        count = count + 0.1
        
        countString = ("\(round(count*10)/10)")
        timerLabel.text = countString
    }
    
    }


