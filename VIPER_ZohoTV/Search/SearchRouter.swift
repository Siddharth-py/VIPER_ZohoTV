//
//  SearchRouter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import UIKit
import AVKit

class SearchRouter: SearchRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        let router = SearchRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToVideoPlayer(with url: URL) {
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        viewController?.present(vc, animated: true) {
            vc.player?.play()
        }
    }
}
