//
//  ViewController.swift
//  21-Swipeable Cell
//
//  Created by Mesut Gedik on 14.04.2023.
//

import UIKit

class ViewController: UITableViewController {

    var cellData = [
        cellSkeleton(image: "first", label: "Safety First"),
        cellSkeleton(image: "second", label: "Working At Heights"),
        cellSkeleton(image: "third", label: "Confined Spaces"),
        cellSkeleton(image: "fourth", label: "Dusty Environments"),
        cellSkeleton(image: "fifth", label: "Crane Operation"),
        cellSkeleton(image: "sixth", label: "Hot Work"),
        cellSkeleton(image: "seventh", label: "Scafolding"),
        cellSkeleton(image: "eighth", label: "Working Underwater")
                    
    ]
    var cellName = "swipeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! TableViewCell
        cell.cellImage.image = UIImage(named: cellData[indexPath.row].image)
        cell.cellLabel.text = cellData[indexPath.row].label
        return cell
    }
    

}

