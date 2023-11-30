//
//  CharactersCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class CharactersCoordinator: BaseCoordinator<CharactersCoordinator.Context> {
    struct Context {
        let data: LocationsCellData
    }

    override func make() -> UIViewController? {
        assembly.charactersVC(data: context.data)
    }
}
