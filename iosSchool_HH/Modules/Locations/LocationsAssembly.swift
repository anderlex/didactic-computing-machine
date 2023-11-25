//
//  LocationsAssembly.swift
//  iosSchool_HH
//
//  Created by student on 18.11.2023.
//

import Foundation

protocol LocationsAssembly {
    func locationsVC() -> LocationsViewController
    func locationsDataProvider() -> LocationsDataProvider
    func locationsCoordinator() -> LocationsCoordinator
}

extension Assembly: LocationsAssembly {

    func locationsVC() -> LocationsViewController {
        .init(dataProvider: locationsDataProvider())
    }

    func locationsDataProvider() -> LocationsDataProvider {
        LocationsDataProviderImp(apiClient: apiClient)
    }

    func locationsCoordinator() -> LocationsCoordinator {
        LocationsCoordinator(assembly: self, context: .init())
    }
}
