//
//  LocationsList.swift
//  iosSchool_HH
//
//  Created by student on 13.11.2023.
//

import Foundation

struct LocationsList: Decodable {

    struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [Location]

    func description() {
        print("info: \(info)")
    }
}
