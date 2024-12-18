//
//  AppCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    private let isAuthenticated: Bool
    
    init(navigationController: UINavigationController, isAuthenticated: Bool) {
        self.navigationController = navigationController
        self.isAuthenticated = isAuthenticated
    }
    
    func start() {
        if isAuthenticated {
            showMainFlow()
            print("showMain")
        } else {
            showAuthFlow()
            print("authFlow")
        }
    }
    
    func showMainFlow() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.onFinish = { [weak self] in
            self?.finishChild(tabBarCoordinator)
        }
        tabBarCoordinator.start()
    }
    
    func showAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.onFinish = { [weak self] in
            self?.finishChild(authCoordinator)
            DispatchQueue.main.async {
                self?.showMainFlow()
            }
        }
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
    
    func finishChild(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator}) {
            childCoordinators.remove(at: index)
        } else {
            print ("not found on finishChold")
        }
    }
}


