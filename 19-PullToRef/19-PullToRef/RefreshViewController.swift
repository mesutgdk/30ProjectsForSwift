//
//  ViewController.swift
//  19-PullToRef
//
//  Created by Mesut Gedik on 6.04.2023.
//

import UIKit

class RefreshViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl!)
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return M.whatIDid.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: M.reusableCell, for: indexPath)
        cell.textLabel?.text = M.whatIDid[indexPath.row]
        
        return cell
    }
   


}

