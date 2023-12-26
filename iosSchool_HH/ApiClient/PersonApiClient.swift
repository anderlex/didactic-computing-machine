//
//  PersonApiClient.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import Foundation

protocol PersonApiClient {
    func getEpisode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void)
}

extension ApiClient: PersonApiClient {
    func getEpisode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void) {
        performRequest(url: url, data: nil, method: .get) { (result: Result<Episode, ApiError>) in
            switch result {
            case.success(let episode):
                onRequestCompleted(episode, nil)
            case.failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
