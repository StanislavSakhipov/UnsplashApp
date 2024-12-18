//
//  File.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation

protocol ImageCellPresenterProtocol {
    var cell: ImageCell? { get set }
    var imageLoadService: ImageLoadServiceProtocol { get set }
    var isFavorite: Bool { get set}
    func configureCell(url: String)
    func toggleFavorite()
}

final class ImageCellPresenter: ImageCellPresenterProtocol {
   
    weak var cell: ImageCell?
    var imageLoadService: ImageLoadServiceProtocol
    var isFavorite: Bool = false
    
    init(cell: ImageCell, imageLoadService: ImageLoadServiceProtocol) {
        self.cell = cell
        self.imageLoadService = imageLoadService
    }
    
    func configureCell(url: String) {
        guard let urlImage = URL(string: url) else { return }
        imageLoadService.loadImage(url: urlImage) { [weak self] image in
            guard let self = self else { return }
            self.cell?.updateImage(image: image)
        }
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
        cell?.updateHeartButton(isFavorite: isFavorite)
        print(isFavorite)
        // FavoriteImageService.shared.addFavoriteImage(imageID: id, imageURL: url)
    }
    
}
