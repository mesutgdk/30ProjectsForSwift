//
//  NewTableViewCell.swift
//  16-SlideMenue
//
//  Created by Mesut Gedik on 31.03.2023
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet var bodyImage:UIImageView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
