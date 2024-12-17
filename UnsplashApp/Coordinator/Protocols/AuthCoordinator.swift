//
//  AuthCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import UIKit

final class AuthCoordinator: Coordinator {
    
        var navigationController: UINavigationController
        
        
        init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }
        
        func start() {
            let authViewCoordinator = AuthViewController()
            navigationController.setViewControllers([authViewCoordinator], animated: false)
        }
    }



