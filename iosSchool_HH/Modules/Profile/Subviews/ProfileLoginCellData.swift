//
//  ProfileLoginCellData.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import Foundation

struct ProfileLoginCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let login: String?
}
