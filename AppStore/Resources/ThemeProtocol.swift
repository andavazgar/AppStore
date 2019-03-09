//
//  ThemeProtocol.swift
//  AppStore
//
//  Created by Andres Vazquez on 2019-03-08.
//  Copyright © 2019 Andavazgar. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    static var backgroundColor: UIColor { get }
    static var lightTextColor: UIColor { get }
    static var defaultTextColor: UIColor { get }
    static var accentColor: UIColor { get }
    static var buttonBackgroundColor: UIColor { get }
    static var buttonTextColor: UIColor { get }
    static var headerFont: UIFont { get }
}
