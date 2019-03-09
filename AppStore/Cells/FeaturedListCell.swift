//
//  FeaturedAppsCategoryCell.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-05.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

class FeaturedListCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "appCell"
    var featuredList: FeaturedList? {
        didSet {
            collectionNameLabel.text = featuredList?.listName
        }
    }
    
    let sepatatorLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.lightTextColor
        
        return view
    }()
    
    let collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Theme.headerFont
        return label
    }()
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Adds the subviews to the view
        for subview in [sepatatorLineView, collectionNameLabel, appsCollectionView] {
            addSubview(subview)
        }
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellID)
        
        setupViews()
    }
    
    func setupViews() {
        sepatatorLineView.anchor(to: [
            .top(self.topAnchor),
            .leading_C(self.leadingAnchor, constant: 20),
            .trailing_C(self.trailingAnchor, constant: -20),
            .heightConst(0.5)
        ])
        
        collectionNameLabel.anchor(to: [
            .top_C(sepatatorLineView.bottomAnchor, constant: 8),
            .leading_C(self.leadingAnchor, constant: 20)
        ])
        
        appsCollectionView.anchor(to: [
            .top_C(collectionNameLabel.bottomAnchor, constant: 4),
            .leading(self.leadingAnchor),
            .trailing(self.trailingAnchor),
            .bottom(self.bottomAnchor)
        ])
    }
    
    
    // MARK: - Configuration of the CollectionView inside the cell
    /**************************************************/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = featuredList?.apps.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppCell
        cell.app = featuredList?.apps[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: self.frame.height/3 - 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let app = featuredList?.apps[indexPath.row] else { return }
        
        NotificationCenter.default.post(name: NSNotification.Name("AppInCollectionWasTapped"), object: nil, userInfo: ["app": app])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
