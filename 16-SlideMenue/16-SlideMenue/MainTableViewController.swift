//
//  ViewController.swift
//  16-SlideMenue
//
//  Created by Mesut Gedik on 30.03.2023.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var profiles : [Profile] = []
    
    let profile1 = Profile(sender: "Pic1.jpg", body: "", name: "", title: "")
    let profile2 = Profile(sender: "", body: "", name: "", title: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profiles.append(profile1)
        print(profiles)
    }


}

