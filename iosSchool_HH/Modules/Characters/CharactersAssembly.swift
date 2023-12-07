//
//  CharactersAssembly.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol CharactersAssembly {
    func charactersVC(data: LocationsCellData) -> CharactersViewController<CharactersViewImp>
    func charactersDataProvider() -> CharactersDataProvider
    func charactersCoordinator(data: LocationsCellData) -> CharactersCoordinator
}

extension Assembly: CharactersAssembly {

    func charactersVC(data: LocationsCellData) -> CharactersViewController<CharactersViewImp> {
        .init(dataProvider: charactersDataProvider(), data: data, imageService: imageService)
    }

    func charactersDataProvider() -> CharactersDataProvider {
        CharactersDataProviderImp(apiClient: apiClient)
    }

    func charactersCoordinator(data: LocationsCellData) -> CharactersCoordinator {
        CharactersCoordinator(assembly: self, context: .init(data: data))
    }
}
