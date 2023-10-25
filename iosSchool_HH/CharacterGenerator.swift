//
//  CharacterGenerator.swift
//  iosSchool_HH
//
//  Created by student on 25.10.2023.
//

import Foundation

struct Location {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
}

struct LocationList {
    struct Info {
        var count: Int
        var pages: Int
        var next: String?
        var prev: String?
    }

    var info: Info
    var results: [Location]
}

class Character {
    var id: Int
    var name: String
    var species: String
    var image: String
    var url: String
    var episode: [String]
    var gender: Gender
    var status: Status

    init(id: Int, name: String, species: String, image: String, url: String,
         episode: [String], gender: Gender, status: Status) {
        self.id = id
        self.name = name
        self.species = species
        self.image = image
        self.url = url
        self.episode = episode
        self.gender = gender
        self.status = status
    }

    enum Gender: String, CaseIterable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
        static func randomGender() -> Gender {
            return allCases.randomElement() ?? unknown
        }
    }

    enum Status: String, CaseIterable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
        static func randomStatus() -> Status {
            return allCases.randomElement() ?? unknown
        }
    }

    func description() {
        print("id: \(id), name: \(name), species: \(species), image: \(image),")
        print("url: \(url), episode: \(episode), gender: \(gender), status: \(status)")
    }
}

class CharacterGenerator {
    let names: [String] = ["Alex", "Jon", "Mark"]
    let specieses: [String] = ["Human", "Animal", "Insect"]
    let values: [String] = ["1", "2", "3", "4"]
    let images: [String] = ["png", "jpg"]
    let urls: [String] = ["https", "www"]
    func generator() -> Character {
        return Character(id: Int.random(in: 1..<100000),
                         name: names.randomElement() ?? "Unnamed",
                         species: specieses.randomElement() ?? "Who are you?",
                         image: images.randomElement() ?? "Is it image?",
                         url: urls.randomElement() ?? "...",
                         episode: values,
                         gender: Character.Gender.randomGender(),
                         status: Character.Status.randomStatus()
        )
    }
}
