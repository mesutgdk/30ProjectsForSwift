//
//  ViewController.swift
//  8-Colorization
//
//  Created by Mesut Gedik on 19.03.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer!
    var sleepSong : String = "ninni"
    var songRestart : Bool = false
    var songPaused : Bool = true
    
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.setImage(UIImage(named: "playButton.jpg"), for: UIControl.State.normal)
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
           // print("song is started \(!songPaused)")

        } else if songRestart == false, songPaused == false{
            player.pause()
            songRestart = true
         //   print("song is paused \(!songPaused)")
        } else if songRestart == true{
            player.play(atTime: player.deviceCurrentTime)
//            print("restarted at \(String(describing: player.deviceCurrentTime + 0.01 ))")
            songRestart = false
        } else {
            print ("nothing to do")
        }
                
    }
}

