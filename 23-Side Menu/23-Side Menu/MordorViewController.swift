//
//  BabyViewController.swift
//  23-Side Menu
//
//  Created by Mesut Gedik on 20.04.2023.
//

import UIKit

class MordorViewController: UIViewController {

//    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        var imageView = UIImageView ()
        imageView.frame = view.bounds
        imageView.image = UIImage(named: "mordor")
        view.addSubview(imageView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
