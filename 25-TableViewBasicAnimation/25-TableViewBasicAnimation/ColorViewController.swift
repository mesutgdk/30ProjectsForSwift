//
//  ColorViewController.swift
//  25-TableViewBasicAnimation
//
//  Created by Mesut Gedik on 23.04.2023.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var newLifeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.959, green:0.937, blue:0.109, alpha:1)

//        view.backgroundColor = .darkGray
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.8, options: .curveLinear, animations: { [self] in
            view.backgroundColor = UIColor(red:0.959, green:0.937, blue:0.109, alpha:1)
//            newLifeLabel.backgroundColor = .black
            
            }, completion: nil )
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveLinear, animations: { [self] in
            newLifeLabel.textColor = UIColor(red:0.959, green:0.937, blue:0.109, alpha:1)
            view.backgroundColor = .black
            
            }, completion: nil)
        
    }

}
