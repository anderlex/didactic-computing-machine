//
//  CharacterGenerator.swift
//  iosSchool_HH
//
//  Created by student on 25.10.2023.
//

import Foundation

protocol CharacterGeneratorProtocol {
    func generator() -> Character
}

class CharacterGenerator: CharacterGeneratorProtocol {
    private let names: [String] = ["Alex", "Jon", "Mark"]
    private let specieses: [String] = ["Human", "Animal", "Insect"]
    private let values: [String] = ["1", "2", "3", "4"]
    private let images: [String] = ["png", "jpg"]
    private let urls: [String] = ["https", "www"]

    func generator() -> Character {
        Character(
            id: Int.random(in: 1..<100000),
            name: names.randomElement() ?? "Unnamed",
            species: specieses.randomElement() ?? "Who are you?",
            image: images.randomElement() ?? "Is it image?",
            url: urls.randomElement() ?? "...",
            episode: values,
            gender: Character.Gender.randomGender(),
            status: Character.Status.randomStatus()
        )
    }

    func generateNameOne(completion: (String) -> Void) {
        completion("Bob")
    }

    func generateNameTwo(completion: () -> (String)) {
        print(completion())
    }

    func generateNameThree() -> (String) -> Void {
        { print(String($0.reversed())) }
    }

    func generateNameFour() -> (() -> String) {
        { "Some name four" }
    }
}
