//
//  RegistrationViewController.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit
import SPIndicator
import PKHUD

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let dataProvider: RegistrationDataProvider
    private let storageManager: StorageManager
    var onRegistrationSuccess: (() -> Void)?

    init(dataProvider: RegistrationDataProvider, storageManager: StorageManager, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager
        self.onRegistrationSuccess = onRegistrationSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        rootView.delegate = self
    }
}

// MARK: - RegistrationViewDelegate

extension RegistrationViewController: RegistrationViewDelegate {
    func doneButtonDidTap(login: String, password: String, passwordAgain: String) {
        guard password == passwordAgain else {
            DispatchQueue.main.async {
                SPIndicator.present(title: "Неправильно повторили пароль", haptic: .error)
            }
            return
        }
        HUD.show(.progress)
        let userdata = UserData(username: login, password: password)
        dataProvider.registration(userdata: userdata) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let self, let token else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                }
                return
            }
            self.storageManager.saveToken(token: token)
            self.storageManager.saveLogin(login: login)
            self.onRegistrationSuccess?()
        }
    }

    func backButtonDidTap() {
        dismiss(animated: true)
    }
}
