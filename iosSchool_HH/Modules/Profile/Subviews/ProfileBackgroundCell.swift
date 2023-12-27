//
//  ProfileBackgroundCell.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

class ProfileBackgroundCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var profileImage: UIImageView!

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(377)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        return section
    }

    func update(with inputData: ProfileBackgroundCellData) {
        backgroundImage.image = inputData.backgroundImage
        profileImage.image = inputData.profileImage
    }
}
