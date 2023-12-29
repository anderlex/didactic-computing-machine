//
//  ProfileInfoCellData.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

struct ProfileInfoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let lastLogin: String?
    let color: UIColor?
}
