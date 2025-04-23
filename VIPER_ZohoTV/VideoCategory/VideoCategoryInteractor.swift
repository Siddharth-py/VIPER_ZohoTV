//
//  VideoCategoryInteractor.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

class VideoCategoryInteractor: VideoCategoryInteractorInputProtocol {
    weak var presenter: VideoCategoryInteractorOutputProtocol?
    
    func fetchVideoCategories() {
        let baseVideoURL = "https://test-backet-development.zohostratus.in"
        var categories: [VideoCategory] = []
        var globalCounter = 1
        
        for category in ThumbnailConstants.categories {
            var videos: [Video] = []
            for _ in 1...ThumbnailConstants.thumbnailCountPerCategory {
                let videoURL = "\(baseVideoURL)/\(category)/video\(globalCounter).mp4"
                videos.append(Video(url: videoURL, name: "Video \(globalCounter)"))
                globalCounter += 1
            }
            categories.append(VideoCategory(name: category, videos: videos))
        }

        let thumbnails = ThumbnailConstants.generateThumbnails()
        presenter?.didFetchVideoCategories(categories, thumbnails: thumbnails)
    }
}

