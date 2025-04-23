//
//  VideoCollectionViewCell.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import UIKit
class VideoCollectionViewCell: UICollectionViewCell {
    static let identifier = "VideoCollectionViewCell"
    
    private let placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(named: "heroImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let videoNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(placeholderImageView)
        contentView.addSubview(videoNameLabel)
        
        NSLayoutConstraint.activate([
            placeholderImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            placeholderImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            placeholderImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            placeholderImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            videoNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
            videoNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with video: Video, thumbnailURL: String) {
        videoNameLabel.text = video.name
        if let url = URL(string: thumbnailURL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.placeholderImageView.image = image
                    }
                }
            }
        }
    }
}
