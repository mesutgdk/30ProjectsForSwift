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
    
    let gradientLayer = CAGradientLayer()
    
    
    var player : AVAudioPlayer!
    
    var sleepSong : String = "ninni"
    
    var songRestart : Bool = false
    
    var songPaused : Bool = true
    
    var backgroundColor: (red: CGFloat, green: CGFloat,blue: CGFloat,alpha: CGFloat)! {
        didSet {
            let color1 = UIColor(red: backgroundColor.blue,
                                 green: backgroundColor.green,
                                 blue: 0,
                                 alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: backgroundColor.blue,
                                 alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }
    
    var timer : Timer?
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.setImage(UIImage(named: "playButton.jpg"), for: UIControl.State.normal)
    
    }
    override func viewWillAppear(_ animated: Bool) {
       randomColor()
    }

    @IBAction func playButton(_ sender: UIButton) {
    playSound(soundName: sleepSong)
    }
    
    func playSound(soundName: String) {
        if songPaused == true {
            let url = Bundle.main.url(forResource: soundName, withExtension: ".mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            songPaused = false
            if (timer == nil) {
                Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(ViewController.randomColor), userInfo: nil, repeats: true)
            }
            
            let redValue = CGFloat(drand48())
            let blueValue =  CGFloat(drand48())
            let greenValue = CGFloat(drand48())
            
            self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
            
            //graditent color layer
            gradientLayer.frame = view.bounds
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
          
            self.view.layer.insertSublayer(gradientLayer, at: 0)
           // print("song is started \(!songPaused)")

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
    
    @objc func randomColor() {
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        
        backgroundColor = (redValue, blueValue, greenValue, 1)
        
    }
}
  
