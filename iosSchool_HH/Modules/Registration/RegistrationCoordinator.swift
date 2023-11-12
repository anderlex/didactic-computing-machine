//
//  RegistrationCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        assembly.registrationVC()
    }
}
