//
//  MenuBarDataSource.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 04/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

protocol MenuBarDataSourceDelegate: class {
    func didSelectItem(at index: Int)
}

class MenuBarDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let images = ["home.pgn", "list.png", "video.png", "perfil.png"]
    
    weak var delegate: MenuBarDataSourceDelegate?
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 4
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath) as? IconsMenuCell else {
            return UICollectionViewCell()
        }
        let index = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: index, animated: false, scrollPosition: [])
        
        cell.imageView.image = UIImage(named: images[indexPath.item])
        cell.imageView.tintImageColor(color: UIColor.rgb(red: 91, green: 14, blue: 13))
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(at: indexPath.row)
    }
    
    
}
