//
//  ProfileInfoCell.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

class ProfileInfoCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var profileColor: UIView!
    @IBOutlet private weak var lastLogin: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "black")?.cgColor
        clipsToBounds = false
        layer.shadowRadius = 8
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        profileColor.layer.cornerRadius = 10
    }

    static func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 18
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 70,
            leading: 32,
            bottom: 0,
            trailing: 32
        )
        return section
    }

    func update(with inputData: ProfileInfoCellData) {
        if let color = inputData.color {
            descriptionLabel.text = "Цвет профиля"
            profileColor.isHidden = false
            profileColor.backgroundColor = color
            lastLogin.isHidden = true
        } else {
            descriptionLabel.text = "Дата входа"
            lastLogin.isHidden = false
            lastLogin.text = inputData.lastLogin
            profileColor.isHidden = true
        }
    }
}
