//
//  ViewController.swift
//  19-PullToRef
//
//  Created by Mesut Gedik on 6.04.2023.
//

import UIKit

class RefreshViewController: UITableViewController {

    var carModels: [String] = ["Alfa-Romeo",
                               "BMV",
                               "Dacia",
                               "Fiat",
                               "Ford",
                               "Honda",
                               "Jaguar",
                               "Kia",
                               "Mercedes",
                               "Opel",
                               "Renault",
                               "Seat",
                               "Skoda",
                               "Toyota",
                               "Volvo"]
    let reusableCell = "refreshCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath)
        cell.textLabel?.text = carModels[indexPath.row]
        
        return cell
    }
    @objc func callOfRefresh (){
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }


}

