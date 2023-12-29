//
//  ProfileViewData.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

struct ProfileViewData {
    let backgroundCellData: ProfileImageCellData
    let loginCellData: ProfileLoginCellData
    let infoCellData: [ProfileInfoCellData]
    let logOutCellData: ProfileLogOutCellData

    init(
        backgroundImage: UIImage?,
        profileImage: UIImage?,
        login: String?,
        lastLogin: String?,
        color: UIColor?,
        selectClosure: @escaping ((CoreCellInputData) -> Void)
    ) {
        backgroundCellData = ProfileImageCellData(
            backgroundImage: backgroundImage,
            profileImage: profileImage
        )
        loginCellData = ProfileLoginCellData(login: login)
        infoCellData = [
            ProfileInfoCellData(lastLogin: lastLogin, color: nil),
            ProfileInfoCellData(lastLogin: nil, color: color)
        ]
        logOutCellData = ProfileLogOutCellData(selectClosure: selectClosure)
    }
}
