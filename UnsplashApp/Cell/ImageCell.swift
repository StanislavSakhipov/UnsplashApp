//
//  Cell.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/7/24.
//

import Foundation
import UIKit

final class ImageCell: UICollectionViewCell {
    
    var presenter: ImageCellPresenterProtocol!
    
    private let labelImage: UILabel = {
        let labelImage = UILabel()
        labelImage.textColor = .black
        labelImage.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        labelImage.textAlignment = .left
        labelImage.translatesAutoresizingMaskIntoConstraints = false
        labelImage.text = "Image name..."
        return labelImage
    }()
    
    private let favoriteButton: UIButton = {
        let favoriteButton = UIButton()
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.addTarget(self, action: #selector(setupFavoriteButtonTapped), for: .touchUpInside)
        return favoriteButton
    }()
    
    private var imageUnsplah: UIImageView = {
        let imageUnsplash = UIImageView()
        imageUnsplash.contentMode = .scaleAspectFill
        imageUnsplash.clipsToBounds = true
        imageUnsplash.translatesAutoresizingMaskIntoConstraints = false
        return imageUnsplash
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(imageUnsplah)
        contentView.addSubview(labelImage)
        contentView.addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([
            imageUnsplah.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageUnsplah.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageUnsplah.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageUnsplah.heightAnchor.constraint(equalToConstant: 200),
            
            labelImage.topAnchor.constraint(equalTo: imageUnsplah.bottomAnchor, constant: 8),
            labelImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            labelImage.trailingAnchor.constraint(lessThanOrEqualTo: favoriteButton.leadingAnchor, constant: -8),
            labelImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateImage(image: UIImage?) {
        DispatchQueue.main.async{
            self.imageUnsplah.image = image
        }
    }
    
    func updateHeartButton(isFavorite: Bool) {
        DispatchQueue.main.async {
            if let imageName = isFavorite ? "heat.fill" : "heart" {
                self.favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
        }
    }
    
    @objc private func setupFavoriteButtonTapped() {
        presenter.toggleFavorite()
    }
    
//    @objc func addToFavorites() {
//        print ("Pressed")
//    }
    
    override func prepareForReuse() {
        imageUnsplah.image = nil
    }
}
