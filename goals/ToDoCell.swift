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
    
    @IBOutlet weak var todoImage: UIImageView!
    @IBOutlet weak var todoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
