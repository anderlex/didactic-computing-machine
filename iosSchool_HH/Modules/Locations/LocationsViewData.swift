//
//  LocationsViewData.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import Foundation

struct LocationsViewData {
    let cellsData: [LocationsCellData]

    init(list: LocationsList) {
        cellsData = list.results.map { LocationsCellData(location: $0) }
    }
}
