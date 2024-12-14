//
//  ImageLoadService.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/14/24.
//

import Foundation
import UIKit

class ImageLoadService {
    
    private let cacheService = ImageCacheService()
    let networkService = NetworkService()
    var imageSaved: UIImage?
    
    func loadImage(url: URL, completion: @escaping (UIImage?)->Void) {
        DispatchQueue.global().async {
            let cacheKey = url.absoluteString
            if let cachedImage = self.cacheService.getImage(key: cacheKey) {
                completion(cachedImage)
                print("image cached")
                return
            }
            self.networkService.getImage(url: url) { data, response in
                guard let image = UIImage(data: data) else {return}
                
                print("image geted \(image)")
                self.cacheService.saveImage(image: image, key: cacheKey)
               completion(image)
            }
        }
    }
}
