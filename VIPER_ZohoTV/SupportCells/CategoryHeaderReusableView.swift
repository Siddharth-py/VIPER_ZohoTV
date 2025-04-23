//
//  CategoryHeaderReusableView.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//


import UIKit

class CategoryHeaderReusableView: UICollectionReusableView {
    static let identifier = "CategoryHeaderReusableView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            titleLabel.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        backgroundImageView.isHidden = true
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .left
    }
    
    func configureAsHeroHeader(with image: UIImage?) {
        backgroundImageView.isHidden = false
        backgroundImageView.image = image
        titleLabel.text = nil
    }
}
