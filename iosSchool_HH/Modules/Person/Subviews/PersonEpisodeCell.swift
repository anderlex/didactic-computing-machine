//
//  PersonEpisodeCell.swift
//  iosSchool_HH
//
//  Created by student on 14.12.2023.
//

import UIKit

class PersonEpisodeCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var numberBackground: UIView!
    @IBOutlet private weak var episodeName: UILabel!
    @IBOutlet private weak var episodeAirDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        clipsToBounds = false
        numberBackground.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        numberBackground.layer.shadowOpacity = 1
        numberBackground.layer.shadowRadius = 4
        numberBackground.layer.shadowOffset = CGSize(width: 0, height: 4)
        numberBackground.layer.cornerRadius = 16
    }

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 26
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 18,
            bottom: 50,
            trailing: 18
        )
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    func update(with inputData: PersonEpisodeCellData) {
        numberLabel.text = inputData.number
        episodeName.text = inputData.name
        episodeAirDate.text = inputData.airDate
    }
}
