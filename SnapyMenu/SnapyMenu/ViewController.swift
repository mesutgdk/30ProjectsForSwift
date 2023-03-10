//
//  ViewController.swift
//  SnapyMenu
//
//  Created by Mesut Gedik on 7.03.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(scrollView.contentSize.width)
        print(scrollView.contentSize.width)

        print(scrollView.contentSize.width)

        print(scrollView.contentSize.width)
        print(scrollView.contentSize.width)
        print(scrollView.contentSize.width)


        let View1 : FirstView = FirstView(nibName: "FirstView", bundle: nil)
        let View2 : SecondView = SecondView(nibName: "SecondView", bundle: nil)
        let View3 : ThirdView = ThirdView(nibName: "ThirdView", bundle: nil)


        addChild(View1)
        scrollView.addSubview(View1.view)
        View1.didMove(toParent: self)

        addChild(View2)
        scrollView.addSubview(View2.view)
        View2.didMove(toParent: self)

        addChild(View3)
        scrollView.addSubview(View3.view)
        View3.didMove(toParent: self)

        var View2Frame : CGRect = View2.view.frame
        View2Frame.origin.x = self.view.frame.width
        View2.view.frame = View2Frame

        var View3Frame : CGRect = View3.view.frame
        View3Frame.origin.x = 2 * self.view.frame.width
        View3.view.frame = View3Frame

            // because we have 2 view screen, we need to make "the x view frame" double(*2)
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3 , self.view.frame.size.height)

        }

    
    
    
}

