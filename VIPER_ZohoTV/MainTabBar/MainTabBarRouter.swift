//
//  MainTabBarRouter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import UIKit

class MainTabBarRouter {
    static func createModule() -> UIViewController {
        let view = MainTabBarViewController()
        let presenter = MainTabBarPresenter()
        let interactor = MainTabBarInteractor()
        let router = MainTabBarRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        return view
    }
}
