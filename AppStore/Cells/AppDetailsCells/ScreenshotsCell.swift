//
//  ScreenshotsCell.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-08.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

class ScreenshotsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "screenshotCell"
    var app: App? {
        didSet {
            screenshots = app!.screenshotUrls
        }
    }
    var screenshots = [URL]()
    
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
        label.text = "Preview"
        return label
    }()
    
    let sreenshotsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.orange
        
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        sreenshotsCollectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellID)
        
        for subview in [sepatatorLineView, sectionTitleLabel, sreenshotsCollectionView] {
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
        
        sreenshotsCollectionView.anchor(to: [
            .top_C(sectionTitleLabel.bottomAnchor, constant: 8),
            .leading(self.leadingAnchor),
            .trailing(self.trailingAnchor),
            .bottom_C(self.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Configuration of Screenshots CollectionView
    /**************************************************/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ScreenshotCell
        
        let screenshotURL = screenshots[indexPath.row]
        cell.screenshotImageView.setImageFromURL(url: screenshotURL)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: self.frame.height)
    }
}

private class ScreenshotCell: UICollectionViewCell {
    let screenshotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
        
        self.addSubview(screenshotImageView)
        
        screenshotImageView.anchorToSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
