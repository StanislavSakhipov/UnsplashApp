//
//  ViewController.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/5/24.
//

import UIKit

final class ImagesListViewController: UIViewController {

    var presenter: ImagesListPresenter!
    private let viewCellIdentifier = "cellIdentifier"
    let assemblyImageCell = ImageCellAssembly()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        //searchTextField.backgroundColor = .systemGray
        searchTextField.placeholder = "Введите любое слово для поиска.."
        return searchTextField
    }()
    
    private let searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitle("Искать", for: .normal)
        searchButton.backgroundColor = .systemRed
        searchButton.tintColor = .black
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return searchButton
    }()
    
    private lazy var imagesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(imagesCollection)
        setupActivityIndicator()
        imagesCollection.backgroundColor = .systemBackground
        imagesCollection.delegate = self
        imagesCollection.dataSource = self
        imagesCollection.register(ImageCell.self, forCellWithReuseIdentifier: viewCellIdentifier)
        imagesCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchTextField.widthAnchor.constraint(equalToConstant: 300),
            searchTextField.heightAnchor.constraint(equalToConstant: 30),
            
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            searchButton.widthAnchor.constraint(equalToConstant: 70),
            searchButton.heightAnchor.constraint(equalToConstant: 30),
            
            imagesCollection.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            imagesCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imagesCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            imagesCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
    
    @objc private func searchButtonTapped() {
        activityIndicator.startAnimating()
        presenter.getImagesUrls(text: searchTextField.text ?? "")
    }
    
    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        activityIndicator.center = view.center
    }
    
}

extension ImagesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.arrayImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imagesCollection.dequeueReusableCell(withReuseIdentifier: viewCellIdentifier, for: indexPath) as?  ImageCell
        else {return UICollectionViewCell()}
        let url = presenter.arrayImage[indexPath.item].urls.small
        let _ = assemblyImageCell.buildImageCellModule(cell: cell, url: url)
        cell.presenter.configureCell(url: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.imageDidSelected(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth: CGFloat = 20
        let totalSpacing = (itemsPerRow + 1) * paddingWidth
        let itemWidth = (collectionView.bounds.width - totalSpacing) / itemsPerRow
        return CGSize(width: itemWidth, height: itemWidth * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

extension ImagesListViewController: MainViewProtocol {
    func success() {
        imagesCollection.reloadData()
        activityIndicator.stopAnimating()
    }
    
    func failure(error: any Error) {
        // alert error
    }
}
