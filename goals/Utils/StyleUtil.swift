
//
//  StyleUtil.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-01-29.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

struct StyleUtil {
    static func setupDefaultStyle(_ sender: UIViewController) {
        let overlay = CAGradientLayer()
        overlay.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        ]
        
        overlay.frame = sender.view.frame

        sender.view.layer.addSublayer(overlay)
    }
}
