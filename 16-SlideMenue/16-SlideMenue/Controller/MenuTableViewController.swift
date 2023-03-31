//
//  TableViewController.swift
//  16-SlideMenue
//
//  Created by Mesut Gedik on 31.03.2023.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let menuArray: [String] = [
        "For A New Life", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"
    ]
    private let mcell = "menuCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = UIColor.black
        
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mcell, for: indexPath) as! MenuTableViewCell
        cell.menuLabel.text = menuArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

