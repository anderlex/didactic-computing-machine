//
//  RegistrationApiClient.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.nanoPost + "/auth/register?username=\(username)&password=\(password)"
        let userData = UserData(username: username, password: password)
        let data = try? JSONEncoder().encode(userData)
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
