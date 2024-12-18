//
//  DetailImagePresenter.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation
import UIKit

final class DetailImagePresenter {
    weak var view: DetailImageViewController?
    
    private let imageURL: String
    private let coordinator: DetailImageCoordinator
    private let loadImageService: ImageLoadServiceProtocol
    
    init(imageURL: String, coordinator: DetailImageCoordinator, loadImageService: ImageLoadServiceProtocol) {
        self.imageURL = imageURL
        self.coordinator = coordinator
        self.loadImageService = loadImageService
    }
    
    func loadImage() {
        guard let url = URL(string: imageURL) else { return }
        loadImageService.loadImage(url: url) { [weak self] image in
            guard let self = self else { return }
            
            if let image = image {
                view?.updateImage(image: image)
            } else {
                let placeholder = UIImage(named: "placeholder")
                view?.updateImage(image: placeholder!)
            }
        }
    }
    
    func dismiss() {
        coordinator.onFinish?()
    }
    
}
