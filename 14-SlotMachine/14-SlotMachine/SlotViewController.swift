//
//  ViewController.swift
//  14-SlotMachine
//
//  Created by Mesut Gedik on 27.03.2023.
//

import UIKit

class SlotViewController: UIViewController, UIPickerViewDataSource {
    
    let slotArray: [String] = ["🫵","🫦","🖕","🎃","💩","🍋","🍒","🍬"]

    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var slotPickerView: UIPickerView!
    @IBOutlet weak var prizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotPickerView.delegate = self
        slotPickerView.dataSource = self
        prizeLabel.text = ""
        
    }

    @IBAction func turnButtonPressed(_ sender: UIButton) {
    }
    
}
extension SlotViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return slotArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return slotArray[row]
    }
    
    
}
