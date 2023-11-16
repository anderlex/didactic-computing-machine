//
//  RegistrationViewController.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    private let dataProvider: RegistrationDataProvider

    init(dataProvider: RegistrationDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        userRegistration()
    }

    func userRegistration() {
        dataProvider.registration(username: "anderlex", password: "12345678") { token, error in
            print(token ?? "Hет токена")
            print(error?.rawValue ?? "Нет ошибки")
        }
    }
}
