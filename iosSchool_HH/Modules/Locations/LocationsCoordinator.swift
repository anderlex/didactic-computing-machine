//
//  LocationsCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 18.11.2023.
//

import UIKit

class LocationsCoordinator: BaseCoordinator<LocationsCoordinator.Context> {
    struct Context {}

    override func make() -> UIViewController? {
        assembly.locationsVC()
    }
}
