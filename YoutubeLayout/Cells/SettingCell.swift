//
//  SettingCell.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 15/05/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit
import SnapKit


class SettingCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
        }
    }
    
    lazy var iconSetting: UIImageView = {
        var icon = UIImageView()
        icon.image = UIImage(named: "settings")
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    lazy var nameLabel: UILabel = {
        var name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .systemFont(ofSize: 13)
        return name
    }()
    
    func setupCell(with text: String) {
        nameLabel.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SettingCell: CodeView {
    func buildViewHierarchy() {
        
        addSubview(iconSetting)
        addSubview(nameLabel)
    }
    
    func buildConstraints() {
        iconSetting.snp.makeConstraints { (make) in
            make.height.width.equalTo(20)
            make.left.equalTo(self).offset(5)
            make.centerY.equalTo(self)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconSetting.snp.right).offset(10)
            make.right.equalToSuperview().offset(-5)
            make.centerY.equalToSuperview()
        }
        
    }
    
    
}

