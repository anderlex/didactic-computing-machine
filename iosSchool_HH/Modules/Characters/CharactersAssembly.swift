//
//  CharactersAssembly.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol CharactersAssembly {
    func charactersVC() -> CharactersViewController
    func charactersDataProvider() -> CharactersDataProvider
    func charactersCoordinator() -> CharactersCoordinator
}

extension Assembly: CharactersAssembly {

    func charactersVC() -> CharactersViewController {
        .init(dataProvider: charactersDataProvider())
    }

    func charactersDataProvider() -> CharactersDataProvider {
        CharactersDataProviderImp(apiClient: apiClient)
    }

    func charactersCoordinator() -> CharactersCoordinator {
        CharactersCoordinator(assembly: self, context: .init())
    }
}
