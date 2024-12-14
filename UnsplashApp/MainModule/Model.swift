//
//  Model.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/5/24.
//

import Foundation

struct Welcome: Codable {
    let total, totalPages: Int
    let results: [Resultat]
    

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct Resultat: Codable {
    let urls: Urls
}

struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

