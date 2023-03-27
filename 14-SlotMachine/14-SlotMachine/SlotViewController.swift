//
//  ViewController.swift
//  14-SlotMachine
//
//  Created by Mesut Gedik on 27.03.2023.
//

import UIKit

class SlotViewController: UIViewController {

    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var slotPickerView: UIPickerView!
    

    @IBOutlet weak var prizeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func turnButtonPressed(_ sender: UIButton) {
    }
    
}

