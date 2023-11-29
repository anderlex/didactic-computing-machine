//
//  LocationsCell.swift
//  iosSchool_HH
//
//  Created by student on 27.11.2023.
//

import UIKit

class LocationsCell: UITableViewCell {

    var data: LocationsCellData? {
        didSet {
            guard let data else {
                return
            }
            update(data: data)
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private var bottomBound: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Private methods

    private func update(data: LocationsCellData) {
        nameLabel.text = data.name
        descriptionLabel.text = data.type
    }
}
