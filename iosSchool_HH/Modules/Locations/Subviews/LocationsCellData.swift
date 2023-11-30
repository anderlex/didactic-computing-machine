//
//  LocationsCellData.swift
//  iosSchool_HH
//
//  Created by student on 27.11.2023.
//

import Foundation

struct LocationsCellData {
    let name: String
    let type: String
    let population: Int
    let residents: [String]

    init(location: Location) {
        name = location.name
        type = location.type
        population = location.residents.count
        residents = location.residents
    }
}
