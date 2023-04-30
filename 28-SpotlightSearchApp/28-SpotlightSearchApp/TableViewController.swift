//
//  TableViewController.swift
//  28-SpotlightSearchApp
//
//  Created by Mesut Gedik on 27.04.2023.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class TableViewController: UITableViewController {

    let cCell = "tableCell"
    let cellSegue = "goToCell"
    let movieData = MovieData()
    var selectedRow : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchableContent()
indexMoviesForSpotlightSearch()
    }
    
    func indexMoviesForSpotlightSearch() {
        let searchableItems = movieData.movieFile.map { $0.searchableItem }
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { error in
            if let error = error {
                print("Error indexing searchable items: \(error.localizedDescription)")
            } else {
                print("Searchable items indexed successfully")
            }
        }
    }
    
    
    func setupSearchableContent() {
        
//        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
//        let basePath = path[0]
        
        var searchableItems = [CSSearchableItem]()

        for i in 0...(movieData.movieFile.count - 1) {

            let movie = movieData.movieFile[i]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)

            //set the title
            searchableItemAttributeSet.title = movie.movieTitle

            //set the image
            let imagePathParts = movie.movieTitle.components(separatedBy: ".")
            searchableItemAttributeSet.path = imagePathParts[0]

            // Set the description.
            searchableItemAttributeSet.contentDescription = movie.movieDescription

            var keywords = [String]()
            let movieCategories = movie.movieType.components(separatedBy: ", ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }

            let stars = movie.movieStars.components(separatedBy: ", ")
            for star in stars {
                keywords.append(star)
            }

            searchableItemAttributeSet.keywords = keywords

            let searchableItem = CSSearchableItem(uniqueIdentifier: "foranewlife.-8-SpotlightSearchApp.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)

            searchableItems.append(searchableItem)

            CSSearchableIndex.default().indexSearchableItems(searchableItems) {
                if $0 != nil {
                    print($0!.localizedDescription)
                }
            }
        }
        print(searchableItems.count)
    }


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieData.movieFile.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cCell, for: indexPath) as! TableViewCell
        let roadPath = movieData.movieFile[indexPath.row]
        
        cell.movieImage.image = UIImage(named: roadPath.imageName)
        cell.movieType?.text = roadPath.movieType
        cell.movieTitle?.text = roadPath.movieTitle
        cell.movieStars?.text = roadPath.movieStars
        cell.movieRating?.text = roadPath.movieRating
        cell.movieDirector?.text = roadPath.movieDirector
        cell.movieDescription?.text = roadPath.movieDescription
        cell.movieRating.layer.masksToBounds = true
        cell.movieRating.layer.cornerRadius = 25
        
   
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: cellSegue, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == cellSegue {
            let destinationVC = segue.destination as! ViewController
            
            destinationVC.selectedRowNum = selectedRow
//            destinationVC.movieDescription?.text = movieData.movieFile[selectedRow].movieDescription
//            destinationVC.movieDirector?.text = movieData.movieFile[selectedRow].movieDirector
//            destinationVC.movieImage?.image = UIImage(named: movieData.movieFile[selectedRow].imageName)
//            destinationVC.movieRating?.text = movieData.movieFile[selectedRow].movieRating
//            destinationVC.movieStars?.text = movieData.movieFile[selectedRow].movieStars
//            destinationVC.movieTitle?.text = movieData.movieFile[selectedRow].movieTitle
//            destinationVC.movieType?.text = movieData.movieFile[selectedRow].movieType
            
            
        }
    }
   

}
