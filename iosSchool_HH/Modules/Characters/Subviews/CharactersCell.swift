//
//  CharactersCell.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import UIKit

class CharactersCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var descritionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var loadingImageIndicator: UIActivityIndicatorView!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(167)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(167)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(24)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30
        section.contentInsets = NSDirectionalEdgeInsets(top: 59, leading: 16, bottom: 59, trailing: 16)
        return section
    }

    func update(with inputData: CharactersCellData) {
        if inputData.isLoading {
            loadingImageIndicator.startAnimating()
            characterImage.image = UIImage(named: "placeholder-image")
        } else {
            loadingImageIndicator.stopAnimating()
            loadingImageIndicator.isHidden = true
            characterImage.image = inputData.image
        }
        nameLabel.text = inputData.name
        descritionLabel.text = inputData.description
    }
}
