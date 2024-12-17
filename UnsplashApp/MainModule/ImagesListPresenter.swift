//
//  Presenter.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/7/24.
//

import Foundation
import UIKit

final class ImagesListPresenter {
    
    var view: UIViewController
    let networkService: NetworkServiceProtocol
    var arrayImage: [Resultat] = []
    
    init(networkService: NetworkServiceProtocol = NetworkService(), view: UIViewController) {
        self.networkService = networkService
        self.view = view
    }
    
    func getImagesUrls() {
        networkService.searchImage(query: "Apple") { result in switch result {
        case .success(let welcome):
            self.arrayImage = welcome.results
        case .failure(let error):
            print("Error get image Urls")
        }
        }
    }
}
