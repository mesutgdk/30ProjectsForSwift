//
//  ViewController.swift
//  23-Side Menu
//
//  Created by Mesut Gedik on 19.04.2023.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuTableViewDelegate {
   
   
//    private let sideMenu = SideMenuNavigationController(rootViewController: MenuTableViewController())
    private var sideMenu: SideMenuNavigationController?
    private let BabyVC = BabyViewController()
    private let ManVC = ManViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuTableViewController()
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
//        sideMenu?.delegate = self
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        addChildcontrollers()
    }
    func addChildcontrollers(){
        addChild(BabyVC)
        addChild(ManVC)
        
        view.addSubview(BabyVC.view)
        view.addSubview(ManVC.view)
        
        BabyVC.view.frame = view.bounds
        ManVC.view.frame = view.bounds
    
        BabyVC.didMove(toParent: self)
        ManVC.didMove(toParent: self)
        
        BabyVC.view.isHidden = true
        ManVC.view.isHidden = true
    }
    @IBAction func menuButtonPressed (){
        present(sideMenu!, animated: true)
        
    }
    func didSelectMenuItem(name: String) {
        sideMenu?.dismiss(animated: true,completion: { [weak self] in
            if name == "KADIN" {
                self?.BabyVC.view.isHidden = true
                self?.ManVC.view.isHidden = true
                
            } else if name == "ERKEK"{
                self?.BabyVC.view.isHidden = false
                self?.ManVC.view.isHidden = true
                
            }else if name == "ÇOCUK" {
                self?.BabyVC.view.isHidden = true
                self?.ManVC.view.isHidden = false
                
            }
        })
    }
    
}

