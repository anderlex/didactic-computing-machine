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
        let locationsVC = assembly.locationsVC()
        locationsVC.selectLocation = { [weak locationsVC] locationsData in
            let coordinator = self.assembly.charactersCoordinator(data: locationsData)
            guard let characterVC = coordinator.make() else {
                return
            }
            locationsVC?.navigationController?.pushViewController(characterVC, animated: true)
        }
        return locationsVC
    }
}
