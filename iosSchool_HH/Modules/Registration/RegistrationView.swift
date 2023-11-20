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
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        doneButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        doneButton.layer.shadowOpacity = 1
        doneButton.layer.shadowRadius = 8
        doneButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        backButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        backButton.layer.shadowOpacity = 1
        backButton.layer.shadowRadius = 8
        backButton.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
