//
//  SearchPresenter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorProtocol?
    var router: SearchRouterProtocol?

    private var thumbnails: [String: String] = [:]

    func loadSearchView() {
        interactor?.fetchVideos()
    }

    func searchTextChanged(_ text: String) {
        interactor?.filterVideos(with: text)
    }

    func didSelectVideo(_ video: Video) {
        guard let url = URL(string: video.url) else { return }
        router?.navigateToVideoPlayer(with: url)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func didFetchVideos(_ videos: [Video], thumbnails: [String: String]) {
        self.thumbnails = thumbnails
        view?.showVideos(videos, thumbnails: thumbnails)
    }

    func didFilterVideos(_ videos: [Video]) {
        view?.showVideos(videos, thumbnails: thumbnails)
    }
}
