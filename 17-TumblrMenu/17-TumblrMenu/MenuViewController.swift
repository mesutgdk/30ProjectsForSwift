//
//  MenuViewController.swift
//  17-TumblrMenu
//
//  Created by Mesut Gedik on 3.04.2023.
//

import UIKit

class MenuViewController: UIViewController {

    let transitionManager = TransitionManager()
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var dendenButton: UIButton!
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var audioButton: UIButton!
    
    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        self.transitioningDelegate = self.transitionManager

//        super.viewDidLoad()
//        UIView.animate(withDuration: 0.9) {
//            self.textButton.center = self.containerView.center
//            self.photoButton.center = self.containerView.center
//            self.dendenButton.center = self.containerView.center
//
//            self.chatButton.center = self.containerView.center
//            self.linkButton.center = self.containerView.center
//            self.audioButton.center = self.containerView.center
//        }
        

        // Do any additional setup after loading the view.
    }
  
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
    

}
