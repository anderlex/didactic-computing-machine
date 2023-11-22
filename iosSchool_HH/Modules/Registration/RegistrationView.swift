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

    func setShadows(view: UIView) {
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    func setBorders(view: UIView) {
        view.clipsToBounds = true
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }

    func setView() {
        imageView.contentMode = .scaleAspectFill

        setBorders(view: loginTextField)
        setShadows(view: loginTextField)
        setBorders(view: passwordTextField)
        setShadows(view: passwordTextField)
        setBorders(view: passwordAgainTextField)
        setShadows(view: passwordAgainTextField)

        setShadows(view: doneButton)
        doneButton.clipsToBounds = true
        doneButton.layer.cornerRadius = 10
        setShadows(view: backButton)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 10
    }
}
