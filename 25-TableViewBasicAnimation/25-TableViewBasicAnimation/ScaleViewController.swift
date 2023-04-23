//
//  ScaleViewController.swift
//  25-TableViewBasicAnimation
//
//  Created by Mesut Gedik on 23.04.2023.
//

import UIKit

class ScaleViewController: UIViewController {

    
    @IBOutlet weak var scaleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scaleImage.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveLinear, animations: { [self] in
            scaleImage.transform = CGAffineTransform(scaleX: 2, y: 2)
            scaleImage.alpha = 1
            
            }, completion: nil )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
