//
//  IconsMenuCell.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 04/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

extension UIImageView {
    func tintImageColor(color : UIColor) {
        self.image = self.image!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.tintColor = color
    }
}

class IconsMenuCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension IconsMenuCell: CodeView {
    
    
    func buildViewHierarchy() {
        addSubview(imageView)
    }
    
    func buildConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(28)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    
}
