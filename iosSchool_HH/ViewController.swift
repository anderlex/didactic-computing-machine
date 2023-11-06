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
        print(characters)
        let charactersMale = characters.filter { character in
            character.gender == Character.Gender.male
        }
        print(charactersMale)
        let charactersA = characters.filter { character in
            character.name.contains("a")
        }
        print(charactersA)

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
        print(charactersfromNames)

        let episodes = ["1", "2", "3"]
        let episodesChar = episodes.map {
            
        }
    }
}
