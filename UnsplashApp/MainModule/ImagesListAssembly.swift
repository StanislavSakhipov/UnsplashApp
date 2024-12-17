//
//  MainAssembly.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation

final class MainAssembly {
    static func createModule() -> ImageListViewController {
        let networkService = NetworkService()
        let view = ImageListViewController()
        let presenter = ImagesListPresenter(networkService: networkService, view: view)
        presenter.view = view
        return view
    }
}

