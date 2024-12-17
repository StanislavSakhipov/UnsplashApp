//
//  Coordinator.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import UIKit

typealias CoordinatorHandler = () -> ()

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    //var flowComplitionHandler: CoordinatorHandler { get set }
    
    func start()
}
