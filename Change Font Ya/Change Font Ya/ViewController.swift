//
//  ViewController.swift
//  Change Font Ya
//
//  Created by Mesut Gedik on 2.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fontLabel: UILabel!
    
    var labelText : String = "You Can Easily Change Font 🥳 Yazı Stilini Kolaylıkla Değitirebilirsin 😜 Siz Asanlıqla Fot Dəyişə Bilərsiniz 🤪 Vous Pouvez Facilement Changer De Pied 😝 μπορείτε εύκολα να αλλάξετε γραμματοσειρά 🧐"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontLabel.text = labelText
        // Do any additional setup after loading the view.
    }

    
    @IBAction func changeButtonPressed(_ sender: UIButton) {
    }
    

}

