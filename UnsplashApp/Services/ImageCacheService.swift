//
//  ImageCashService.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/14/24.
//

import Foundation
import UIKit

class ImageCacheService {
    
    private let cache = NSCache<NSString, UIImage>()
    func getImage(key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    func saveImage(image: UIImage, key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func removeImage(key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}
