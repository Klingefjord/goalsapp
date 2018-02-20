//
//  HeaderView.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-01-27.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

struct fonts {
    public static let inFocusHeader = UIFont.boldSystemFont(ofSize: 24)
    public static let backgroundHeader = UIFont.boldSystemFont(ofSize: 20)
}

class HeaderView: UIView {

    @IBOutlet weak var todoButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case todoButton:
            selectedTab = .Todo
            break
        case doneButton:
            selectedTab = .Done
            break
        default:
            break
        }
    }

    enum Tabs {
        case Todo
        case Done
    }

    public var selectedTab = Tabs.Todo {
        didSet {
            animateTransition()
        }
    }

    private func animateTransition() {
        let from = selectedTab == .Todo ? doneButton : todoButton
        let to = selectedTab == .Todo ? todoButton : doneButton

        from?.titleLabel?.font = fonts.backgroundHeader
        from?.titleLabel?.textColor = UIColor.backgroundGray

        to?.titleLabel?.font = fonts.inFocusHeader
        to?.titleLabel?.textColor = UIColor.focusGray
    }

}
