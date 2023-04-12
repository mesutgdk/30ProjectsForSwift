//
//  ViewController.swift
//  20-CollectionViewAnimation
//
//  Created by Mesut Gedik on 9.04.2023.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var collection:[CellBase] = [
        CellBase(image: "Image1", text: "      Is there anything more peaceful then taking in the quiet beauty of the setting sun? As the sun descends below the horizon, creating romantic shades of red and orange across the sky, the world has a chance to breathe in and rejuvenate."),
        CellBase(image: "Image2", text: "      There’s something about a bonfire that’s just so magical. The flames dancing in the night, the smell of wood smoke in the air, and the feeling of warmth and camaraderie around the fire. It’s no wonder that bonfires have been a part of human culture for centuries."),
        
        CellBase(image: "Image3", text: "      Have those uncomfortable moments. Because my strong personal belief is it is those moments that cause you to grow the most yourself"),
        
        CellBase(image: "Image4", text: "      Happiness cannot be traveled to, owned, earned, worn or consumed. Happiness is the spiritual experience of living every minute with love, grace, and gratitude")
    ]
    @IBOutlet var mCollectview: UICollectionView!
    var cCell : String = "collectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.separatorStyle = .none
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cCell, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .clear
        cell.cellImage.image = UIImage(named: collection[indexPath.row].image)
        cell.cellText.text = collection[indexPath.row].text
        cell.cellText.layer.cornerRadius = 5
        cell.cellImage.layer.cornerRadius = 2
        cell.exitButton.isHidden = true
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else {
            return
        }
        let animation = {
            cell.frame = self.view.bounds
        }
        UIView.animate(withDuration: 0.5, animations: animation) { _ in
            self.collectionView.isScrollEnabled = false

        }
        cell.exitButton.isHidden = false
        cell.exitButtonPressed()
        cell.handleCellSelected()
    }
    func exitCell (){
//        guard let indexPaths = self.collectionView!.indexPathsForSelectedItems else {
//            return
//        }
//
//        collectionView.isScrollEnabled = true
//        collectionView.reloadItems(at: indexPaths)
        print ("exit button tapped")
        
    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? CollectionTableViewCell else {
//            return
//        }
//        let animations = {
//            cell.frame = self.view.bounds
//        }
//        UIView.animate(withDuration: 0.5, animations: animations)
//
////        cell.exitButton.isHidden = false
//        cell.exitButtonPressed()
//        cell.handleCellSelected()
//        tableView.isScrollEnabled = false
//    }
//     func exitCell () {
//        print ("exit button tapped")
////        view.bounds = tableView.frame
////        guard let indexPaths = self.tableView.indexPathsForSelectedRows else {
////        return
////    }
//         guard let indexPaths = self.tableView.indexPathsForSelectedRows else { return  }
//
//    tableView.isScrollEnabled = true
//    tableView.reloadRows(at: indexPaths, with: .none)
//
//    }
}

