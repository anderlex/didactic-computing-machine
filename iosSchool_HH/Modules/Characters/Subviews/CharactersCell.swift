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

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        clipsToBounds = false
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        characterImage.clipsToBounds = true
        characterImage.layer.cornerRadius = 15
    }

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
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 59,
            leading: 16,
            bottom: 71,
            trailing: 16
        )
        return section
    }

    func update(with inputData: CharactersCellData) {
        if inputData.isLoading {
            loadingImageIndicator.startAnimating()
            loadingImageIndicator.isHidden = false
        } else {
            loadingImageIndicator.stopAnimating()
            loadingImageIndicator.isHidden = true
        }
        characterImage.image = inputData.image ?? UIImage(named: "placeholder-image")
        nameLabel.text = inputData.name
        descritionLabel.text = inputData.description
    }
}
