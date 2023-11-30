//
//  RegistrationView.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    var delegate: RegistrationViewDelegate? { get set }

    func setView()
}

protocol RegistrationViewDelegate: AnyObject {
    func doneButtonDidTap()
    func backButtonDidTap()
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var iconView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var passwordAgainTextField: UITextField!
    @IBOutlet private var doneButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    weak var delegate: RegistrationViewDelegate?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setView() {

        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        addGestureRecognizer(recognizer)

        imageView.contentMode = .scaleAspectFill

        setShadowsTextField(textField: loginTextField)
        setBorders(view: loginTextField)
        setLeftAlignment(textField: loginTextField)

        setShadowsTextField(textField: passwordTextField)
        setBorders(view: passwordTextField)
        setLeftAlignment(textField: passwordTextField)

        setShadowsTextField(textField: passwordAgainTextField)
        setBorders(view: passwordAgainTextField)
        setLeftAlignment(textField: passwordAgainTextField)

        setShadowsButton(button: doneButton)
        doneButton.layer.cornerRadius = 10
        setShadowsButton(button: backButton)
        backButton.layer.cornerRadius = 10

        doneButton.addTarget(self, action: #selector(doneButtonDidTap), for: .touchUpInside)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
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
        button.backgroundColor = UIColor(named: "button-color")
    }

    private func setBorders(view: UIView) {
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }

    @IBAction
    private func doneButtonDidTap() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        passwordAgainTextField.resignFirstResponder()
    }

    @objc
    private func backButtonDidTap() {}

    @objc
    private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc
    private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc
    private func viewDidTap() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        passwordAgainTextField.resignFirstResponder()
    }
}
