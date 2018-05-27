//
//  VideosDataSource.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 03/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class VideosDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video] = []
    
    init(videos: [Video]) {
        self.videos = videos
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? VideoCell else {
            return UICollectionViewCell()
        }
        
        let video = videos[indexPath.row]
        cell.setupCell(with: video)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (collectionView.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: collectionView.frame.width, height: height + 16 + 68)
    }
    
    
}
