//
//  ViewController.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/5/24.
//

import UIKit

final class ImageListViewController: UIViewController {

    private var presenter: ImagesListPresenter!
    private let viewCellIdentifier = "cellIdentifier"
    let assemblyImageCell = ImageCellAssembly()
    
    private let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Введите любое слово для поиска картинки"
        
        return searchTextField
    }()
    
    private lazy var imagesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getImagesUrls()
        setupUI()
        DispatchQueue.main.async {
            self.imagesCollection.reloadData()
        }
    }
    private func setupUI() {
        
        view.backgroundColor = .red
        view.addSubview(searchTextField)
        view.addSubview(imagesCollection)
        imagesCollection.backgroundColor = .red
        imagesCollection.delegate = self
        imagesCollection.dataSource = self
        imagesCollection.register(ImageCell.self, forCellWithReuseIdentifier: viewCellIdentifier)
        imagesCollection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchTextField.widthAnchor.constraint(equalToConstant: 80),
            searchTextField.heightAnchor.constraint(equalToConstant: 30),
            
            imagesCollection.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            imagesCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imagesCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            imagesCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }

}

extension ImageListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
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
