//
//  SettingDataSouce.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 15/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class SettingDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var setting: [String] = ["Settings", "Profile", "Configure", "List", "Favorites"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return setting.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingCell", for: indexPath) as? SettingCell else {
            return UICollectionViewCell()
        }
        
        let set = setting[indexPath.item]
        cell.setupCell(with: set)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ola")
    }
    
}
