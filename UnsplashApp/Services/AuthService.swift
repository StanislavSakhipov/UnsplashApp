//
//  AuthService.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/18/24.
//

import Foundation
import Firebase
import FirebaseAuth

enum AuthErrorcode: Error {
    case invalidEmail
    case invalidPassword
    case invalidUser
}

final class AuthService {
    
    private let auth = Auth.auth()
    static let shared = AuthService()
    
    func register(email: String, pass: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: pass) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }

    func login(email: String?, pass: String?, completion: @escaping(Result<User, Error>) -> Void) {
        guard let email = email, let pass = pass else {
            completion(.failure(AuthErrorCode.invalidEmail))
            return
        }
        
        auth.signIn(withEmail: email, password: pass) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
}
