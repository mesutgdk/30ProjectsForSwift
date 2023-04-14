//
//  TableViewCell.swift
//  21-Swipeable Cell
//
//  Created by Mesut Gedik on 14.04.2023.
//

import UIKit

struct cellSkeleton {
    let image : String
    let label : String
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
