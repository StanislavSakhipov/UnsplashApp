//
//  SecondViewController.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import UIKit

class FavoriteImagesViewController: UIViewController {
    
    var presenter: FavoriteImagesListPresenterProtocol!
    
    private let favoriteTableView: UITableView = {
        let favoriteTableView = UITableView()
        favoriteTableView.translatesAutoresizingMaskIntoConstraints = false
        let viewCellIdentifier = "viewCell"
        favoriteTableView.register(UITableViewCell.self, forCellReuseIdentifier: viewCellIdentifier)
        return favoriteTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(favoriteTableView)
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        NSLayoutConstraint.activate([
            favoriteTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension FavoriteImagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.arrayFavoriteImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "viewCell", for: indexPath)
        cell.textLabel?.text = presenter.arrayFavoriteImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Вы выбрали: \(presenter.arrayFavoriteImages[indexPath.row])")
        favoriteTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
