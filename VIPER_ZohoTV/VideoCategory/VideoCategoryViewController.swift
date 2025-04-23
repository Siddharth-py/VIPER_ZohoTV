//
//  VideoCategoryViewController.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//

import UIKit
import AVKit

class VideoCategoryViewController: UIViewController, VideoCategoryViewProtocol {

    var presenter: VideoCategoryPresenterProtocol?

    private var videoCategories: [VideoCategory] = []
    private var thumbnails: [String: [String]] = [:]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return VideoCategoryViewController.createSectionLayout(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        collectionView.register(CategoryHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeaderReusableView.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.loadView()
    }

    private func setupUI() {
        view.backgroundColor = .black
        navigationItem.title = "Home"
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func showCategories(_ categories: [VideoCategory], thumbnails: [String: [String]]) {
        self.videoCategories = categories
        self.thumbnails = thumbnails
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    static func createSectionLayout(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(0.8)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .absolute(250)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: sectionIndex == 0 ? .absolute(400) : .absolute(50)
                ),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
        ]

        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16)
        section.interGroupSpacing = 10
        return section
    }

    private func presentVideoNotFoundAlert(for videoName: String) {
        let alertController = UIAlertController(title: "Video Not Found", message: "The video '\(videoName)' could not be found.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }

//    func playVideo(from urlString: String, videoName: String) {
//        guard let url = URL(string: urlString) else {
//            presentVideoNotFoundAlert(for: videoName)
//            return
//        }
//        let player = AVPlayer(url: url)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        present(playerViewController, animated: true) {
//            player.play()
//        }
//    }
}

extension VideoCategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return videoCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoCategories[section].videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as? VideoCollectionViewCell else {
            return UICollectionViewCell()
        }
        let video = videoCategories[indexPath.section].videos[indexPath.row]
        let thumbnailURL = thumbnails[videoCategories[indexPath.section].name]?[indexPath.row] ?? ""
        cell.configure(with: video, thumbnailURL: thumbnailURL)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryHeaderReusableView.identifier, for: indexPath) as? CategoryHeaderReusableView else {
            return UICollectionReusableView()
        }

        if indexPath.section == 0 {
            header.configureAsHeroHeader(with: UIImage(named: "heroImage"))
        } else {
            header.configure(with: videoCategories[indexPath.section].name)
        }
        return header
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = videoCategories[indexPath.section].videos[indexPath.row]
        presenter?.didSelectVideo(video)
    }
}

