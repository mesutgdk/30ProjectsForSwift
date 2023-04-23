//
//  RotationViewController.swift
//  25-TableViewBasicAnimation
//
//  Created by Mesut Gedik on 23.04.2023.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet weak var upLeftImage: UIImageView!
    @IBOutlet weak var upRightImage: UIImageView!
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var downLeftImage: UIImageView!
    @IBOutlet weak var downRightImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rotate()
    }
    func rotate () {
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear, animations: { [self] in
            upLeftImage.transform = upLeftImage.transform.rotated(by: CGFloat(Double.pi))
           upRightImage.transform = upRightImage.transform.rotated(by: CGFloat(Double.pi))
            middleImage.transform = middleImage.transform.rotated(by: CGFloat(Double.pi))
            downRightImage.transform = downRightImage.transform.rotated(by: CGFloat(Double.pi))
            downLeftImage.transform = downLeftImage.transform.rotated(by: CGFloat(Double.pi))
            }) { (finished) -> Void in
                self.rotate()
        }
    }

}
