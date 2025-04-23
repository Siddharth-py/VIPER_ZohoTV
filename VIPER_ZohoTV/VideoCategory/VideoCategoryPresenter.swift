//
//  VideoCategoryPresenter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//
import Foundation
import UIKit

class VideoCategoryPresenter: VideoCategoryPresenterProtocol, VideoCategoryInteractorOutputProtocol {
    weak var view: VideoCategoryViewProtocol?
    var interactor: VideoCategoryInteractorInputProtocol?
    var router: VideoCategoryRouterProtocol?
    
    func loadView() {
        interactor?.fetchVideoCategories()
    }
    
    func didFetchVideoCategories(_ categories: [VideoCategory], thumbnails: [String: [String]]) {
        view?.showCategories(categories, thumbnails: thumbnails)
    }
    
    func didSelectVideo(_ video: Video) {
        guard let viewController = view as? UIViewController else { return }
        router?.navigateToVideoPlayer(with: video.url, from: viewController)
    }
}
