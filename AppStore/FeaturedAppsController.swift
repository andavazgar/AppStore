//
//  ViewController.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-05.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "FeaturedCategoryCell"
    private let featuredCategories = [
        "topFree": [
            "name": "Top Free Apps",
            "url": URL(string: "https://rss.itunes.apple.com/api/v1/ca/ios-apps/top-free/all/100/explicit.json")!
        ],
        "topPaid": [
            "name": "Top Paid Apps",
            "url": URL(string: "https://rss.itunes.apple.com/api/v1/ca/ios-apps/top-paid/all/100/explicit.json")!
        ],
        "appsWeLove": [
            "name": "New Apps We Love",
            "url": URL(string: "https://rss.itunes.apple.com/api/v1/ca/ios-apps/new-apps-we-love/all/100/explicit.json")!
        ],
        "gamesWeLove": [
            "name": "New Games We Love",
            "url": URL(string: "https://rss.itunes.apple.com/api/v1/ca/ios-apps/new-games-we-love/all/100/explicit.json")!
        ]
    ]
    var featuredLists = [FeaturedList]()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Apps"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Removes the line under the navigationBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        view.backgroundColor = Theme.backgroundColor
        collectionView.backgroundColor = Theme.backgroundColor
        collectionView.register(FeaturedListCell.self, forCellWithReuseIdentifier: cellID)
        
        #warning("Change method to fetchData")
        fetchDataFROMFILE() { [weak self] searchResult in
            let list = FeaturedList(listName: "Testing", apps: Array(searchResult.results.prefix(12)))
            self?.featuredLists.append(list)
            self?.collectionView.reloadData()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(showAppDetails), name: NSNotification.Name(rawValue: "AppInCollectionWasTapped"), object: nil)
    }
    
    @objc func showAppDetails(notification: Notification) {
        guard let app = notification.userInfo?["app"] as? App else { return }
        
        let appDetailsVC = AppDetailsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        appDetailsVC.app = app
        
        navigationController?.pushViewController(appDetailsVC, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredLists.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeaturedListCell
        cell.featuredList = featuredLists[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 260)
    }
    
    private func fetchData(completionHandler: @escaping (_ searchResult: SearchResult) -> Void) {
        let url = URL(string: "http://itunes.apple.com/search?entity=software&term=nordvpn")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let searchResult = try? decoder.decode(SearchResult.self, from: data)
            
            if let searchResult = searchResult {
                DispatchQueue.main.async {
                    completionHandler(searchResult)
                }
            }
        }.resume()
    }
    
    private func fetchDataFROMFILE(completionHandler: @escaping (_ searchResult: SearchResult) -> Void) {
        guard let fileURL = Bundle.main.url(forResource: "JSON", withExtension: "txt") else { return }
        guard let data = try? Data(contentsOf: fileURL) else { return }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let searchResult = try? decoder.decode(SearchResult.self, from: data)
        
        if let searchResult = searchResult {
            DispatchQueue.main.async {
                completionHandler(searchResult)
            }
        }
    }
    
}

