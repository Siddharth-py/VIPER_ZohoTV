//
//  SearchProtocol.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

protocol SearchViewProtocol: AnyObject {
    func showVideos(_ videos: [Video], thumbnails: [String: String])
}

protocol SearchPresenterProtocol: AnyObject {
    func loadSearchView()
    func searchTextChanged(_ text: String)
    func didSelectVideo(_ video: Video)
}


protocol SearchInteractorProtocol: AnyObject {
    func fetchVideos()
    func filterVideos(with query: String)
}


protocol SearchInteractorOutputProtocol: AnyObject {
    func didFetchVideos(_ videos: [Video], thumbnails: [String: String])
    func didFilterVideos(_ videos: [Video])
}


protocol SearchRouterProtocol: AnyObject {
    func navigateToVideoPlayer(with url: URL)
}
