//
//  HomeViewController.swift
//  Test
//
//  Created by MagdielG on 24/07/20.
//

import UIKit

@available(iOS 13.0, *)
class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = generateNavController(vc: ViewController(), title: "Login", image: UIImage(systemName: "person.fill")!)
        let nav1 = generateNavController(vc: HomeController(), title: "Home", image: UIImage(systemName: "house.fill")!)
        
        
       // UINavigationBar.appearance().prefersLargeTitles = true
        viewControllers = [nav, nav1]
        
        
        
        
    }
    

    
    // MARK: - Navigation
    
     func generateNavController(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        vc.navigationItem.title = title
        navController.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.badgeColor = .black
        return navController
    }


}

