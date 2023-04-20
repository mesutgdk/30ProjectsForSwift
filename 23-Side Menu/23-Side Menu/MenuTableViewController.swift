//
//  MenuTableViewController.swift
//  23-Side Menu
//
//  Created by Mesut Gedik on 19.04.2023.
//

import UIKit

protocol MenuTableViewDelegate {
    func didSelectMenuItem(name: String)
}

class MenuTableViewController: UITableViewController {

    var delegate: MenuTableViewDelegate?
    
    private let menuItems: [String] = [
    "HOME","PROFILES","CONNECTIONS"]
    
    private let mcell = "menuCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: mcell)
        tableView.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.backgroundColor = .darkGray
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: mcell, for: indexPath)
        
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(name: selectedItem)
    }
    
    

}
