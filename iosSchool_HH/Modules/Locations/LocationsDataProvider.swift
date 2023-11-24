//
//  LocationsDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 18.11.2023.
//

import Foundation

protocol LocationsDataProvider {
    func getLocationsList(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

class LocationsDataProviderImp: LocationsDataProvider {
    private let apiClient: LocationsApiClient

    init(apiClient: LocationsApiClient) {
        self.apiClient = apiClient
    }

    func getLocationsList(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        apiClient.getLocationsList(onRequestCompleted: onRequestCompleted)
    }
}
