//
//  File.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import Foundation

final class CellPresenter {
    
    let view: Cell
    var isFavorite: Bool = false

    var mainPresenter: ImagesListPresenter!
    let imageLoadService = ImageLoadService()
    
    init(view: Cell, mainPresenter: ImagesListPresenter!) {
        self.view = view
        self.mainPresenter = mainPresenter
    }
    
    func loadImage() {
        guard let urlImage = URL(string: url) else {return}
        imageLoadService.loadImage(url: urlImage) { [weak self] image in
            guard let self = self else {return}
            self.view.updateImage(image: image)
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
        view.updateHeartButton(isFavorite: isFavorite)
    }
    
    
    
}
