//
//  RegistrationApiClient.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration(
        userdata: UserData,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        userdata: UserData,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.nanoPost + "/auth/register?username=\(userdata.username)&password=\(userdata.password)"
        let data = try? JSONEncoder().encode(userdata)
        performRequest(url: url, data: data, method: .post) { (result: Result<TokenResponse, ApiError>) in
            switch result {
            case .success(let token):
                onRequestCompleted(token, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
