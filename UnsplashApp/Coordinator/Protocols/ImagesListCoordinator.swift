//
//  ImagesCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import UIKit

final class ImagesListCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
       
    }
    
    func start() {
        let imagesListViewController = ImagesListAssembly.createImagesListModule()
        navigationController.setViewControllers([imagesListViewController], animated: false)
    }
    
}
