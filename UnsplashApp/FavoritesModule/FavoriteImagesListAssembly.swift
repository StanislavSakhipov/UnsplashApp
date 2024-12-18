//
//  FavoriteImagesListAssembly.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation

final class FavoriteImagesListAssembly {
    static func createFavoriteImageModule(coordinator: FavoritesImagesCoordinator) -> FavoriteImagesViewController {
        let view = FavoriteImagesViewController()
        let presenter = FavoriteImagesListPresenter(coordinator: coordinator)
        presenter.view = view
        view.presenter = presenter
        return view
    }
}
