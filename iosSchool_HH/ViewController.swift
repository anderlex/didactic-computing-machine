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

        generator.generateNameOne { name in
            print(name)
        }

        generator.generateNameTwo { "Some name two" }

        let completionThree = generator.generateNameThree()
        completionThree("Thomas")

        let completionFour = generator.generateNameFour()
        print(completionFour())
    }
}
