//
//  NavigationControllerExtensions.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-01-25.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func setStyle() {
        self.shadowImage = UIImage()
        self.tintColor = UIColor.focusGray
        self.setBackgroundImage(UIImage(), for: .default)
        self.isTranslucent = true
    }
}
