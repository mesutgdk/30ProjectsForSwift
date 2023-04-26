//
//  SecondViewController.swift
//  27-TabBarApp
//
//  Created by Mesut Gedik on 26.04.2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var jobImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobImage.alpha = 0
        jobImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    override func viewWillAppear(_ animated: Bool) {
        
            super.viewDidAppear(animated)
            
        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [self] in
                jobImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                jobImage.alpha = 1
                
                }, completion: nil )
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        jobImage.alpha = 0
        jobImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    

}
