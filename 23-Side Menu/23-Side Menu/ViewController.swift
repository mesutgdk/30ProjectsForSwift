//
//  ViewController.swift
//  23-Side Menu
//
//  Created by Mesut Gedik on 18.04.2023.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    private let sideMenu = SideMenuNavigationController(rootViewController: UIViewController())
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    @IBAction func didPressedMenuButton() {
     present(sideMenu, animated: true)
    }

}

