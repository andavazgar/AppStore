//
//  AppDetailsViewController.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-06.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

private enum AppDetailsSection: Int, CaseIterable {
    case mainDetails, versionDetails, screenshots
    
    private var sectionDetails: (cellClass: AnyClass, cellID: String) {
        switch self {
        case .mainDetails:
            return (cellClass: AppMainDetailsCell.self, cellID: "AppMainDetailsCell")
        case .versionDetails:
            return (cellClass: VersionDetailsCell.self, cellID: "VersionDetailsCell")
        case .screenshots:
            return (cellClass: ScreenshotsCell.self, cellID: "ScreenshotsCell")
        }
    }
    
    var cellClass: AnyClass {
        return sectionDetails.cellClass
    }
    
    var cellID: String {
        return sectionDetails.cellID
    }
    
    static var numberOfSections: Int {
        return self.allCases.count
    }
}

class AppDetailsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var app: App?
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 1
        }
        
        // Register cells
        for appSection in AppDetailsSection.allCases {
            collectionView.register(appSection.cellClass, forCellWithReuseIdentifier: appSection.cellID)
        }
        
        collectionView.backgroundColor = Theme.backgroundColor
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AppDetailsSection.numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case AppDetailsSection.mainDetails.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsSection.mainDetails.cellID, for: indexPath) as! AppMainDetailsCell
            cell.app = app
            return cell
            
        case AppDetailsSection.versionDetails.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsSection.versionDetails.cellID, for: indexPath) as! VersionDetailsCell
            cell.app = app
            return cell
            
        case AppDetailsSection.screenshots.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsSection.screenshots.cellID, for: indexPath) as! ScreenshotsCell
            cell.app = app
            cell.backgroundColor = UIColor.gray
            return cell
        default:
            fatalError("Index Path out of range. Don't know what type of cell to use.")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // -32 for Inset of 16 for both sides
        let cellWidth = view.frame.width - 40
        
        switch indexPath.section {
        case AppDetailsSection.mainDetails.rawValue:
            return CGSize(width: cellWidth, height: 210)
        case AppDetailsSection.versionDetails.rawValue:
            return CGSize(width: cellWidth, height: 160)
//        case AppDetailsSection.screenshots.rawValue:
//            return CGSize
        default:
            return CGSize(width: cellWidth, height: 150)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
