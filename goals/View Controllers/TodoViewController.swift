//
//  ViewController.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-01-14.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    private var todos: [Todo] = [Todo("Clean"), Todo("cook"), Todo("take out the garbage"), Todo("save the world"), Todo("make bed")]
    private let margin: CGFloat = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        StyleUtil.setupDefaultStyle(self)

        // Todo ( pun indended :) ) - remove and implement functionality
        headerView.doneButton.isHidden = true
        headerView.todoButton.isUserInteractionEnabled = false
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.setStyle()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= -margin && headerView.alpha == 1 {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.headerView.alpha = 0
            }
        } else if scrollView.contentOffset.y < -margin && headerView.alpha < 1 {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.headerView.alpha = 1
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTodoSegue", let addVC = segue.destination as? AddTodoViewController {
            addVC.delegate = self
        }
    }
}

extension TodoViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK - Table view methods

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsetsMake(margin, 0, 0, 0)

        let nib = UINib(nibName: "ToDoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ToDoCell.identifier)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete") { [weak self] action, path in
            self?.removeCellAt(path)
        }

        delete.backgroundColor = UIColor.clear

        return [delete]
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.identifier, for: indexPath) as? ToDoCell else {
            return UITableViewCell()
        }
        cell.todoImage?.image = UIImage(named: "checkEmpty")
        cell.todoText?.text = todos[indexPath.row].name
        cell.done = todos[indexPath.row].done
        cell.backgroundColor = .clear
        cell.selectedBackgroundView = UIView()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ToDoCell else {
            return
        }

        let todo = todos[indexPath.row]
        todo.done = !todo.done
        cell.done = !cell.done

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func removeCellAt(_ indexPath: IndexPath) {
        todos.remove(at: indexPath.row)
        tableView.reloadSections(IndexSet(integer: 0), with: .left)
    }
}

extension TodoViewController: AddTodoViewControllerDelegate {
    func addedNewTodo(_ todo: String) {
        todos.append(Todo(todo))
        tableView.reloadSections(IndexSet(integer: 0), with: .left)
    }
}
