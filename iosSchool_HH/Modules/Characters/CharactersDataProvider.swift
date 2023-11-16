//
//  CharactersDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol CharactersDataProvider {
    func getCharacter(
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    )
}

class CharactersDataProviderImp: CharactersDataProvider {
    private let apiClient: CharactersApiClient

    init(apiClient: CharactersApiClient) {
        self.apiClient = apiClient
    }

    func getCharacter(
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    ) {
        apiClient.getCharacter(onRequestCompleted: onRequestCompleted)
    }
}
