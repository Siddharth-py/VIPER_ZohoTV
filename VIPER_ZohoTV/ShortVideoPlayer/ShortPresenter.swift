//
//  Shortpresenter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

class ShortsPresenter: ShortsPresenterProtocol {
    weak var view: ShortsViewControllerProtocol?
    var interactor: ShortsInteractorProtocol?
    var router: ShortsRouterProtocol?

    func getshots() {
        interactor?.fetchVideoCategories()
    }
}

extension ShortsPresenter: ShortsInteractorOutputProtocol {
    func didFetchVideoCategories(_ categories: [VideoCategory]) {
        view?.showVideoCategories(categories)
    }
}
