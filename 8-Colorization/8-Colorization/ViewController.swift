//
//  ViewController.swift
//  8-Colorization
//
//  Created by Mesut Gedik on 19.03.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var backgroundImage: UIImageView!
    
    var gradientLayer: CAGradientLayer?
    
    var player : AVAudioPlayer!
    
    var sleepSong : String = "ninni"
    
    var songRestart : Bool = false
    
    var songPaused : Bool = true
    
    
    var timer : Timer?
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.setImage(UIImage(named: "playButton.jpg"), for: UIControl.State.normal)
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradientLayer?.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer?.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer?.frame = view.bounds
        view.layer.insertSublayer(gradientLayer!, at: 0)
    }
    override func viewWillAppear(_ animated: Bool) {
    }

    @IBAction func playButton(_ sender: UIButton) {
    playSound(soundName: sleepSong)
    }
    
    func playSound(soundName: String) {
        if songPaused == true {
            let url = Bundle.main.url(forResource: soundName, withExtension: ".mp3")
            do{
                player = try AVAudioPlayer(contentsOf: url!)
                player.play()
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
            songPaused = false
            let animation = CABasicAnimation(keyPath: "colors")
            animation.fromValue = [UIColor.red.cgColor, UIColor.yellow.cgColor]
            animation.toValue = [UIColor.blue.cgColor, UIColor.green.cgColor]
            animation.autoreverses = true
            animation.duration = 1.0
            animation.repeatCount = .infinity
            gradientLayer?.add(animation, forKey: "gradientAnimation")
            
        } else if songRestart == false, songPaused == false{
            player.pause()
            songRestart = true
         //   print("song is paused \(!songPaused)")
            
        } else if songRestart == true{
            player.play(atTime: player.deviceCurrentTime)

            songRestart = false
        } else {
            print ("nothing to do")
        }
       
        
    }
   
}
  
