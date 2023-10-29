//
//  CharacterGenerator.swift
//  iosSchool_HH
//
//  Created by student on 25.10.2023.
//

import Foundation

struct Location {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}

struct LocationList {
    struct Info {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [Location]
}

class Character {
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

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status

    init(id: Int, 
         name: String,
         species: String,
         image: String,
         url: String,
         episode: [String], 
         gender: Gender,
         status: Status) {
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
