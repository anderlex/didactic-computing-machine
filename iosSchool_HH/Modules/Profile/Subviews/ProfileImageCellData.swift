//
//  ProfileBackgroundCellData.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

struct ProfileImageCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let backgroundImage: UIImage?
    let profileImage: UIImage?
}
