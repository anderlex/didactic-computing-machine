//
//  ProfileAssembly.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import Foundation

protocol ProfileAssembly {
    func profileVC(onLogOut: (() -> Void)?) -> ProfileViewController<ProfileViewImp>
    func profileDataProvider() -> ProfileDataProvider
    func profileCoordinator(onLogOut: (() -> Void)?) -> ProfileCoordinator
}

extension Assembly: ProfileAssembly {
    func profileVC(onLogOut: (() -> Void)?) -> ProfileViewController<ProfileViewImp> {
        .init(dataProvider: profileDataProvider(), storageManager: storageManager, onLogOut: onLogOut)
    }

    func profileDataProvider() -> ProfileDataProvider {
        ProfileDataProviderImp()
    }

    func profileCoordinator(onLogOut: (() -> Void)?) -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init(onLogOut: onLogOut))
    }
}
