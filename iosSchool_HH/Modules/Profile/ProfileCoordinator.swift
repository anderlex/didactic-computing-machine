//
//  ProfileCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

class ProfileCoordinator: BaseCoordinator<ProfileCoordinator.Context> {

    struct Context {
        let onLogOut: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.profileVC(onLogOut: context.onLogOut)
    }
}
