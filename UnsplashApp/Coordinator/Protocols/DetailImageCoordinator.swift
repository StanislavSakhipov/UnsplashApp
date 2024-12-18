//
//  DetailImageCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation
import UIKit

final class DetailImageCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var onFinish: (() -> Void)?
    private let url: String
    
    init(navigationController: UINavigationController, url: String) {
        self.navigationController = navigationController
        self.url = url
    }
    
    func start() {
        let detailViewController = DetailImageAssembly.createDetailImageModule(url: url, coordinator: self)
        detailViewController.onDismiss = { [weak self] in
            self?.onFinish?()
        }
        navigationController.pushViewController(detailViewController, animated: true)
    }
}


