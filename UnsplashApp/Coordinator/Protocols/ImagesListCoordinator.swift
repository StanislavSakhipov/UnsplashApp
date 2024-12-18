//
//  ImagesCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation
import UIKit

final class ImagesListCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let imagesListViewController = ImagesListAssembly.createImagesListModule(coordinator: self)
        navigationController.pushViewController(imagesListViewController, animated: true)
    }
    
    func showDetail(url: String) {
        let detailCoordinator = DetailImageCoordinator(navigationController: navigationController, url: url)
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
        detailCoordinator.onFinish = { [weak self] in
            self?.finishChild(detailCoordinator)
        }
    }
    
}
