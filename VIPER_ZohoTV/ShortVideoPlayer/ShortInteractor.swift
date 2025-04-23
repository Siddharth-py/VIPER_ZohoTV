//
//  ShortInteractor.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

class ShortsInteractor: ShortsInteractorProtocol {
    weak var presenter: ShortsInteractorOutputProtocol?

    func fetchVideoCategories() {
        let baseVideoURL = "https://test-backet-development.zohostratus.in"
        var categories: [VideoCategory] = []
        var counter = 1

        for category in ThumbnailConstants.categories {
            var videos: [Video] = []
            for _ in 1...ThumbnailConstants.thumbnailCountPerCategory {
                let url = "\(baseVideoURL)/\(category)/video\(counter).mp4"
                videos.append(Video(url: url, name: "Video \(counter)"))
                counter += 1
            }
            categories.append(VideoCategory(name: category, videos: videos))
        }

        presenter?.didFetchVideoCategories(categories)
    }
}
