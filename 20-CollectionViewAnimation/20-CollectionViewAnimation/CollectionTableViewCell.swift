//
//  CollectionTableViewCell.swift
//  20-CollectionViewAnimation
//
//  Created by Mesut Gedik on 9.04.2023.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet var cellImage: UIView!
    @IBOutlet var cellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
