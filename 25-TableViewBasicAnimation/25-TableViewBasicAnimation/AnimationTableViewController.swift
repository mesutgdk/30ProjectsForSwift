//
//  ViewController.swift
//  25-TableViewBasicAnimation
//
//  Created by Mesut Gedik on 23.04.2023.
//

import UIKit

class AnimationTableViewController: UITableViewController {

    let cCell = "AnimationCell"
    let menuList: [String] = ["Scale",
                          "Rotation",
                          "Position",
                          "Opacity",
                          "Color"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cCell, for: indexPath)
        cell.textLabel?.text = menuList[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuList[indexPath.row]
//        print(selectedItem)
        performSegue(withIdentifier: selectedItem, sender: self)
    }

    @IBAction func BackButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}

