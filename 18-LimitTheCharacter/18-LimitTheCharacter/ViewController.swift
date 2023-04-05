//
//  ViewController.swift
//  18-LimitTheCharacter
//
//  Created by Mesut Gedik on 4.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var charecterCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charecterCountLabel.text = "\(140)"
        textView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.isFirstResponder

    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
    }
    @IBAction func sendButtonPressed(_ sender: UIButton) {
    }
    

}
extension ViewController: UITextViewDelegate {
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            var newText = textView.text!
            newText.removeAll { (character) -> Bool in
                return character == " " || character == "\n"
            }
            let numberChar = newText.count + text.count
            charecterCountLabel.text = "\(140 - numberChar)"
            return numberChar < 140
        }
    
    
}

