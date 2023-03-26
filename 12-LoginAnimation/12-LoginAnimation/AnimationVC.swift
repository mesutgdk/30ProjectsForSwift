//
//  AnimationVC.swift
//  12-LoginAnimation
//
//  Created by Mesut Gedik on 26.03.2023.
//

import UIKit

class AnimationVC: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
  
    @IBOutlet weak var playImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateImage()
        // Do any additional setup after loading the view.
    }
    func animateImage() {
            UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.mailTextField.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.passwordTextField.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.playImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

            }, completion: nil)
          
        }

}
