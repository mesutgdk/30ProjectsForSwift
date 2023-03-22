//
//  LoginScreenVC.swift
//  10-VideoBackground
//
//  Created by Mesut Gedik on 22.03.2023.
//

import UIKit
import AVFoundation

class LoginScreenVC: UIViewController {

    @IBOutlet var secondViewLayer: UIView!
    
    @IBOutlet var playImageView: UIImageView!
    
    @IBOutlet var wellcomeLabel: UILabel!
    
    let bgVideo2: String = "background2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewLayer.backgroundColor = .clear
        playBgVideo2()
        // Do any additional setup after loading the view.
    }
    

    private func playBgVideo2 (){
        guard let videoURL = Bundle.main.path(forResource: bgVideo2, ofType: "mp4") else {
            return
        }
        let player = AVPlayer(url: URL(filePath: videoURL))
        player.actionAtItemEnd = .none
        player.isMuted = true
        
         let playerLayer = AVPlayerLayer(player: player)
        //playerLayer?.zPosition = -1
        
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.secondViewLayer.layer.addSublayer(playerLayer)
        //self.videoLayer2.sendSubviewToBack(videoLayer2)
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidReactEnd(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        secondViewLayer.bringSubviewToFront(wellcomeLabel)
        secondViewLayer.bringSubviewToFront(playImageView)
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none

    }
    @objc func videoDidReactEnd(notification: Notification){
        let pItem: AVPlayerItem = notification.object as! AVPlayerItem
        pItem.seek(to: .zero)
    }

}

