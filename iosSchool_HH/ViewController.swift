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
        var generatorOne: CharacterGeneratorProtocol
        let generatorTwo: CharacterGenerator
        generatorOne = CharacterGenerator()
        generatorTwo = CharacterGenerator()
        let charOne = generatorOne.generator()
        let charTwo = generatorTwo.generator()
        charOne.description()
        charTwo.description()
    }
}
