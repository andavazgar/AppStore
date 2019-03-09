//
//  VersionDetailsCell.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-07.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

class VersionDetailsCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            versionLabel.text = "Version \(app?.version ?? "")"
            
            if let versionDate = app?.versionDate {
                getRelativeInterval(for: versionDate)
            }
            
//            versionDescription.text = app?.versionReleaseNotes
            versionDescription.text = "Apple talks about augmented reality at any opportunity it gets, but so far its fierce ambition has only materialized to consumers as ARKit apps on the iPhone and iPad. It has been widely reported that Apple is developing an AR glasses / headset product."
        }
    }
    
    let sepatatorLineView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.lightTextColor
        
        return view
    }()
    
    let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Theme.headerFont
        label.text = "What's New"
        return label
    }()
    
    let versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = Theme.lightTextColor
//        label.backgroundColor = .green
        return label
    }()
    
    let versionDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = Theme.lightTextColor
//        label.backgroundColor = .green
        return label
    }()
    
    let versionDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 3
//        label.backgroundColor = .cyan
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for subview in [sepatatorLineView, sectionTitleLabel, versionLabel, versionDateLabel, versionDescription] {
            self.addSubview(subview)
        }
        
        setupViews()
    }
    
    func setupViews() {
        sepatatorLineView.anchor(to: [
            .top(self.topAnchor),
            .leading(self.leadingAnchor),
            .trailing(self.trailingAnchor),
            .heightConst(0.5)
        ])
        
        sectionTitleLabel.anchor(to: [
            .top_C(sepatatorLineView.topAnchor, constant: 12),
            .leading(self.leadingAnchor),
        ])
        
        versionLabel.anchor(to: [
            .top_C(sectionTitleLabel.bottomAnchor, constant: 12),
            .leading(self.leadingAnchor),
        ])
        
        versionDateLabel.anchor(to: [
            .top(versionLabel.topAnchor),
            .trailing(self.trailingAnchor)
        ])
        
        versionDescription.anchor(to: [
            .top_C(versionLabel.bottomAnchor, constant: 12),
            .leading(self.leadingAnchor),
            .trailing(self.trailingAnchor)
        ])
    }
    
    private func getRelativeInterval(for versionDate: Date) {
        let dateComponentsToGet: [Calendar.Component] = [.year, .month, .day, .hour, .minute, .second]
        let dateComponents = Calendar.current.dateComponents(Set(dateComponentsToGet), from: versionDate, to: Date())
        
        for dateComponent in dateComponentsToGet {
            let dateValue = dateComponents.value(for: dateComponent)
            if dateValue != nil && dateValue! > 0 {
                let plural = dateValue! > 1 ? "s" : ""
                versionDateLabel.text = "\(dateValue!) \(dateComponent)\(plural) ago"
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
