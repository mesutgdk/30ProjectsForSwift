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

   // let array  = ["Hacı", "Veli", "Deli"]
    
    let ofisText = ["Safety First","Work With Us","Safety First","Work With Us","Safety First","Work With Us","Safety First","Work With Us"]
    
    let tableViewCellIdentifier = "PlayerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(VideoCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        
    }
    
    override func viewDidAppear(_ animated: Bool)
       {
           super.viewDidAppear(animated)
           
           // Request access to PhotosApp
           PHPhotoLibrary.requestAuthorization(for: .readWrite) {status in
               
               // Handle restricted or denied state
               if status == .restricted || status == .denied
               {
                   print("Status: Restricted or Denied")
               }
               
               // Handle limited state
               if status == .limited
               {
                   self.fetchVideos()
                   print("Status: Limited")
               }
               
               // Handle authorized state
               if status == .authorized
               {
                   self.fetchVideos()
                   print("Status: Full access")
               }
           }
       }
    
    func fetchVideos() {
        
        // Fetch all video assets from the Photos Library as fetch results
        let fetchResults = PHAsset.fetchAssets(with: PHAssetMediaType.video, options: nil)
        
        
      
        // Loop through all fetched results
        fetchResults.enumerateObjects({(object, count, stop) in
            
            // Add video object to our video array
            self.videos.append(object)
        })
        
        // Reload the table view on the main thread
        DispatchQueue.main.async {
            self.tableView.reloadData()
        
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! VideoCell
        
        let videoAsset = videos[indexPath.row]
        print()
        
        cell.videoLabel?.text = ofisText[indexPath.row]
//        cell.videoLabel?.text = "Video from \(videoAsset.creationDate ?? Date())"
                
        // Load video thumbnail
        PHCachingImageManager.default().requestImage(for: videoAsset,
                                                             targetSize: CGSize(width: 800, height: 200),
                                                     contentMode: .aspectFill,
                                                             options: nil) { (photo, _) in
                    
            cell.videoImage?.image = photo
                    
                }
        
    return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // Get video asset at current index
        let whatIhave = videos[indexPath.row]
        
       
        // Fetch the video asset
        PHCachingImageManager.default().requestAVAsset(forVideo: whatIhave, options: nil) {(video, _, _) in
            if let video = video
            {
                // Launch video player in the main thread
                DispatchQueue.main.async {
                    self.playVideo(video)
                }
            }
        }
    }
    
    func playVideo(_ video : AVAsset){
        
            let playerItem = AVPlayerItem(asset: video)
            let player = AVPlayer(playerItem: playerItem)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            
        
            present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
    }
    
}

