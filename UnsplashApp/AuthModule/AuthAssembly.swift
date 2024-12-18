//
//  AuthAssembly.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation

final class AuthAssembly {
    static func createAuthModule(coordinator: AuthCoordinator) -> AuthViewController {
        let presenter = AuthPresenter(coordinator: coordinator)
        let view = AuthViewController()
        view.presenter = presenter
        return view
    }
}
