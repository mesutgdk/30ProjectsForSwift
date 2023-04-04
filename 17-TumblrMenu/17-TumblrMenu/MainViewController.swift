//
//  ViewController.swift
//  17-TumblrMenu
//
//  Created by Mesut Gedik on 1.04.2023.
//

import UIKit

class MainViewController: UIViewController  {
    
    @IBOutlet weak var screenImage: UIImageView!
    
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
//        present(MenuViewController, animated: false) as! UIViewController
//
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // this gets a reference to the screen that we're about to transition to
        let toViewController = segue.destination as UIViewController
                
        // instead of using the default transition animation, we'll ask
        // the segue to use our custom TransitionManager object to manage the transition animation
        toViewController.transitioningDelegate = self.transitionManager
        }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return self.presentingViewController == nil ? UIStatusBarStyle.default : UIStatusBarStyle.lightContent
    }
}



