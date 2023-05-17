//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by Mesut Gedik on 16.05.2023.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoImage:UIImageView!
    @IBOutlet weak var videoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
