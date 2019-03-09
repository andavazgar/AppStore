//
//  SearchResult.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-05.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

struct SearchResult: Codable {
    let resultCount: Int
    let results: [App]
}
