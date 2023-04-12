//
//  CollectionTableViewCell.swift
//  20-CollectionViewAnimation
//
//  Created by Mesut Gedik on 9.04.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let collectionTVC = CollectionViewController()
    
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellText: UITextView!
    @IBOutlet var exitButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func handleCellSelected() {
        exitButton.isHidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    @IBAction func exitButtonPressed()  {
        collectionTVC.exitCell()
    }
    
   
    
    
}
