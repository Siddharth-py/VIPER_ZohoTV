//
//  MainTabBarViewController.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import UIKit

class MainTabBarViewController: UITabBarController, MainTabBarViewProtocol {

    var presenter: MainTabBarPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .red
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        setupTabs()
    }

    private func setupTabs() {
        let homeVC = VideoCategoryRouter.createModule()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), selectedImage: nil)

        let searchVC = SearchRouter.createModule()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)

        let shortsVC = ShortsRouter.createModule()
        shortsVC.tabBarItem = UITabBarItem(title: "Shorts", image: UIImage(systemName: "swift"), selectedImage: nil)

        viewControllers = [homeVC,shortsVC, searchVC]
    }
}
