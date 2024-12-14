//
//  NetworkService.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/7/24.
//

import Foundation
import UIKit

enum NetworkServiceError: Error {
    case invalidURL
    case noData
    case failedRequest
    case returnedError
    case decodeError
}

protocol NetworkServiceProtocol {
    func searchImage(query: String, completion: @escaping (Result<Welcome, NetworkServiceError>) -> Void)
    func getImage(url: URL, completion: @escaping (Data, URLResponse) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    private let token = "Ip0XA55zY7b7-d19osq1L5btGg-YCeDZVpnnJjXqHxs"
    private let baseUrl = "https://api.unsplash.com/search/photos?"
    
    func searchImage(query: String, completion: @escaping (Result<Welcome, NetworkServiceError>) -> Void) {
        guard var urlComponents = URLComponents(string: baseUrl) else {
            completion(.failure(.invalidURL))
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: token),
            URLQueryItem(name: "query", value: query)
        ]
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data, let response = response else {
                completion(.failure(.noData))
                return
            }
            do {
                let imageResponse = try JSONDecoder().decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(imageResponse))
                }
            } catch {
                completion(.failure(.decodeError))
            }
        }.resume()
    }
        func getImage(url: URL, completion: @escaping (Data, URLResponse) -> Void ) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data, let response = response else {
                    print("Error Get Image")
                    return
                }
                
                guard url == response.url else {return}
                DispatchQueue.main.async {
                    completion(data, response)
                }
            }.resume()
        }
}
