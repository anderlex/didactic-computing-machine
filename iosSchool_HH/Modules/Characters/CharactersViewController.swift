//
//  CharactersViewController.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

class CharactersViewController: UIViewController {

    private var characters: [Character] = []

    private let dataProvider: CharactersDataProvider
    private let charactersUrlList: [String]
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let imageService: ImageService

    init(dataProvider: CharactersDataProvider, data: LocationsCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.imageService = imageService
        charactersUrlList = data.residents
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \(data.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .magenta

        charactersUrlList.forEach { url in
            requestCharacter(url: url) { [weak self] character in
                print(character.name)
                self?.imageService.getImage(url: character.image, completion: { [weak self] image in
                    print(image?.size ?? 0)
                })
            }
        }
    }

    // MARK: - Private functions

    private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }
        DispatchQueue.global().async {
            self.dataProvider.getCharacter(url: url) { [weak self] character, error in
                guard let character else {
                    return
                }
                self?.updateQueue.async {
                    self?.characters.append(character)
                    completion(character)
                }
            }
        }
    }

    private func getCharacter(id: Int) {
        dataProvider.getCharacter(id: id) { character, error in
            character?.description() ?? print("Нет персонажа")
            print(error?.rawValue ?? "Нет ошибки")
        }
    }
}
