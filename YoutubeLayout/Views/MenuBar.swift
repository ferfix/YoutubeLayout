//
//  MenuBar.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 04/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    var menuDataSource = MenuBarDataSource()
    
    lazy var collectionViewMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = false
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self.menuDataSource
        cv.delegate = self.menuDataSource
        return cv
    }()
    
    lazy var markView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuBar: CodeView {
    func buildViewHierarchy() {
        self.addSubview(collectionViewMenu)
        self.addSubview(markView)
    }
    
    func buildConstraints() {
        
        collectionViewMenu.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        markView.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
            make.height.equalTo(4)
        }
    }
    
    func configure() {
        self.collectionViewMenu.register(IconsMenuCell.self, forCellWithReuseIdentifier: "IconCell")
        menuDataSource.delegate = self
    }
    
}

extension MenuBar: MenuBarDataSourceDelegate {
    func didSelectItem(at index: Int) {
        // calcula width de 1 celula
        let cellWidth = self.bounds.width / CGFloat(4)
        let newX = cellWidth * CGFloat(index)
        
        self.markView.snp.updateConstraints { make in
            make.left.equalToSuperview().offset(newX)
        }
        UIView.animate(withDuration: 0.4) {
            self.layoutIfNeeded()
        }
    }
}
