//
//  AppCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    //var flowComplitionHandler: CoordinatorHandler
    
    private var childCoordinators: [Coordinator] = []
    
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMainFlow()
    }
    
    func showMainFlow() {
        let imagesListCoordinator = ImagesListCoordinator(navigationController: navigationController)
        childCoordinators.append(imagesListCoordinator)
        imagesListCoordinator.start()
    }
    
    func showAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
}


