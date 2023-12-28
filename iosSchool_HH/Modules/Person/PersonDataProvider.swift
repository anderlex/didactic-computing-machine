//
//  PersonDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import Foundation

protocol PersonDataProvider {
    func getEpisode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void)
}

final class PersonDataProviderImp: PersonDataProvider {
    private let apiClient: PersonApiClient

    init(apiClient: PersonApiClient) {
        self.apiClient = apiClient
    }

    func getEpisode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void) {
        apiClient.getEpisode(url: url, onRequestCompleted: onRequestCompleted)
    }
}
