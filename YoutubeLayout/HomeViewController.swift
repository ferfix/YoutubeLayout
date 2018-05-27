//
//  ViewController.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 22/04/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    var dataSource: VideosDataSource?
    
    
    var videos: [Video] = {
        var kanyeChannel = Channel()
        kanyeChannel.name = "Kanye Channel"
        kanyeChannel.image = "profile_taylor"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space!"
        blankSpaceVideo.imageName = "taylor"
        blankSpaceVideo.channel = kanyeChannel
        
        var badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood"
        badBloodVideo.imageName = "images"
        badBloodVideo.channel = kanyeChannel
        
        var video = Video()
        video.title = "Taylor Swift - Blank Space!"
        video.imageName = "taylor"
        video.channel = kanyeChannel
        
        var video1 = Video()
        video1.title = "Taylor Swift - Blank Space!"
        video1.imageName = "taylor"
        video1.channel = kanyeChannel
        
        return [blankSpaceVideo, badBloodVideo, video, video1]

    }()
    
    enum NavMenuState {
        case initial, showing
    }
    
    var navMenuState: NavMenuState = .initial {
        didSet {
            let window = UIApplication.shared.keyWindow
            window?.addSubview(NavMenuView())
        }
    }
    
    
    let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBarButton()
    }
    
    func setupNavigationBarApperance() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.hidesBarsOnSwipe = true
    }
    
    func setupNavBarButton() {
        
        let searchIcon = UIImageView()
        searchIcon.image = UIImage(named: "search.png")
        searchIcon.tintImageColor(color: .white)
        let searchButton = UIBarButtonItem(image: searchIcon.image, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIImage(named: "nav.png")
        let navButton = UIBarButtonItem(image: moreButton, style: .plain, target: self, action: #selector(hundleNavButton))
        navigationItem.rightBarButtonItems = [navButton, searchButton]
    }
    
    @objc
    func handleSearch() {
        
    }
    
    @objc
    func hundleNavButton() {
        navMenuState = .showing
    }
    
    
    func setupView() {
        homeView.collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        dataSource = VideosDataSource(videos: videos)
        homeView.collectionView.dataSource = dataSource
        homeView.collectionView.delegate = dataSource
        homeView.collectionView.reloadData()
    }
}
