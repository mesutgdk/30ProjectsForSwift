//
//  ViewController.swift
//  26-CoreData
//
//  Created by Mesut Gedik on 24.04.2023.
//

import UIKit

class ListTVController: UITableViewController {
    
    let cCell = "listCell"
    
    let listData : [String] = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cCell, for: indexPath)
        cell.textLabel?.text = listData[indexPath.row]
        
        return cell
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}

