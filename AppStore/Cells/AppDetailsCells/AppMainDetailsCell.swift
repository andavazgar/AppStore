//
//  AppMainDetailsCell.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-06.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

class AppMainDetailsCell: BaseAppCell {
    
    override var app: App? {
        didSet {
            developerLabel.text = app?.developer
            rating = app?.rating
            ratingLabel.text = String(rating)
            ageRatingLabel.text = app?.ageRating
            rankingLabel.text = "#1"
            if let ratingCount = app?.ratingCount {
                ratingCountLabel.text = "\(ratingCount.kmFormatted) Ratings"
            }
        }
    }
    var rating: Double!
    
    let developerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Theme.lightTextColor
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Theme.headerFont
        label.textColor = Theme.lightTextColor
        label.sizeToFit()
        return label
    }()
    
    let ratingStars: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ratingCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Theme.lightTextColor
        label.sizeToFit()
        return label
    }()
    
    let ageRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Theme.headerFont
        label.textColor = Theme.lightTextColor
        label.sizeToFit()
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Age"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Theme.lightTextColor
        label.sizeToFit()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for subview in [developerLabel, ratingLabel, ratingStars, ratingCountLabel, ageRatingLabel, ageLabel] {
            self.addSubview(subview)
        }
        
        setupViews()
    }
    
    func setupViews() {
        imageView.layer.cornerRadius = 30
        
        nameLabel.font = Theme.headerFont
        
        rankingLabel.font = Theme.headerFont
        rankingLabel.textColor = Theme.lightTextColor
        
        priceButton.backgroundColor = Theme.accentColor
        priceButton.setTitleColor(Theme.buttonTextColor, for: .normal)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            developerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            developerLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            developerLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            priceButton.topAnchor.constraint(equalTo: developerLabel.bottomAnchor, constant: 8),
            priceButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceButton.widthAnchor.constraint(equalToConstant: 65),
            priceButton.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            ratingLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            ratingStars.topAnchor.constraint(equalTo: ratingLabel.topAnchor),
            ratingStars.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 2),
            ratingStars.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            ratingCountLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor),
            ratingCountLabel.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ageRatingLabel.topAnchor.constraint(equalTo: ratingLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: ageRatingLabel.bottomAnchor)
        ])
        
        #warning("Uncomment line below and remove the if true")
//        if rankingLabel.text != nil {
        if true {
            NSLayoutConstraint.activate([
                rankingLabel.topAnchor.constraint(equalTo: ratingLabel.topAnchor),
                rankingLabel.leadingAnchor.constraint(equalTo: ratingStars.trailingAnchor, constant: 70),
            ])
            
            NSLayoutConstraint.activate([
                categoryLabel.topAnchor.constraint(equalTo: ratingCountLabel.topAnchor),
                categoryLabel.centerXAnchor.constraint(equalTo: rankingLabel.centerXAnchor)
            ])
            
            
            ageRatingLabel.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 70).isActive = true
            ageLabel.trailingAnchor.constraint(equalTo: ageRatingLabel.trailingAnchor).isActive = true
        }
        else {
            categoryLabel.removeFromSuperview()
            
            ageRatingLabel.leadingAnchor.constraint(equalTo: ratingStars.trailingAnchor, constant: 16).isActive = true
            ageLabel.leadingAnchor.constraint(equalTo: ratingStars.trailingAnchor, constant: 16).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension Int {
    var kmFormatted: String {
        
        let num = abs(self)
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            return "\(sign)\(formatted)B"
            
        case 1_000_000...:
            let formatted = num / 1_000_000
            return "\(sign)\(formatted)M"
            
        case 1_000...:
            let formatted = num / 1_000
            return "\(sign)\(formatted)K"
            
        case 0...:
            return "\(self)"
            
        default:
            return "\(sign)\(self)"
        }
    }
}
