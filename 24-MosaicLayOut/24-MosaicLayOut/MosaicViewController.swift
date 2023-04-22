//
//  ViewController.swift
//  24-MosaicLayOut
//
//  Created by Mesut Gedik on 22.04.2023.
//

import UIKit
import TRMosaicLayout

class MosaicViewController: UICollectionViewController {
    
    let cCell = "MosaicCell"
    
    let data : [String] = ["1","2","4","3","5","6","8","7","9","10","11","12","15","14","13"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
        collectionView.backgroundColor = .black
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cCell, for: indexPath)
        let imageName = UIImage(named: data[indexPath.row])
        let imageView = UIImageView(image: imageName)
        
        imageView.frame = cell.frame
        cell.backgroundView = imageView
        imageView.alpha = 0
        
        //Loading Delay
        let cellDelay = UInt64((arc4random() % 600 ) / 1000 )
        let cellDelayTime = DispatchTime(uptimeNanoseconds: cellDelay * NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: cellDelayTime) {
            UIView.animate(withDuration: 0.9) {
                imageView.alpha = 1
            }
        }
       
          return cell
    }
    

}
extension MosaicViewController: TRMosaicLayoutDelegate {
    
    
    
    func collectionView(_ collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:IndexPath) -> TRMosaicCellType {
        // every third cell as .Big to get the best layout
        return indexPath.item % 3 == 0 ? .big : .small
      }

    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
      }

      func heightForSmallMosaicCell() -> CGFloat {
        return 150
      }

}

