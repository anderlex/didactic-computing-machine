//
//  CharacterGenerator.swift
//  iosSchool_HH
//
//  Created by student on 25.10.2023.
//

import Foundation

class Character: Codable {
    enum Gender: String, CaseIterable, Codable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"

        static func randomGender() -> Gender {
            return allCases.randomElement() ?? unknown
        }
    }

    enum Status: String, CaseIterable, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"

        static func randomStatus() -> Status {
            return allCases.randomElement() ?? unknown
        }
    }

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case image
        case episode
        case url
    }

    init(
        id: Int,
        name: String,
        species: String,
        image: String,
        url: String,
        episode: [String],
        gender: Gender,
        status: Status
    ) {
        self.id = id
        self.name = name
        self.species = species
        self.image = image
        self.url = url
        self.episode = episode
        self.gender = gender
        self.status = status
    }

    func description() {
        print("id: \(id), name: \(name), species: \(species), image: \(image),")
        print("url: \(url), episode: \(episode), gender: \(gender), status: \(status)")
    }
}

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
