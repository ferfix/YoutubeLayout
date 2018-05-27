//
//  ViewCode.swift
//  YoutubeLayout
//
//  Created by Fernanda Bezerra on 25/04/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func buildConstraints()
    func configure()
    func setup()
}

extension CodeView {
    func setup() {
        buildViewHierarchy()
        buildConstraints()
        configure()
    }
    
    func configure() {
        
    }
}

