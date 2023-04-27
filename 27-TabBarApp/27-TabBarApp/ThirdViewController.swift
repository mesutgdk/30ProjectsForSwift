//
//  ViewController.swift
//  27-TabBarApp
//
//  Created by Mesut Gedik on 26.04.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var myAccountImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetImage()
        }
    override func viewWillAppear(_ animated: Bool) {
        
            super.viewDidAppear(animated)
            
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { [self] in
                myAccountImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                myAccountImage.alpha = 1
                
                }, completion: nil )
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetImage()
    }
    
    func resetImage (){
        myAccountImage.alpha = 0
        myAccountImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
}

