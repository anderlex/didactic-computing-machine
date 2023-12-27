//
//  ProfileViewController.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

class ProfileViewController<View: ProfileView>: BaseViewController<View> {

    private var onLogOut: (() -> Void)?
    private let dataProvider: ProfileDataProvider
    private let storageManager: StorageManager

    init(dataProvider: ProfileDataProvider, storageManager: StorageManager, onLogOut: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager
        self.onLogOut = onLogOut
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        rootView.backgroundColor = UIColor(named: "auth-background-color")
        rootView.update(
            data: .init(
                backgroundImage: UIImage(named: "profile-background"),
                profileImage: UIImage(named: "registration-icon"),
                login: self.storageManager.getLogin(),
                lastLogin: self.storageManager.getLastLoginTime(),
                color: UIColor(named: "iceberg"),
                selectClosure: {[weak self] _ in
                    self?.storageManager.removeToken()
                    self?.onLogOut?()
                }
            )
        )
    }
}
