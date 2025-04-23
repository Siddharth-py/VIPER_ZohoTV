//
//  MainTabBarProtocols.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation

protocol MainTabBarViewProtocol: AnyObject {
    var presenter: MainTabBarPresenterProtocol? { get set }
}

protocol MainTabBarPresenterProtocol: AnyObject {
    var view: MainTabBarViewProtocol? { get set }
    var interactor: MainTabBarInteractorProtocol? { get set }
    var router: MainTabBarRouter? { get set }
}

protocol MainTabBarInteractorProtocol: AnyObject { }
