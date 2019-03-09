//
//  BaseAppCell.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-06.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

class BaseAppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            imageView.setImageFromURL(url: app!.imageURL)
            
            nameLabel.text = app?.name
            categoryLabel.text = app?.category
            
            let price = app?.formattedPrice == "Free" ? "GET" : app?.formattedPrice
            priceButton.setTitle(price, for: .normal)
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let rankingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Theme.lightTextColor
        label.font = UIFont.systemFont(ofSize: 13)
        label.sizeToFit()
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Theme.buttonBackgroundColor
        button.setTitleColor(Theme.defaultTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for subview in [imageView, rankingLabel, nameLabel, categoryLabel, priceButton] {
            addSubview(subview)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

