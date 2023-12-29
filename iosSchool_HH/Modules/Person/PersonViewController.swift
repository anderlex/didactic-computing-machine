//
//  PersonViewController.swift
//  iosSchoolHH
//
//  Created by student on 14.12.2023.
//

import UIKit

final class PersonViewController<View: PersonView>: BaseViewController<View> {

    private let dataProvider: PersonDataProvider
    private let episodes: [String]
    private let imageUrl: String
    private let imageService: ImageService

    init(dataProvider: PersonDataProvider, data: CharactersCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        self.episodes = data.episodes
        self.imageUrl = data.imageUrl ?? ""
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
        title = "\(data.name ?? "")"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
        rootView.backgroundColor = UIColor(named: "character-background")
        rootView.update(data: .init(image: nil, episodeUrls: episodes))

        if !imageUrl.isEmpty {
            imageService.getImage(url: imageUrl) { [weak self] image in
                DispatchQueue.main.async {
                    self?.rootView.updatePersonPhoto(with: PersonPhotoCellData(image: image))
                }
            }
        }

        episodes.enumerated().forEach { index, url in
            DispatchQueue.global().async {
                self.dataProvider.getEpisode(url: url) { [weak self] episode, _ in
                    guard let episode else {
                        return
                    }
                    guard let episodeCellData = PersonEpisodeCellData(episode: episode) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.rootView.updateEpisode(index: index, with: episodeCellData)
                    }
                }
            }
        }
    }
}
