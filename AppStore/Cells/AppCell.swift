//
//  AppCell.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-06.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

class AppCell: BaseAppCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rankingLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 4),
            rankingLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            rankingLabel.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        
        let leftPadding = !(rankingLabel.text == nil) ? rankingLabel.rightAnchor : imageView.rightAnchor
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 4),
            nameLabel.leftAnchor.constraint(equalTo: leftPadding, constant: 8),
            nameLabel.rightAnchor.constraint(equalTo: priceButton.leftAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            categoryLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            categoryLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            priceButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            priceButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            priceButton.widthAnchor.constraint(equalToConstant: 65),
            priceButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

