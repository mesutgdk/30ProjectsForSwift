//
//  ViewController.swift
//  5-CarouselEffect
//
//  Created by Mesut Gedik on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let morty1 = ["title":"C'mon RickY Wake Up!","image":"rick1" ]
    let morty2 = ["title":"It is For YU MorTy","image":"rick2" ]
    let morty3 = ["title":"Helllooo","image":"rick3" ]
    let morty4 = ["title":"O_o o_O","image":"rick4" ]
    let morty5 = ["title":"Mortyyyyy","image":"rick5" ]
    let morty6 = ["title":"Where Are We Going!","image":"rick6" ]
    let morty7 = ["title":"Pickle Riickkk","image":"rick7" ]
    let morty8 = ["title":"MAAAANNN","image":"rick8" ]
    let morty9 = ["title":"Get Schwiftyyyyy","image":"rick9" ]
    let morty10 = ["title":"","image":"rick10" ]
    let morty11 = ["title":"No Way Out","image":"rick11" ]
    
    var mortyArray = [Dictionary<String,String>] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mortyArray = [morty1,morty2,morty3,morty4,morty5,morty6,morty7,morty8,morty9,morty10,morty11]
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(mortyArray.count), height: 393)
        scrollView.showsHorizontalScrollIndicator = false
        
        loadMortyImages()
    }
    
    func loadMortyImages() {
            for (index, morty) in mortyArray.enumerated() {
                //print(morty["image"]!)
                
                if let View = Bundle.main.loadNibNamed("Rick", owner: self,options: nil)?.first as? RickView {
                    View.rickLabel.text = morty["title"]
                    View.rickView.image = UIImage(named: morty["image"]!)
                    scrollView.addSubview(View)
                    View.frame.size.width = self.view.bounds.size.width
                    View.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                }
                
            }
        }
           
    }


