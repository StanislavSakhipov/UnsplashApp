//
//  ViewController.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/5/24.
//

import UIKit

final class ViewController: UIViewController {

    var mainPresenter: MainPresenter!
    
    private let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Введите любое слово для поиска картинки"
        
        return searchTextField
    }()
    
    private let viewCellIdentifier = "cellIdentifier"
    
    private lazy var imagesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        let imagesCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //layout.translatesAutoresizingMaskIntoConstraints = false
        //layout.backgroundColor = .red
        layout.itemSize = CGSize(width: 400, height: 600)
        //layout.delegate = self
        //layout.dataSource = self
        //layout.register(Cell.self, forCellWithReuseIdentifier: viewCellIdentifier)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainPresenter.getImagesUrls()
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
        imagesCollection.register(Cell.self, forCellWithReuseIdentifier: viewCellIdentifier)
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainPresenter.arrayImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imagesCollection.dequeueReusableCell(withReuseIdentifier: viewCellIdentifier, for: indexPath) as?  Cell
        else {return UICollectionViewCell()}
        let url = mainPresenter.arrayImage[indexPath.item].urls.small
        cell.currentURL = url
        if cell.currentURL == url {
            cell.configure(url: url)}
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 170, height: 200)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        15
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        15
//    }
}
