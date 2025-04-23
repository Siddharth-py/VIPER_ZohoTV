//
//  VideoCategoryRouter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import UIKit
import AVKit

class VideoCategoryRouter: VideoCategoryRouterProtocol {
    static func createModule() -> UIViewController {
        let view = VideoCategoryViewController()
        let presenter: VideoCategoryPresenterProtocol & VideoCategoryInteractorOutputProtocol = VideoCategoryPresenter()
        let interactor: VideoCategoryInteractorInputProtocol = VideoCategoryInteractor()
        let router: VideoCategoryRouterProtocol = VideoCategoryRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToVideoPlayer(with url: String, from view: UIViewController) {
        guard let videoURL = URL(string: url) else { return }
        let player = AVPlayer(url: videoURL)
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        view.present(playerVC, animated: true) {
            player.play()
        }
    }
}
