//
//  Character.swift
//  iosSchool_HH
//
//  Created by student on 21.11.2023.
//

import Foundation

class Character: Codable {
    enum Gender: String, CaseIterable, Codable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
    }

    enum Status: String, CaseIterable, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }

    let id: Int
    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
    let status: Status

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
}
