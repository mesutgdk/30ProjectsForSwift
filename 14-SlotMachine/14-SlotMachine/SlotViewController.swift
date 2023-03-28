//
//  ViewController.swift
//  14-SlotMachine
//
//  Created by Mesut Gedik on 27.03.2023.
//

import UIKit

class SlotViewController: UIViewController, UIPickerViewDataSource {
    
    let slotArray: [String] = ["🍬","🫦","🖕","🎃","💩","🍋","🍒","🫵"]

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

    @IBAction func goButtonPressed(_ sender: UIButton) {
        
        var randomNum : Int {
         return Int.random(in: 0...8)
        }
        slotPickerView.selectRow(randomNum, inComponent: 0, animated: true)
        slotPickerView.selectRow(randomNum, inComponent: 1, animated: true)
        slotPickerView.selectRow(randomNum, inComponent: 2, animated: true)
        let firstSlot = slotPickerView.selectedRow(inComponent: 0)
        let secondSlot = slotPickerView.selectedRow(inComponent: 1)
        let thirdSlot = slotPickerView.selectedRow(inComponent: 2)
       // print("\(firstSlot)\(secondSlot)\(thirdSlot)")
        if firstSlot != secondSlot {
            prizeLabel.text = "TRY AGAIN!"
        } else {
            if secondSlot != thirdSlot {
                prizeLabel.text = "ONE MORE TIME!"
            }else {
                prizeLabel.text = "BINGOOOOOOO"
            }
        }
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
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        60.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = slotArray[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 35.0)!,NSAttributedString.Key.foregroundColor:UIColor.black])
        pickerLabel.attributedText = myTitle
        let hue = CGFloat(row)/CGFloat(slotArray.count)
        pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 0.7)
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    
    
}
