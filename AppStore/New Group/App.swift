//
//  App.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-05.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

struct App: Codable {
    let name: String
    let imageURL: URL
    let developer: String
    let seller: String
    let category: String
    let screenshotUrls: [URL]
    let ipadScreenshotUrls: [URL]
    let price: Int
    let formattedPrice: String
    let version: String
    let versionDate: Date
    let versionReleaseNotes: String?
    let description: String
    let rating: Double?
    let ratingCount: Int?
    let ageRating: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case imageURL = "artworkUrl100"
        case developer = "artistName"
        case seller = "sellerName"
        case category = "primaryGenreName"
        case screenshotUrls
        case ipadScreenshotUrls
        case price
        case formattedPrice
        case version
        case versionDate = "currentVersionReleaseDate"
        case versionReleaseNotes = "releaseNotes"
        case description
        case rating = "averageUserRating"
        case ratingCount = "userRatingCount"
        case ageRating = "contentAdvisoryRating"
    }
}
