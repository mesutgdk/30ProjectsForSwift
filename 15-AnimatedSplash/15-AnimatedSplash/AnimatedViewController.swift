//
//  ViewController.swift
//  15-AnimatedSplash
//
//  Created by Mesut Gedik on 28.03.2023.
//

import UIKit

class AnimatedViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "Eksi")
        return imageView
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
//        view.backgroundColor = .link
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center

        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 5.7
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
            //self.imageView.alpha = 0
        }
        UIView.animate(withDuration: 1.5) {
            self.imageView.alpha = 0
        } completion: { finished in
            if finished {
                //geçiş hızlı oluyor, yavaşlatmak gerekli
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    self.performSegue(withIdentifier: "GoToFS", sender: nil)
                    
//                    let viewController = HomeViewController()
//                    viewController.modalTransitionStyle = .crossDissolve
//                    viewController.modalPresentationStyle = .fullScreen
//                    self.present(viewController, animated: true)
                })
                
            }
        }

    }

}

