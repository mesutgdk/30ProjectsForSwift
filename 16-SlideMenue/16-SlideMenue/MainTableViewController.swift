//
//  ViewController.swift
//  16-SlideMenue
//
//  Created by Mesut Gedik on 30.03.2023.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var profiles : [Profile] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Life For Everyone"
        
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
        // Do any additional setup after loading the view.
        append()
    }
}
extension MainTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.bodyImage.image = UIImage(named: profiles[indexPath.row].body)
        cell.profileImage.image = UIImage(named: profiles[indexPath.row].sender)
        cell.nameLabel.text = profiles[indexPath.row].name
        cell.titleLabel.text = profiles[indexPath.row].title
//        cell.nameLabel
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    func append (){
        self.profiles.append(Profile(sender: "pic1", body: "body3", name: "Uzeyir KABALI", title: "Dentist"))
        self.profiles.append(Profile(sender: "pic2", body: "body2", name: "Kim Yon BBer", title: "Plumber"))
        self.profiles.append(Profile(sender: "pic3", body: "body4", name: "Yone Hasagi", title: "Engineer"))
        self.profiles.append(Profile(sender: "pic4", body: "body1", name: "Zabashat Anchor", title: "Job Security Specialist"))
        
        //    let profile1 = Profile(sender: "pic1", body: "body1", name: "", title: "")
        //    let profile2 = Profile(sender: "pic2", body: "body2", name: "", title: "")
        //    let profile3 = Profile(sender: "pic3", body: "body3", name: "", title: "")
        //    let profile4 = Profile(sender: "pic4", body: "body4", name: "", title: "")
            
    }

}

