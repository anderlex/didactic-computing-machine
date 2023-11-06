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

        let charactersMale = characters.filter { character in
            character.gender == Character.Gender.male
        }

        for char in charactersMale {
            print(char.name, char.gender)
        }

        let charactersA = characters.filter { character in
            character.name.contains("a")
        }

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
                status: char.status)
        }

        for char in charactersfromNames {
            print(char.name, char.id)
        }

        let series = ["1", "2", "3"]
        let charactersSeries = series.map {
            var arrayChar = [Character?]()
            for _ in 1...3 {
                let char = generator.generator()
                arrayChar.append(Character(id: char.id,
                                           name: char.name,
                                           species: char.species,
                                           image: char.image,
                                           url: char.url,
                                           episode: [$0],
                                           gender: char.gender,
                                           status: char.status))
            }
            return arrayChar
        }

        for characters in charactersSeries {
            for char in characters {
                print(char?.name ?? "Nothing", char?.episode ?? "Nothing")
            }
        }

        let charactersSeriesComp = series.compactMap {
            var arrayChar = [Character]()
            for _ in 1...3 {
                let char = generator.generator()
                arrayChar.append(Character(id: char.id,
                                           name: char.name,
                                           species: char.species,
                                           image: char.image,
                                           url: char.url,
                                           episode: [$0],
                                           gender: char.gender,
                                           status: char.status))
            }
            return arrayChar
        }

        for characters in charactersSeriesComp {
            for char in characters {
                print(char.name, char.episode)
            }
        }

        let charactersNames = [generator.generator(), generator.generator(), generator.generator()]
        let sumNames = charactersNames.reduce("") { result, char in
            return result + char.name
        }

        print(sumNames)
    }
}
