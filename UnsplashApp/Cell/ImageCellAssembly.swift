//
//  ImageCellAssembly.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation

final class ImageCellAssembly {
    func buildImageCellModule(cell: ImageCell, url: String) {
        let imageLoadService = ImageLoadService.shared
        let presenter = ImageCellPresenter(cell: cell, imageLoadService: imageLoadService)
        cell.presenter = presenter
    }
}
