//
//  OpacityViewController.swift
//  25-TableViewBasicAnimation
//
//  Created by Mesut Gedik on 23.04.2023.
//

import UIKit

class OpacityViewController: UIViewController {

    @IBOutlet weak var opacityImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5) { [self] in
           opacityImage.alpha = 0
        }
    }

}
