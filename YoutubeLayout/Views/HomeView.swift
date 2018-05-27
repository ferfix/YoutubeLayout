//
//  ManuBar.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 03/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    fileprivate(set) lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .clear
        //view.contentInset = UIEdgeInsetsMake(20, 20, 20, 20)
        view.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        return view
    }()

    lazy var bar: MenuBar = {
        var bar = MenuBar()
        return bar
    }()
    
    init() {
       
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: CodeView {
    
    func buildViewHierarchy() {
        self.addSubview(bar)
        self.addSubview(collectionView)
    }
    
    func buildConstraints() {
        bar.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bar.snp.bottom)
        }
    }
    
    func configure() {
        self.backgroundColor = .white
    }
    
}
