//
//  ShortRouter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import UIKit

class ShortsRouter: ShortsRouterProtocol {
    static func createModule() -> UIViewController {
        let view = ShortVideoViewController()
        let presenter = ShortsPresenter()
        let interactor = ShortsInteractor()
        let router = ShortsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
