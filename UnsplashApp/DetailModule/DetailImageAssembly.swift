//
//  DetailImageAssembly.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import UIKit

final class DetailImageAssembly {
    static func createDetailImageModule(url: String, coordinator: DetailImageCoordinator) -> DetailImageViewController {
    let view = DetailImageViewController()
    let imageLoadService = ImageLoadService.shared
    let presenter = DetailImagePresenter(imageURL: url, coordinator: coordinator, loadImageService: imageLoadService)
    presenter.view = view
    view.presenter = presenter
    return view
}
}
