//
//  ViewController.swift
//  18-LimitTheCharacter
//
//  Created by Mesut Gedik on 4.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var charecterCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charecterCountLabel.text = "\(140)"
        textView.delegate = self
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        print(self.bottomView.frame.origin.y)
        
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
    }
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "DONE!", message: "Successfully tweeted", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            close()
        })
        
        func close() {
            alert.dismiss(animated: true)
            textView.text = ""
        }
    }
}
// MARK: - Move View when Keyboard Appear-Hide
extension ViewController {
   
   @objc func keyboardWillShow(notification: NSNotification) {
       let userInfo  = notification.userInfo
       let keyBoardBounds = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
       let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
       let deltaY = keyBoardBounds.height
       let animations = {
           self.bottomView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
       }

       if duration > 0 {
           
           UIView.animate(withDuration: duration, delay: 0, options:[.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
       }else {
           animations()
       }
       
   
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.bottomView.transform = .identity
        
        
    }
}
// MARK: -UITextViewDelegate
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

