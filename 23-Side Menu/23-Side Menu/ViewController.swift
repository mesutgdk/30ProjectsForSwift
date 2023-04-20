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

    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuTableViewController()
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
//        sideMenu?.delegate = self
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
    }
    @IBAction func menuButtonPressed (){
        present(sideMenu!, animated: true)
        
    }
    func didSelectMenuItem(name: String) {
        sideMenu?.dismiss(animated: true,completion: { [weak self] in
            if name == "KADIN" {
                self?.view.backgroundColor = .white
            } else if name == "ERKEK"{
                self?.view.backgroundColor = .yellow
                
            }else if name == "ÇOCUK" {
                self!.view.backgroundColor = .red
                
            }
        })
    }
    
}

