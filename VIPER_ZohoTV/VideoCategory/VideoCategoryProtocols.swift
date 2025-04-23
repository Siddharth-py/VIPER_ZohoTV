//
//  VideoCategoryProtocols.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//


import UIKit

protocol VideoCategoryViewProtocol: AnyObject {
    var presenter: VideoCategoryPresenterProtocol? { get set }
    func showCategories(_ categories: [VideoCategory], thumbnails: [String: [String]])
}

protocol VideoCategoryPresenterProtocol: AnyObject {
    var view: VideoCategoryViewProtocol? { get set }
    var interactor: VideoCategoryInteractorInputProtocol? { get set }
    var router: VideoCategoryRouterProtocol? { get set }
    
    func loadView()
    func didSelectVideo(_ video: Video)
}

protocol VideoCategoryInteractorInputProtocol: AnyObject {
    var presenter: VideoCategoryInteractorOutputProtocol? { get set }
    func fetchVideoCategories()
}

protocol VideoCategoryInteractorOutputProtocol: AnyObject {
    func didFetchVideoCategories(_ categories: [VideoCategory], thumbnails: [String: [String]])
}

protocol VideoCategoryRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToVideoPlayer(with url: String, from view: UIViewController)
}
