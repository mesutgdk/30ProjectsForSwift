//
//  ViewController.swift
//  21-Swipeable Cell
//
//  Created by Mesut Gedik on 14.04.2023.
//

import UIKit

class ViewController: UITableViewController {

    var cellData = [
        cellSkeleton(image: "first", label: "Job Security First"),
        cellSkeleton(image: "second", label: ""),
        cellSkeleton(image: "third", label: ""),
        cellSkeleton(image: "fourth", label: "")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    

}

