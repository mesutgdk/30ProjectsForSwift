//
//  ViewController.swift
//  26-CoreData
//
//  Created by Mesut Gedik on 24.04.2023.
//

import UIKit
import CoreData

class ListTVController: UITableViewController {
    
    let cCell = "listCell"
    
    var listData : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
//        print("button pressed")

        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Topic", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Topic", style: .default) { (action) in
                        
            self.listData.append(textField.text!)
            self.tableView.reloadData()
            
           }
        alert.addAction(action)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create a New Task"
            textField = alertTextField
        
        }
       present(alert, animated: true, completion: nil)

    }
    
}

