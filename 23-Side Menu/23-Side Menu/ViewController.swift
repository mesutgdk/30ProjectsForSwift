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
    private let MordorVC = MordorViewController()
    private let MinasTirithVC = MTViewController()

   
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
        addChild(MordorVC)
        addChild(MinasTirithVC)
        
        view.addSubview(MordorVC.view)
        view.addSubview(MinasTirithVC.view)
        
        MordorVC.view.frame = view.bounds
        MinasTirithVC.view.frame = view.bounds
    
        MordorVC.didMove(toParent: self)
        MinasTirithVC.didMove(toParent: self)
        
        MordorVC.view.isHidden = true
        MinasTirithVC.view.isHidden = true
    }
    @IBAction func menuButtonPressed (){
        present(sideMenu!, animated: true)
        
    }
    func didSelectMenuItem(name: String) {
        sideMenu?.dismiss(animated: true,completion: { [weak self] in
            
            self?.title = name
            
            if name == "HOME" {
                self?.MordorVC.view.isHidden = true
                self?.MinasTirithVC.view.isHidden = true
                
            } else if name == "MORDOR"{
                self?.MordorVC.view.isHidden = false
                self?.MinasTirithVC.view.isHidden = true
//                self?.MordorVC.image.isHidden = false
                
            }else if name == "MINAS TIRITH" {
                self?.MordorVC.view.isHidden = true
                self?.MinasTirithVC.view.isHidden = false
                
            }
        })
    }
    
}

