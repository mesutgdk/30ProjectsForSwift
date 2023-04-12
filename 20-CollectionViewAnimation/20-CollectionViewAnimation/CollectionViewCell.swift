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
    
    var originalCGRect: CGRect!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var backButtonTapped: (() -> Void)?
    
    func handleCellSelected() {
        exitButton.isHidden = false
        self.superview!.bringSubviewToFront(self)
    }
    
    @IBAction func exitButtonPressed()  {
        collectionTVC.exitCell()
    }
    
//    func addTapEventHandler() {
//        exitButton.addTarget(self, action: #selector(backButtonDidTouch(_:)), for: .touchUpInside)
//    }
//
//    @objc func backButtonDidTouch(_ sender: UIGestureRecognizer) {
//        backButtonTapped?()
//    }
    
   
    
    
}
