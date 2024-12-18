//
//  TabBarCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import UIKit

final class TabBarCoordinator: Coordinator{
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var onFinish: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setupTabs()
    }
    
    func setupTabs() {
        
        let tabBarController = UITabBarController()
        let imagesListNav = UINavigationController()
        let favoriteImageNav = UINavigationController()
        
        let imagesListCoordinator = ImagesListCoordinator(navigationController: imagesListNav)
        let favoritesCoordinator = FavoritesImagesCoordinator(navigationController: favoriteImageNav)
        
        childCoordinators.append(imagesListCoordinator)
        childCoordinators.append(favoritesCoordinator)
        
        tabBarController.viewControllers = [imagesListCoordinator.navigationController, favoritesCoordinator.navigationController]
        
        imagesListCoordinator.start()
        favoritesCoordinator.start()
        
        imagesListNav.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), tag: 0)
        favoriteImageNav.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), tag: 1)
        
        tabBarController.viewControllers = [imagesListNav, favoriteImageNav]
        navigationController.setViewControllers([tabBarController], animated: true)
    }
}
