//
//  FirstViewController.swift
//  27-TabBarApp
//
//  Created by Mesut Gedik on 26.04.2023.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cCell = "firstCell"
    var dataArray: [List] = [List(profilePhoto: "profile9", name: "Mr New Man", situation: "Helpless", date: "27.04.2023"),
                             List(profilePhoto: "profile1", name: "Frogy Man", situation: "Victorious", date: "10.12.2012"),
                             List(profilePhoto: "profile3", name: "LittyMiddle", situation: "Scary", date: "27.05.2009"),
                             List(profilePhoto: "profile2", name: "MrMuscle", situation: "Worried", date: "05.03.1999"),
                             List(profilePhoto: "profile4", name: "MrHappyFrog", situation: "Brave", date: "20.01.2015"),
                             List(profilePhoto: "profile5", name: "Watch my Doing", situation: "Eager", date: "28.02.2007"),
                             List(profilePhoto: "profile6", name: "Chack Fish", situation: "Cheerful", date: "21.11.2003"),
                             List(profilePhoto: "profile7", name: "Mr First One", situation: "Disagreeable", date: "09.02.2011"),
                             List(profilePhoto: "profile8", name: "White Story", situation: "Dedicated", date: "16.12.2020"),
                             List(profilePhoto: "profile1", name: "Ugly Man", situation: "Sad", date: "25.03.2011")
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
