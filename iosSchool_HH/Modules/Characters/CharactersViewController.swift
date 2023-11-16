//
//  CharactersViewController.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class CharactersViewController: UIViewController {

    private let dataProvider: CharactersDataProvider

    init(dataProvider: CharactersDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }

    func get() {
        dataProvider.getCharacter { character, error in
            character?.description() ?? print("Нет персонажа")
            print(error?.rawValue ?? "Нет ошибки")
        }
    }
}
