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
//    var activeCell: CollectionViewCell!
    var cCell : String = "collectionCell"
    
    private struct GreatNib {
        static var NibName = "NewCollectionViewCell"
        static var NibCell = "newCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      mCollectview.register(UINib(nibName: GreatNib.NibName, bundle: nil), forCellWithReuseIdentifier: GreatNib.NibCell)
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collection.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GreatNib.NibCell, for: indexPath) as? NewCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .clear
        cell.cellImage.image = UIImage(named: collection[indexPath.row].image)
        cell.cellTextView.text = collection[indexPath.row].text
        cell.cellTextView.layer.cornerRadius = 5
        cell.cellImage.layer.cornerRadius = 2
        cell.exitButton.isHidden = true
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? NewCollectionViewCell else {
            return
        }
        let animation = {
//            cell.originalCGRect = cell.frame
            cell.frame = self.view.bounds
            
        }
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, animations: animation) { _ in
            self.collectionView.isScrollEnabled = false
//            self.activeCell = cell
            cell.exitButton.isHidden = false
            cell.handleCellSelected()
        }
        
    }
    
    func exitCell (){
        collectionView.reloadData()
        guard let indexPaths = self.collectionView.indexPathsForSelectedItems else {
            return
        }
        collectionView!.isScrollEnabled = true
        collectionView!.reloadItems(at: indexPaths)
        
        print ("exit button tapped")
//        self.activeCell.frame = self.activeCell.originalCGRect
//        collectionView(collectionView, cellForItemAt: IndexPath())
//        let indexPath = collectionView.indexPathsForSelectedItems ?? [IndexPath(item: collection.count, section:1)]co
//        view.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.frame = self.view.bounds
//        if let indexPaths = self.collectionView.indexPathsForSelectedItems {
//            collectionView!.isScrollEnabled = true
//            collectionView!.reloadItems(at: indexPaths)
//
//            print ("exit button tapped")
//            view.translatesAutoresizingMaskIntoConstraints = false
//        }
//            else {
//        }

        

    }
}

