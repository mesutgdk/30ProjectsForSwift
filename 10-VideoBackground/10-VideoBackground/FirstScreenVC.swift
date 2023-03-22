//
//  ViewController.swift
//  10-VideoBackground
//
//  Created by Mesut Gedik on 21.03.2023.
//

import UIKit
import AVFoundation

class FirstScreenVC: UIViewController {

    @IBOutlet var firstViewLayer: UIView!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var signupButton: UIButton!
        
    @IBOutlet var appIcon: UIImageView!
    
    let bgVideo1 = "background1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBgVideo1()

        loginButton.layer.cornerRadius = 7
        signupButton.layer.cornerRadius = 7
    }
    private func playBgVideo1 (){
        guard let videoURL = Bundle.main.path(forResource: bgVideo1, ofType: "mp4") else {
            return
        }
        let player = AVPlayer(url: URL(filePath: videoURL))
        player.actionAtItemEnd = .none
        player.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        
        
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.firstViewLayer.layer.addSublayer(playerLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidReactEnd(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        firstViewLayer.bringSubviewToFront(loginButton)
        firstViewLayer.bringSubviewToFront(signupButton)
        firstViewLayer.bringSubviewToFront(appIcon)
    }
    @objc func videoDidReactEnd(notification: Notification){
        let pItem: AVPlayerItem = notification.object as! AVPlayerItem
        pItem.seek(to: .zero)
    }


}

