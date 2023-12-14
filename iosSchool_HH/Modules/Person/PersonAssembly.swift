//
//  PersonAssembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import Foundation

protocol PersonAssembly {
    func personVC(data: CoreCellInputData) -> PersonViewController<PersonViewImp>
    func personDataProvider() -> PersonDataProvider
    func personCoordinator(data: CoreCellInputData) -> PersonCoordinator
}

extension Assembly: PersonAssembly {
    func personVC(data: CoreCellInputData) -> PersonViewController<PersonViewImp> {
        .init(dataProvider: personDataProvider(), data: data, imageService: imageService)
    }

    func personDataProvider() -> PersonDataProvider {
        PersonDataProviderImp(apiClient: apiClient)
    }

    func personCoordinator(data: CoreCellInputData) -> PersonCoordinator {
        PersonCoordinator(assembly: self, context: .init(data: data))
    }
}
