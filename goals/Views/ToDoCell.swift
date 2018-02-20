//
//  ToDoCell.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-01-15.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    static let identifier = "ToDoCell"

   // @IBOutlet weak var crossOverLength: NSLayoutConstraint!
    @IBOutlet weak var todoImage: UIImageView!
    @IBOutlet weak var todoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    var done = false {
        didSet {
            updateSelection()
        }
    }

    private func updateSelection() {
        let emptyImage = UIImage(named: "checkEmpty")
        let filledImage = UIImage(named: "checkChecked")

        UIView.transition(with: todoImage, duration: 0.1, options: .transitionCrossDissolve, animations: { [weak self] in
            guard let this = self else { return }
            this.todoText.textColor = this.done ? UIColor.backgroundGray : UIColor.focusGray
            this.todoImage?.image = this.done ? filledImage : emptyImage
        }, completion: nil)
    }

}
