//
//  Shortpresenter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

class ShortsPresenter: ShortsPresenterProtocol {
    var view: (any ShortsViewControllerProtocol)!
    
    var interactor: (any ShortsInteractorProtocol)!
    
    var router: (any ShortsRouterProtocol)!
//    
//    weak var view: ShortsViewProtocol?
//    var interactor: ShortsInteractorProtocol?
//    var router: ShortsRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchVideoCategories()
    }
}

extension ShortsPresenter: ShortsInteractorOutputProtocol {
    func didFetchVideoCategories(_ categories: [VideoCategory]) {
        view?.showVideoCategories(categories)
    }
}
