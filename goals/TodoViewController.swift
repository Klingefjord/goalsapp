//
//  ViewController.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-01-14.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var todos = ["clean", "cook", "take out the garbage", "save the world", "make bed"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        let nib = UINib(nibName: "ToDoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ToDoCell.identifier)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.identifier, for: indexPath) as? ToDoCell else {
            return UITableViewCell()
        }
        cell.todoImage?.image = UIImage(named: "checkEmpty")
        cell.todoText?.text = todos[indexPath.row]
        cell.todoText?.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let emptyImage = UIImage(named: "checkEmpty")
        let filledImage = UIImage(named: "checkChecked")
        tableView.cellForRow(at: indexPath)?.imageView?.image = tableView.cellForRow(at: indexPath)?.imageView?.image == emptyImage ? filledImage : emptyImage
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {

        // Dispose of any resources that can be recreated.
    }

    // MARK - add new item

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { [weak self] action in
            if let text = textField.text {
                self?.todos.append(text)
            }
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }



}

