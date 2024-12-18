//
//  Presenter.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/7/24.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol ImagesListPresenterProtocol: AnyObject {
    var networkService: NetworkServiceProtocol { get set }
    func getImagesUrls(text: String)
}

final class ImagesListPresenter: ImagesListPresenterProtocol {

    weak var view: MainViewProtocol?
    var networkService: NetworkServiceProtocol
    var arrayImage: [Resultat] = []
    var coordinator: ImagesListCoordinator
    
    init(networkService: NetworkServiceProtocol = NetworkService(), coordinator: ImagesListCoordinator) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    func getImagesUrls(text: String) {
        networkService.searchImage(query: text) { result in 
            switch result {
        case .success(let welcome):
            self.arrayImage = welcome.results
            self.view?.success()
        case .failure(let error):
            self.view?.failure(error: error)
            print("Error get image Urls")
        }
        }
    }
    
    func imageDidSelected(indexPath: IndexPath) {
        let url = arrayImage[indexPath.item].urls.small
        coordinator.showDetail(url: url)
//        let id = arrayImage[indexPath.item].id
//        FavoriteImageService.shared.addFavoriteImage(imageID: id, imageURL: url)
    }
}
