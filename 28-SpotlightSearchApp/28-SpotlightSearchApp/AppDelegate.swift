//
//  AppDelegate.swift
//  28-SpotlightSearchApp
//
//  Created by Mesut Gedik on 27.04.2023.
//

import UIKit
import CoreSpotlight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        indexMoviesForSpotlightSearch()
        return true
    }
    
    private func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if userActivity.activityType == CSSearchableItemActionType {
            if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
                if(uniqueIdentifier == "1") {
                    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let homePage = mainStoryboard.instantiateViewController(withIdentifier: "movies") as! TableViewController
                    self.window?.rootViewController = homePage
                }
                window?.makeKeyAndVisible()
            }
        }
//        if userActivity.activityType == CSSearchableItemActionType {
//            if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
//
//                let viewController = (window?.rootViewController as! UINavigationController).viewControllers[0] as! ViewController
//                viewController.restoreUserActivityState(userActivity)
//            }
//        }
        return true
    }
   

}

