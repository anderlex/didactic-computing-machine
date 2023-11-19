//
//  LocationsApiClient.swift
//  iosSchool_HH
//
//  Created by student on 18.11.2023.
//

import Foundation

protocol LocationsApiClient {
    func getLocationsList(
        onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void
    )
}

extension ApiClient: LocationsApiClient {
    func getLocationsList(
        onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.locationURL + "/1"
        performRequest(url: url, data: nil, method: .get) { (result: Result<LocationsList, ApiError>) in
            switch result {
            case.success(let locationsList):
                onRequestCompleted(locationsList, nil)
            case.failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
