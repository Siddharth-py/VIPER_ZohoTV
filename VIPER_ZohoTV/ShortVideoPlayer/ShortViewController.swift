//
//  ShortViewController.swift
//  VIPER_ZohoTV
//
//  Created by sid-zstch1431 on 23/04/25.
//
import UIKit
import AVKit

class ShortVideoViewController: UIViewController, ShortsViewControllerProtocol {
    
    var presenter: ShortsPresenterProtocol?
    let mainScrollView = UIScrollView()
    private var videoCategories: [VideoCategory] = []
    var activePlayers: [AVPlayer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupMainScrollView()
        presenter?.getshots()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session error: \(error)")
        }
    }

    func showVideoCategories(_ categories: [VideoCategory]) {
        videoCategories = categories
        setupVideoLayers()
    }

    private func setupMainScrollView() {
        mainScrollView.frame = view.bounds
        mainScrollView.isPagingEnabled = true
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.delegate = self
        view.addSubview(mainScrollView)
    }

    private func setupVideoLayers() {
        var yOffset: CGFloat = 0
        for category in videoCategories {
            let horizontalScrollView = UIScrollView(frame: CGRect(x: 0, y: yOffset, width: view.frame.width, height: view.frame.height))
            horizontalScrollView.isPagingEnabled = true
            horizontalScrollView.showsHorizontalScrollIndicator = false
            horizontalScrollView.delegate = self
            mainScrollView.addSubview(horizontalScrollView)

            let videos = category.videos
            horizontalScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(videos.count), height: view.frame.height)

            for (index, video) in videos.enumerated() {
                guard let videoURL = URL(string: video.url) else { continue }

                let player = AVPlayer(url: videoURL)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = CGRect(x: CGFloat(index) * view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
                playerLayer.videoGravity = .resizeAspectFill
                horizontalScrollView.layer.addSublayer(playerLayer)

                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                    player.seek(to: .zero)
                    player.play()
                }
                activePlayers.append(player)
            }
            yOffset += view.frame.height
        }
        mainScrollView.contentSize.height = yOffset
    }

    private func handleVisibleVideos() {
        for player in activePlayers { player.pause() }

        let verticalIndex = Int(mainScrollView.contentOffset.y / view.frame.height)
        guard let horizontalScrollView = mainScrollView.subviews[verticalIndex] as? UIScrollView else { return }

        let horizontalIndex = Int(horizontalScrollView.contentOffset.x / view.frame.width)
        let activeIndex = videoCategories[0..<verticalIndex].reduce(0) { $0 + $1.videos.count } + horizontalIndex

        if activeIndex < activePlayers.count {
            activePlayers[activeIndex].play()
        }
    }
}

extension ShortVideoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        handleVisibleVideos()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        handleVisibleVideos()
    }
}

