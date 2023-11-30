//
//  CharactersDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol CharactersDataProvider {
    func getCharacter(id: Int, onRequestCompleted: @escaping (Character?, ApiError?) -> Void)
    func getCharacter(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void)
}

class CharactersDataProviderImp: CharactersDataProvider {
    private let apiClient: CharactersApiClient

    init(apiClient: CharactersApiClient) {
        self.apiClient = apiClient
    }

    func getCharacter(id: Int, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        apiClient.getCharacter(id: id, onRequestCompleted: onRequestCompleted)
    }

    func getCharacter(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        apiClient.getCharacter(url: url, onRequestCompleted: onRequestCompleted)
    }
}
