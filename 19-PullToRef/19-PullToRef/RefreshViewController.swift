//
//  ViewController.swift
//  19-PullToRef
//
//  Created by Mesut Gedik on 6.04.2023.
//

import UIKit

class RefreshViewController: UITableViewController{
    
    
    var labelView : UIView!
    
    var labelArray : Array<UILabel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.clear
        refreshControl?.tintColor = UIColor.clear
        tableView.addSubview(refreshControl!)

        loadRefreshContents()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return M.whatIDid.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: M.reusableCell, for: indexPath)
        cell.textLabel?.text = M.whatIDid[indexPath.row]

        return cell
    }
   
    func loadRefreshContents() {
        let refreshContents = Bundle.main.loadNibNamed(M.refreshView, owner: self)
        labelView = refreshContents![0] as? UIView
        labelView.frame = refreshControl!.bounds
        print(labelView.subviews.count)
        for i in 0..<labelView.subviews.count {
            if let item = labelView.viewWithTag(i + 1) {
                labelArray.append(item as! UILabel)
            }
        }
        refreshControl!.addSubview(labelView)
    }


}

