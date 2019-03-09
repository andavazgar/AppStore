//
//  Extensions+UIImageView.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-08.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageFromURL(url: URL) {
        if let imageData = try? Data(contentsOf: url) {
            self.image = UIImage(data: imageData)
        }
    }
}
