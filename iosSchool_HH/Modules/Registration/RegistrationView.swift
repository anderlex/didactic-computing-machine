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

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var passwordAgainTextField: UITextField!
    @IBOutlet private var doneButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    func setView() {
        <#code#>
    }
}
