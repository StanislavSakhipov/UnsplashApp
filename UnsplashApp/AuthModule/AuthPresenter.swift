//
//  AuthPresenter.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation
import FirebaseAuth

final class AuthPresenter {
    weak var coordinator: AuthCoordinator?
    let authService: AuthService
    
    init(coordinator: AuthCoordinator, authService: AuthService = .shared) {
        self.coordinator = coordinator
        self.authService = authService
    }
    
    func handleLogin(email: String, password: String) {
        if email.isEmpty || password.isEmpty {
            coordinator?.showErrorAlert(message: "Заполните оба поля")
        } else {
            authService.login(email: email, pass: password) { result in
                switch result {
                case .success:
                    self.coordinator?.showSuccessAlert()
                    self.coordinator?.showToMainFlow()
                case.failure(let error):
                    self.coordinator?.showErrorAlert(message: "Ошибка при входе")
                }
            }
        }
    }
    
    func handleRegistration(email: String, password: String) {
        if email.isEmpty || password.isEmpty {
            coordinator?.showErrorAlert(message: "Заполните оба поля")
        } else {
            authService.register(email: email, pass: password) { result in
                switch result {
                case .success(_):
                    self.coordinator?.showSuccessAlert()
                    self.coordinator?.showToMainFlow()
                case.failure(let error):
                    self.coordinator?.showErrorAlert(message: "Ошибка при входе")
                }
            }
        }
    }
}
