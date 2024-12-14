//
//  Cell.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/7/24.
//

import Foundation
import UIKit

final class Cell: UICollectionViewCell {
    
    var mainPresenter: MainPresenter!
    let imageLoadService = ImageLoadService()
    var currentURL: String?
    
    private let labelImage : UILabel = {
        let labelImage = UILabel()
        labelImage.textColor = .black
        labelImage.textAlignment = .center
        return labelImage
    }()
    
    private var imageUnsplah: UIImageView = {
        let imageUnsplash = UIImageView()
        imageUnsplash.contentMode = .scaleAspectFit
        return imageUnsplash
    }()
    
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
        imageStack.addArrangedSubview(labelImage)
        imageStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageStack.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(url: String)
    {
        let urlImage = URL(string: url)
        guard let urlImage else {return}
        DispatchQueue.global().async {
            self.imageLoadService.loadImage(url: urlImage) { image in
                print(Thread.current)
                DispatchQueue.main.async {
                    self.imageUnsplah.image = image
                }
            }
        }
        
    }
    
    override func prepareForReuse() {
        imageUnsplah.image = nil
    }
}
