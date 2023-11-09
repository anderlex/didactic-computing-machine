//
//  ViewController.swift
//  iosSchool_HH
//
//  Created by student on 19.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let generator = CharacterGenerator()
        let characters = [generator.generator(), generator.generator(), generator.generator()]

        for char in characters {
            print(char.name, char.gender)
        }

        let charactersMale = characters.filter { $0.gender == Character.Gender.male }

        for char in charactersMale {
            print(char.name, char.gender)
        }

        let charactersA = characters.filter { $0.name.contains("a") }

        for char in charactersA {
            print(char.name)
        }

        let names = ["Martin", "Wayne", "Jordan", "Daniel", "Tony", "Bill"]
        let charactersfromNames = names.map {
            let char = generator.generator()
            return Character(
                id: char.id,
                name: $0,
                species: char.species,
                image: char.image,
                url: char.url,
                episode: char.episode,
                gender: char.gender,
                status: char.status
            )
        }

        for char in charactersfromNames {
            print(char.name, char.id)
        }

        let series = ["1", "2", "3"]
        let charactersSeries = series.map { serie in
            (1...3).map { _ in
                let char = generator.generator()
                return Character(
                    id: char.id,
                    name: char.name,
                    species: char.species,
                    image: char.image,
                    url: char.url,
                    episode: [serie],
                    gender: char.gender,
                    status: char.status
                )
            }
        }

        for characters in charactersSeries {
            for char in characters {
                print(char.name, char.episode)
            }
        }

        let charactersSeriesComp = series.compactMap { serie in
            (1...3).map { _ in
                let char = generator.generator()
                return Character(
                    id: char.id,
                    name: char.name,
                    species: char.species,
                    image: char.image,
                    url: char.url,
                    episode: [serie],
                    gender: char.gender,
                    status: char.status
                )
            }
        }

        for characters in charactersSeriesComp {
            for char in characters {
                print(char.name, char.episode)
            }
        }

        let charactersNames = [generator.generator(), generator.generator(), generator.generator()]
        let sumNames = charactersNames.reduce("") { $0 + $1.name }

        print(sumNames)
    }
}
