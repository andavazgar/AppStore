//
//  FeaturedLists.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-05.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

struct FeaturedList: Codable {
    let listName: String
    let apps: [App]
    
    init(listName: String, apps: [App]) {
        self.listName = listName
        self.apps = apps
    }
}
