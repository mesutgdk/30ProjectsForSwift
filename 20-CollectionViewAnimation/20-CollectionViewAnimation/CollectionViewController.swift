//
//  ViewController.swift
//  20-CollectionViewAnimation
//
//  Created by Mesut Gedik on 9.04.2023.
//

import UIKit

class CollectionViewController: UITableViewController {
    
    var collection:[CellBase] = [
        CellBase(image: "Image1", label: "Is there anything more peaceful then taking in the quiet beauty of the setting sun? As the sun descends below the horizon, creating romantic shades of red and orange across the sky, the world has a chance to breathe in and rejuvenate. While sunsets are a literal end to a day, they've also become symbols of peace, harmony, and the promise of renewal. Sunsets are a great reminder to rest and re4et our hearts and minds at the end of each and every day."),
        CellBase(image: "Image2", label: "There’s something about a bonfire that’s just so magical. The flames dancing in the night, the smell of wood smoke in the air, and the feeling of warmth and camaraderie around the fire. It’s no wonder that bonfires have been a part of human culture for centuries."),
                                
        CellBase(image: "Image3", label: "Have those uncomfortable moments. Because my strong personal belief is it is those moments that cause you to grow the most yourself"),
                                
        CellBase(image: "Image4", label: "Happiness cannot be traveled to, owned, earned, worn or consumed. Happiness is the spiritual experience of living every minute with love, grace, and gratitude")
    ]
    var cCell : String = "collectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let nib = UINib(nibName: "CollectionTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: cCell)
//        tableView.separatorInset = UIEdgeInsets.zero
//        tableView.layoutMargins = UIEdgeInsets.zero
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cCell, for: indexPath) as! CollectionTableViewCell
        cell.backgroundColor = .clear
        cell.cellImage.image = UIImage(named: collection[indexPath.row].image)
        cell.cellLabel.text = collection[indexPath.row].label

        return cell
    }
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    

}

