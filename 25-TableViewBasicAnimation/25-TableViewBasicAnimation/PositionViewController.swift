//
//  PositionViewController.swift
//  25-TableViewBasicAnimation
//
//  Created by Mesut Gedik on 23.04.2023.
//

import UIKit

class PositionViewController: UIViewController {

    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var middleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkText
        middleView.alpha = 0.05
        rightView.alpha = 0.05
        leftView.alpha = 0.05
        rightView.layer.cornerRadius = 10
        leftView.layer.cornerRadius = 10
        middleView.layer.cornerRadius = 40
//        view.backgroundColor = .black
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.8, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: { [self] in
            rightView.alpha = 1
            leftView.alpha = 1
            middleView.alpha = 0.1
            leftView.center.x = view.bounds.width - leftView.center.x
            leftView.center.y = leftView.center.y + 45
            rightView.center.x = view.bounds.width -  rightView.center.x
            rightView.center.y = rightView.center.y + 45

            }, completion: nil )
        
        UIView.animate(withDuration: 0.6, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveLinear, animations: { [self] in
            middleView.alpha = 1
            setHeight(200)
            middleView.center.y = view.bounds.height - middleView.center.y
            }, completion: nil )
        
    }
    func setHeight (_ height: CGFloat){
        var mFrame: CGRect = middleView.frame
        mFrame.size.height = height
        
        middleView.frame = mFrame
        
    }

}
