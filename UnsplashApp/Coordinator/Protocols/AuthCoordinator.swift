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
        var childCoordinators: [Coordinator] = []
        var onFinish: (() -> Void)?
    
    let alertCoordinator: AlertCoordinator
        
        init(navigationController: UINavigationController) {
            self.navigationController = navigationController
            self.alertCoordinator = AlertCoordinator(navigationController: navigationController)
        }
        
        func start() {
            let authViewController = AuthAssembly.createAuthModule(coordinator: self)
            navigationController.pushViewController(authViewController, animated: false)
        }
    
    func showSuccessAlert() {
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.showToMainFlow()
        }
        alertCoordinator.showAlert(title: "Успешно", message: "Вы вошли ваккаунт", actions: [okAction])
    }
    
    func showErrorAlert(message: String) {
        alertCoordinator.showAlert(title: "Ошибка", message: message)
    }
    
    func showToMainFlow() {
        onFinish?()
    }
    }



