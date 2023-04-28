//
//  TableViewCell.swift
//  28-SpotlightSearchApp
//
//  Created by Mesut Gedik on 27.04.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieStars: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
