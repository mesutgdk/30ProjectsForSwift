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
    private let ProfileVC = ProfileViewController()
    private let ConnectionVC = ConnectionViewController()

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
        addChild(ProfileVC)
        addChild(ConnectionVC)
        
        view.addSubview(ProfileVC.view)
        view.addSubview(ConnectionVC.view)
        
        ProfileVC.view.frame = view.bounds
        ConnectionVC.view.frame = view.bounds
    
        ProfileVC.didMove(toParent: self)
        ConnectionVC.didMove(toParent: self)
        
        ProfileVC.view.isHidden = true
        ConnectionVC.view.isHidden = true
    }
    @IBAction func menuButtonPressed (){
        present(sideMenu!, animated: true)
        
    }
    func didSelectMenuItem(name: String) {
        sideMenu?.dismiss(animated: true,completion: { [weak self] in
            
            self?.title = name
            
            if name == "HOME" {
                self?.ProfileVC.view.isHidden = true
                self?.ConnectionVC.view.isHidden = true
                
            } else if name == "PROFILES"{
                self?.ProfileVC.view.isHidden = false
                self?.ConnectionVC.view.isHidden = true
                
            }else if name == "CONNECTIONS" {
                self?.ProfileVC.view.isHidden = true
                self?.ConnectionVC.view.isHidden = false
                
            }
        })
    }
    
}

