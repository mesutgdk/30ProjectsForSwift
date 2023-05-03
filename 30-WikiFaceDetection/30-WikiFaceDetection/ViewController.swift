//
//  ViewController.swift
//  30-WikiFaceDetection
//
//  Created by Mesut Gedik on 3.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wikiPersonImage: UIImageView!
    @IBOutlet weak var fromWikiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appImage.image = UIImage(named: "appImage")
        fromWikiLabel.alpha = 0.6
        try! FaceRecognizer.whosFace(who: "Tom Hanks", size: CGSize(width: 200, height: 200), completion: { image, imageFound in
            //
        })
    }


}

