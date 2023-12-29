//
//  CharactersCellData.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit

struct CharactersCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let url: String?
    let isLoading: Bool
    let name: String?
    let imageUrl: String?
    let image: UIImage?
    let description: String?
    let episodes: [String]

    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        url = character.url
        self.isLoading = isLoading
        name = character.name
        imageUrl = character.image
        self.image = image
        description = character.gender.rawValue + " " + character.species
        self.selectClosure = selectClosure
        episodes = character.episode
    }

    init(url: String) {
        self.url = url
        isLoading = true
        name = nil
        imageUrl = nil
        image = nil
        description = nil
        selectClosure = nil
        episodes = []
    }
}
