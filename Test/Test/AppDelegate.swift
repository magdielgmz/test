//
//  AppDelegate.swift
//  ZonicApp
//
//  Created by MagdielG on 4/15/20.
//  Copyright © 2020 Magdiel Gómez. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = HomeViewController()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

   


}

