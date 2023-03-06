//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Mesut Gedik on 4.03.2023.
//

import UIKit

class PlayerViewController: UITableViewController {

    let array  = ["Hacı", "Veli", "Deli"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
    return cell
    }

}

