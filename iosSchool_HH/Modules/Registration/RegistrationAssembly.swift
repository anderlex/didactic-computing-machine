//
//  RegistrationAssembly.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC() -> RegistrationViewController<RegistrationViewImp>
    func registrationDataProvider() -> RegistrationDataProvider
    func registrationCoordinator() -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {
    func registrationVC() -> RegistrationViewController<RegistrationViewImp> {
        .init(dataProvider: registrationDataProvider())
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp()
    }

    func registrationCoordinator() -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init())
    }
}
