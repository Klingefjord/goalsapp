//
//  AddTodoViewController.swift
//  goals
//
//  Created by Oliver klingefjord on 2018-02-06.
//  Copyright © 2018 Oliver klingefjord. All rights reserved.
//

import UIKit

protocol AddTodoViewControllerDelegate {
    func addedNewTodo(_ todo: String)
}

class AddTodoViewController: UIViewController {

    @IBOutlet weak var rightTrailing: NSLayoutConstraint!
    @IBOutlet weak var leftLeading: NSLayoutConstraint!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var backgroundView: UIView!

    weak var delegate: TodoViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        inputField.becomeFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
        inputField.keyboardAppearance = .dark
        UITextField.appearance().tintColor = UIColor.focusGray
        leftLeading.constant = UIScreen.main.bounds.width / 2
        rightTrailing.constant = UIScreen.main.bounds.width / 2
        view.setNeedsLayout()

        UIView.animate(withDuration: 1) { [weak self] in
            guard let this = self else { return }

            this.leftLeading.constant = 71
            this.rightTrailing.constant = 71
            this.view.setNeedsLayout()
        }

        view.sendSubview(toBack: backgroundView)
        viewDidLayoutSubviews()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != inputField.inputView {
            animateAway()
        }
    }

    func animateAway() {
        self.view.alpha = 1

        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.view.alpha = 0
        }) { (success) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension AddTodoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if let text = textField.text, text != "" {
            delegate?.addedNewTodo(text)
        }

        animateAway()
        return true
    }
}
