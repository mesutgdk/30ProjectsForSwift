//
//  TableViewCell.swift
//  11-ClearTableView
//
//  Created by Mesut Gedik on 22.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
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
