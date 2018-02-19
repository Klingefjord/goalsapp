//
//  ColorExtensions.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-01-28.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 255) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a/255)
    }

    static let focusGray = UIColor(r: 224, g: 224, b: 224)

    static let backgroundGray = UIColor(r: 124, g: 124, b: 124)
}

