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
        let char = generator.generator()
        char.description()
    }
}