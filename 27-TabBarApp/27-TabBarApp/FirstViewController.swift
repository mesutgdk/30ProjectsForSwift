//
//  FirstViewController.swift
//  27-TabBarApp
//
//  Created by Mesut Gedik on 26.04.2023.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cCell = "firstCell"
    var dataArray: [List] = [List(profilePhoto: <#T##String#>, name: <#T##String#>, situation: <#T##String#>, date: <#T##String#>),
                            List(profilePhoto: <#T##String#>, name: <#T##String#>, situation: <#T##String#>, date: <#T##String#>),
                            List(profilePhoto: <#T##String#>, name: <#T##String#>, situation: <#T##String#>, date: <#T##String#>),
                            List(profilePhoto: <#T##String#>, name: <#T##String#>, situation: <#T##String#>, date: <#T##String#>),
                            List(profilePhoto: <#T##String#>, name: <#T##String#>, situation: <#T##String#>, date: <#T##String#>)
    ]

    @IBOutlet var fTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fTableView.dataSource = self
        fTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fTableView.dequeueReusableCell(withIdentifier: cCell, for: indexPath) as! FirstTableViewCell
        let truePath = dataArray[indexPath.row]
        cell.profileImage.image = UIImage(named: truePath.profilePhoto)
        cell.nameLabel.text = truePath.name
        cell.situationLabel.text = truePath.situation
        cell.dateLabel.text = truePath.date
        
        return cell
    }
    

}

struct List {
    var profilePhoto: String
    var name: String
    var situation: String
    var date: String
}
