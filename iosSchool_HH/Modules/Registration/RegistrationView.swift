//
//  RegistrationView.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit

protocol RegistrationView: UIView {

    func setView()
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var passwordAgainTextField: UITextField!
    @IBOutlet private var doneButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    func setView() {
        imageView.contentMode = .scaleAspectFill

        setBorders(view: loginTextField)
        setShadowsTextField(textField: loginTextField)
        setLeftAlignment(textField: loginTextField)

        setBorders(view: passwordTextField)
        setShadowsTextField(textField: passwordTextField)
        setLeftAlignment(textField: passwordTextField)

        setBorders(view: passwordAgainTextField)
        setShadowsTextField(textField: passwordAgainTextField)
        setLeftAlignment(textField: passwordAgainTextField)

        setShadowsButton(button: doneButton)
        doneButton.clipsToBounds = true
        doneButton.layer.cornerRadius = 10
        setShadowsButton(button: backButton)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 10
    }

// MARK: - Private methods

    private func setShadowsTextField(textField: UITextField) {
        textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 5)
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor(.white).cgColor
    }

    private func setLeftAlignment(textField: UITextField) {
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 20))
        textField.leftViewMode = .always
    }

    private func setShadowsButton(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    private func setBorders(view: UIView) {
        view.clipsToBounds = true
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }
}
