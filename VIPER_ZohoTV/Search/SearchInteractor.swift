//
//  SearchInteractor.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

class SearchInteractor: SearchInteractorProtocol {
    weak var presenter: SearchInteractorOutputProtocol?
    
    private var videos: [Video] = []
    private var thumbnails: [String: String] = [:]
    
    func fetchVideos() {
        videos = generateVideos()
        thumbnails = generateThumbnails()
        presenter?.didFetchVideos(videos, thumbnails: thumbnails)
    }

    func filterVideos(with query: String) {
        if query.isEmpty {
            presenter?.didFilterVideos(videos)
        } else {
            let filtered = videos.filter { $0.name.lowercased().contains(query.lowercased()) }
            presenter?.didFilterVideos(filtered)
        }
    }
    
    private func generateVideos() -> [Video] {
        let baseVideoURL = "https://test-backet-development.zohostratus.in"
        let categories = ["Category1", "Category2", "Category3", "Category4", "Category5"]
        let videoCountPerCategory = 4
        var allVideos: [Video] = []
        var globalVideoCounter = 1
        
        for category in categories {
            for _ in 1...videoCountPerCategory {
                let videoURL = "\(baseVideoURL)/\(category)/video\(globalVideoCounter).mp4"
                let videoName = "Video \(globalVideoCounter)"
                allVideos.append(Video(url: videoURL, name: videoName))
                globalVideoCounter += 1
            }
        }
        
        return allVideos
    }

    private func generateThumbnails() -> [String: String] {
        let baseThumbnailURL = "https://test-backet-development.zohostratus.in"
        let categories = ["Category1", "Category2", "Category3", "Category4", "Category5"]
        let thumbnailCountPerCategory = 4
        var thumbnails: [String: String] = [:]
        var globalImageCounter = 1

        for category in categories {
            for _ in 1...thumbnailCountPerCategory {
                let thumbnailURL = "\(baseThumbnailURL)/\(category)/image\(globalImageCounter).png"
                let videoName = "Video \(globalImageCounter)"
                thumbnails[videoName] = thumbnailURL
                globalImageCounter += 1
            }
        }

        return thumbnails
    }
}
