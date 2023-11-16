//
//  UserData.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

struct UserData: Codable {
    var username: String
    var password: String

    enum CodingKeys: String, CodingKey {
        case username
        case password
    }
}
