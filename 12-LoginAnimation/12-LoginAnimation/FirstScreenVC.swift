//
//  ViewController.swift
//  12-LoginAnimation
//
//  Created by Mesut Gedik on 25.03.2023.
//

import UIKit

class FirstScreenVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signınButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.titleLabel?.text = "Login"
        signınButton.titleLabel?.text = "Sign In"
        loginButton.layer.cornerRadius = 7
        signınButton.layer.cornerRadius = 7
    }

    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signinButtonPressed(_ sender: UIButton) {
    }
    

}

