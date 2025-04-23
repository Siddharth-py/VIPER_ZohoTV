//
//  MainTabBarPresenter.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

class MainTabBarPresenter: MainTabBarPresenterProtocol {
    weak var view: MainTabBarViewProtocol?
    var interactor: MainTabBarInteractorProtocol?
    var router: MainTabBarRouter?
}
