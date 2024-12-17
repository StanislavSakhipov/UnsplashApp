//
//  FavoriteImagesListAssembly.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation

final class FavoriteImagesListAssembly {
    static func createFavoriteImageModule() {
        let view = FavoriteImagesViewController()
        let presenter = FavoriteImagesListPresenter()
        presenter.view = view
        view.presenter = presenter
    }
}
