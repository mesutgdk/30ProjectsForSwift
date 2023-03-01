//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Mesut Gedik on 28.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startButtonPressed = UIButton(type: .custom)
        startButtonPressed.setImage(UIImage(named: "play.png"), for: UIControl.State.normal)
        
        let stopButtonPressed = UIButton(type: .custom)
        stopButtonPressed.setImage(UIImage(named: "pause.png"), for: UIControl.State.normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func resetButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
    }
    
   
    
}

