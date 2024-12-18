//
//  FavoritesImagesCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import UIKit

final class FavoritesImagesCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoriteImagesCoordinator = FavoriteImagesListAssembly.createFavoriteImageModule(coordinator: self)
        navigationController.pushViewController(favoriteImagesCoordinator, animated: false)
    }
}

