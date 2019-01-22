//
//  ListAvailablePlaces.swift
//  MerlinJobsDiscounts
//
//  Created by Omar Torres on 1/16/19.
//  Copyright © 2019 OmarTorres. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers { (success) in
            print("setup success")
        }
    }
    
    func setupViewControllers(completion: @escaping Callback) {
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "gridIcon"), selectedImage: #imageLiteral(resourceName: "gridIcon"), rootViewController: ListAvailablePlacesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let mapNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "mapIcon"), selectedImage: #imageLiteral(resourceName: "mapIcon"), rootViewController: MapAvailablePlacesViewController())
        
        tabBar.tintColor = UIColor.mainGreen()
        
        viewControllers = [homeNavController, mapNavController]
        
        completion(true)
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
