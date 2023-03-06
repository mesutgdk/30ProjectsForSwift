//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Mesut Gedik on 4.03.2023.
//

import UIKit
import Photos
import AVKit

class PlayerViewController: UITableViewController {

    var videos: [PHAsset] = []

    let array  = ["Hacı", "Veli", "Deli"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
       {
           super.viewDidAppear(animated)
           
           // Request access to PhotosApp
           PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] status in
               
               // Handle restricted or denied state
               if status == .restricted || status == .denied
               {
                   print("Status: Restricted or Denied")
               }
               
               // Handle limited state
               if status == .limited
               {
                   self?.fetchVideos()
                   print("Status: Limited")
               }
               
               // Handle authorized state
               if status == .authorized
               {
                   self?.fetchVideos()
                   print("Status: Full access")
               }
           }
       }
    func fetchVideos() {
        
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

