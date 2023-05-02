//
//  ViewController.swift
//  29-ProfilePhotoPicker
//
//  Created by Mesut Gedik on 2.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profilPhotoImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilPhotoImage.contentMode = .scaleAspectFit
        profilPhotoImage.layer.masksToBounds = true
        profilPhotoImage.layer.cornerRadius = profilPhotoImage.bounds.width / 2
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @IBAction func pPChangeButtonPressed(_ sender: UIButton) {
       
        let imagePicker = UIImagePickerController()
//        UIImagePickerController()
        imagePicker.view.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        print(imagePicker.view.frame)
        imagePicker.view.frame = CGRectMake(0, self.view.frame.size.height/2, view.bounds.width, view.bounds.height/2)
        print(imagePicker.view.frame)

        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        
        
        present(imagePicker, animated: true)
//        print("pp button pressed")
    }
    
    
}
extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //if u forgot the search key, just print its path, it gives edited image!
//        print("\(info)")
//        UIImagePickerControllerEditedImage
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profilPhotoImage.image = image
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
