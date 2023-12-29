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
        let controller = assembly.charactersVC(data: context.data)
        controller.selectCharacter = { [weak controller] charactersVM in
            let coordinator = self.assembly.personCoordinator(data: charactersVM)
            guard let personVC = coordinator.make() else {
                return
            }
            controller?.navigationController?.pushViewController(personVC, animated: true)
        }
        return controller
    }
}
