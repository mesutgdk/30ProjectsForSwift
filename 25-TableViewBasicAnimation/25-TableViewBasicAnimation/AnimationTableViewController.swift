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
                          "Rotatiton",
                          "Position",
                          "Opacity",
                          "Color"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cCell, for: indexPath)
        
        return cell
    }


}

