//
//  ViewController.swift
//  SnapyMenu
//
//  Created by Mesut Gedik on 7.03.2023.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var View1 : FirstView = FirstView(nibName: "FirstView", bundle: nil)
        var View2 : SecondView = SecondView(nibName: "SecondView", bundle: nil)
        
        addChild(View1)
        scrollView.addSubview(View1.view)
        View1.didMove(toParent: self)
        
        addChild(View2)
        scrollView.addSubview(View2.view)
        View2.didMove(toParent: self)
    }

    
    
    
}

