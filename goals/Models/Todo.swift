//
//  Todo.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-02-20.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import Foundation

class Todo {
    var name: String
    var done: Bool

    init(_ name: String, done: Bool = false) {
        self.name = name
        self.done = done
    }
}
