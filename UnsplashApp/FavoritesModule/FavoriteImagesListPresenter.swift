//
//  FavoriteViewControllerPresenter.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation
import UIKit

protocol FavoriteImagesListPresenterProtocol: AnyObject {
    var view: UIViewController? { get }
    var arrayFavoriteImages: [String] { get }
}

final class FavoriteImagesListPresenter: FavoriteImagesListPresenterProtocol {
    weak var view: UIViewController?
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    var arrayFavoriteImages: [String] = ["1","2","3","4",]
}
