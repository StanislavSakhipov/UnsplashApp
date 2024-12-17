//
//  Cell.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/7/24.
//

import Foundation
import UIKit

final class Cell: UICollectionViewCell {
    
    var mainPresenter: ImagesListPresenter!
    let imageLoadService = ImageLoadService()
    var currentURL: String?
    var presenter = CellPresenter(view: Cell?, mainPresenter: ImagesListPresenter!)
    
    var isFavorite: Bool = false
    
//    private let labelImage: UILabel = {
//        let labelImage = UILabel()
//        labelImage.textColor = .black
//        labelImage.textAlignment = .center
//        return labelImage
//    }()
    
    private let favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        //favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        favoriteButton.addTarget(self, action: #selector(setupFavoriteButtonTapped), for: .touchUpInside)
        return favoriteButton
    }()
    
    private var imageUnsplah: UIImageView = {
        let imageUnsplash = UIImageView()
        imageUnsplash.contentMode = .scaleAspectFit
        return imageUnsplash
    }()
    
//    private var imageInfoStack: UIStackView = {
//        
//        let imageInfoStack = UIStackView()
//        imageInfoStack.axis = .horizontal
//        return imageInfoStack
//    }()
    private let imageStack: UIStackView = {
        let imageStack = UIStackView()
        imageStack.axis = .vertical
        imageStack.distribution = .equalCentering
        return imageStack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageStack)
        imageStack.addArrangedSubview(imageUnsplah)
        imageStack.addArrangedSubview(favoriteButton)
        imageStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageStack.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(url: String) {
        presenter.loadImage(url: url)
    }
    
    func updateImage(image: UIImage?) {
        imageUnsplah.image = image
    }
    
    func updateHeartButton(isFavorite: Bool) {
        let imageName = isFavorite ? "heat.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func setupFavoriteButtonTapped() {
        presenter.isFavorite.toggle()
    }
    
//    @objc func addToFavorites() {
//        print ("Pressed")
//    }
    
    override func prepareForReuse() {
        imageUnsplah.image = nil
    }
}
