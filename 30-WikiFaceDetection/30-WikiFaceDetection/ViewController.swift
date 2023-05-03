//
//  ViewController.swift
//  30-WikiFaceDetection
//
//  Created by Mesut Gedik on 3.05.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wikiPersonImage: UIImageView!
    @IBOutlet weak var fromWikiLabel: UILabel!
    @IBOutlet weak var zoomButton: UIButton!
    
    var zoomed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appImage.image = UIImage(named: "appImage")
        fromWikiLabel.alpha = 0.6
        textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let textFieldContent = textField.text {
            do {
                try FaceRecognizer.whosFace(who: textFieldContent, size: CGSize(width: 200, height: 200), completion: { image, imageFound in
                    if imageFound {
                        DispatchQueue.main.async {
                            self.wikiPersonImage.image = image

                                FaceRecognizer.centerTheFaceOnImage(imageView: self.wikiPersonImage)
                            
                        }
                    }
                })
            } catch FaceRecognizer.FaceRecognizerError.CantDownloadImage {
                    print("Could Not Download The Image")
            } catch {
                print(error)
            }
        }
        return true
    }
    
    @IBAction func zoomButtonPressed(_ sender: UIButton) {
        if zoomed == false{
//            FaceRecognizer.centerTheFaceOnImage(imageView: self.wikiPersonImage)

            //call zoom func
            zoomButton.setTitle("Zoom Out!", for: .normal)
         
            zoomed = true
            
        } else {
            
            zoomButton.setTitle("Zoom In!", for: .normal)
           
            zoomed = false
        }
    }
    
}

