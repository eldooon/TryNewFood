//
//  TabBarControllerO.swift
//  TryNewFood
//
//  Created by Eldon Chan on 1/2/18.
//  Copyright © 2018 ByEldon. All rights reserved.
//


import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        
    }
    
    func setupViewControllers() {
        
        // Setting each controller to tab bar controller and setting them as navigation controller
        
        let homeController = DiscoverController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let navController = UINavigationController(rootViewController: homeController)
        
        
        viewControllers = [navController]
    }
}
