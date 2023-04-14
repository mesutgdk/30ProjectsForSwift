//
//  NewCollectionViewCell.swift
//  20-CollectionViewAnimation
//
//  Created by Mesut Gedik on 14.04.2023.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    let collectionTVC = CollectionViewController()

    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellTextView: UITextView!
    @IBOutlet var exitButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func handleCellSelected() {
        cellTextView.isScrollEnabled = false
        exitButton.isHidden = false
        self.superview!.bringSubviewToFront(self)
    }

    @IBAction func exitButtonPressed(_ sender: UIButton) {
        collectionTVC.exitCell()
    }
    
}
