//
//  ViewController.swift
//  17-TumblrMenu
//
//  Created by Mesut Gedik on 1.04.2023.
//

import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var screenImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let interaction = UIContextMenuInteraction(delegate: self)
        screenImage.addInteraction(interaction)
    }


}

extension ViewController: UIContextMenuInteractionDelegate{
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return nil
    }
}

