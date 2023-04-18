//
//  AppDelegate.swift
//  22-3D Touch Quick Action
//
//  Created by Mesut Gedik on 15.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let shortcutitem =
            launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if shortcutitem.type == "foranewlife.3D-Touch-Quick-Action.Run" {
                let vc1 = storyBoard.instantiateViewController(identifier: "RunVC") as! RunViewController
                self.window?.rootViewController = vc1
            } else if shortcutitem.type == "foranewlife.3D-Touch-Quick-Action.Qr" {
                let vc2 = storyBoard.instantiateViewController(identifier: "QrVC") as! QrViewController
                self.window?.rootViewController = vc2
            } else if shortcutitem.type == "foranewlife.3D-Touch-Quick-Action.Wifi" {
                let vc3 = storyBoard.instantiateViewController(withIdentifier: "WifiVC") as! WifiViewController
                self.window?.rootViewController = vc3
            }
            else { let vc4 = UIViewController()
                self.window?.rootViewController = vc4
            }
        }
        return true
    }

    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {

    }
    
}

