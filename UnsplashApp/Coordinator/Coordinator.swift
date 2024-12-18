//
//  Coordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func finishChild(_ coordinator: Coordinator)
}

extension Coordinator {
    func finishChild(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator}
    }
}
