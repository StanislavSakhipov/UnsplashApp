//
//  MainAssembly.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation

final class ImagesListAssembly {
    static func createImagesListModule(coordinator: ImagesListCoordinator) -> ImagesListViewController {
        let networkService = NetworkService()
        let presenter = ImagesListPresenter(networkService : networkService, coordinator: coordinator)
        let view = ImagesListViewController()
        presenter.view = view
        view.presenter = presenter
        return view
    }
}

