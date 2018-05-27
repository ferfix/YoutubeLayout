//
//  VideoCell.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 23/04/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit
import SnapKit

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setupCell(with video: Video) {
        self.imageView.image = UIImage(named: video.imageName!)
        self.titleLabel.text = video.title
        
        if let imageProfile = video.channel?.image {
        self.userProfileImageView.image = UIImage(named: (imageProfile))
        }
    }

    lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .blue
        image.image = UIImage(named: "taylor")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()

    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let userProfileImageView: UIImageView = {
       let userImage = UIImageView()
        userImage.backgroundColor = .green
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.contentMode = .scaleAspectFill
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 22
        userImage.layer.masksToBounds = true
        userImage.image = UIImage(named: "taylor_swift")
        return userImage
    }()
    
    let titleLabel: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Taylor Swift - Blank Space"
        return title
    }()
    
    let subtitleLabel: UITextView = {
       let subtitle = UITextView()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "TaylorSwiftVEVO - 1,604,678,607 views - 2 years ago"
        subtitle.textContainerInset = UIEdgeInsetsMake(0, -3, 0, 5)
        subtitle.textColor = .lightGray
        return subtitle
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VideoCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(separator)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func buildConstraints() {
        imageView.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-16)
            make.left.equalTo(self).offset(16)
            make.top.equalTo(self).offset(16)
            make.bottom.equalTo(userProfileImageView.snp.top).offset(-8)
        }
        
        separator.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        userProfileImageView.snp.makeConstraints { (make) in
            make.height.equalTo(44)
            make.width.equalTo(44)
            make.bottom.equalTo(self).offset(-16)
            make.left.equalTo(self).offset(16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.equalTo(userProfileImageView.snp.right).offset(8)
            make.right.equalTo(self).offset(-16)
            make.height.equalTo(20)
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalTo(userProfileImageView.snp.right).offset(8)
            make.right.equalTo(self).offset(-16)
            make.height.equalTo(30)
        }
        
    }
    
    func configure() {
        self.backgroundColor = .white
    }
    
    
}

