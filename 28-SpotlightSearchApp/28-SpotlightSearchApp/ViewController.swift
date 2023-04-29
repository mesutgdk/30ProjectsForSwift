//
//  ViewController.swift
//  28-SpotlightSearchApp
//
//  Created by Mesut Gedik on 27.04.2023.
//

import UIKit

class ViewController: UIViewController {

    let movieData = MovieData()
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieStars: UILabel!
    
    var selectedRowNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieRating.layer.masksToBounds = true
        movieRating.layer.cornerRadius = 25
        loadCell()
        
    }

    func loadCell (){
        if (selectedRowNum != nil) {
            let roadWay = movieData.movieFile[selectedRowNum!]
            movieImage.image = UIImage(named: roadWay.imageName)
            movieDescription.text = roadWay.movieDescription
            movieDirector.text = roadWay.movieDirector
            movieRating.text = roadWay.movieRating
            movieTitle.text = roadWay.movieTitle
            movieStars.text = roadWay.movieStars
            movieType.text = roadWay.movieType
            backgroundView.image = UIImage(named: roadWay.imageName)
            backgroundView.alpha = 0.15
            
        }
    }

}

