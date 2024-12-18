//
//  ImageLoadService.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/14/24.
//

import Foundation
import UIKit

protocol ImageLoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (UIImage?)->Void)
}

final class ImageLoadService: ImageLoadServiceProtocol {
    
    static let shared = ImageLoadService()
    
    private init() {}
    
    private let cacheService = ImageCacheService.shared
    let networkService = NetworkService()
    var imageSaved: UIImage?
    
    func loadImage(url: URL, completion: @escaping (UIImage?)->Void) {
        DispatchQueue.global().async {
            let cacheKey = url.absoluteString
            if let cachedImage = self.cacheService.getImage(key: cacheKey) {
                completion(cachedImage)
                return
            }
            self.networkService.getImage(url: url) { data, response in
                guard let image = UIImage(data: data) else {return}
                self.cacheService.saveImage(image: image, key: cacheKey)
               completion(image)
            }
        }
    }
}
