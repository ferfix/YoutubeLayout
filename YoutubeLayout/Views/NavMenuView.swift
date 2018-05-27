//
//  SettingLauncher.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 09/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit
import SnapKit

class NavMenuView: UIView {
    
    var dataSource: SettingDataSource //pq deixou sem o optional "?"
    //lazy var heightCollection: Int = dataSource.setting.count * 50
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self.dataSource
        cv.delegate = self.dataSource
        return cv
    }()
    
    @objc func hundleDismiss() {
        self.removeFromSuperview()
    }
    
    lazy var heightCollection: Int = dataSource.setting.count * 50
    
    init() {
        dataSource = SettingDataSource()
        
        super.init(frame: UIScreen.main.bounds)
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: "SettingCell")
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NavMenuView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(collectionView)
    }
    
    
    
    func buildConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(0)
        }
    }
    
    func configure() {
        backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hundleDismiss))
        tapGesture.delegate = self
        addGestureRecognizer(tapGesture)
        
        perform(#selector(animateCollectionEntrace), with: nil, afterDelay: 0.1)
    }
    
    @objc
    private func animateCollectionEntrace() {
        collectionView.snp.updateConstraints { make in
            make.height.equalTo(heightCollection)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
}

extension NavMenuView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let touchedView = touch.view else {
            return true
        }
        let result = !touchedView.isDescendant(of: collectionView)
        return result
    }
}
