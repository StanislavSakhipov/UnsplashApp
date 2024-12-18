//
//  AlertCoordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation
import UIKit

final class AlertCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showAlert(title: String, message: String, actions: [UIAlertAction] = []) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if actions.isEmpty {
            let defaultAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(defaultAction)
        } else {
            actions.forEach {alert.addAction($0)}
        }
        navigationController.present(alert, animated: true)
    }
}
