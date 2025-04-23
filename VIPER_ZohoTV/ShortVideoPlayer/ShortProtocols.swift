//
//  ShortProtocols.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import Foundation
import UIKit

protocol ShortsViewControllerProtocol: AnyObject {
    func showVideoCategories(_ categories: [VideoCategory])
}

protocol ShortsInteractorProtocol: AnyObject {
    func fetchVideoCategories()
}

protocol ShortsInteractorOutputProtocol: AnyObject {
    func didFetchVideoCategories(_ categories: [VideoCategory])
}

protocol ShortsRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol ShortsPresenterProtocol: AnyObject {
    var view: ShortsViewControllerProtocol? { get set }
    var interactor: ShortsInteractorProtocol? { get set }
    var router: ShortsRouterProtocol? { get set }
    
    func getshots()
}

