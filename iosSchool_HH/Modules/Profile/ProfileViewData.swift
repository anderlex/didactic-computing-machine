//
//  ProfileViewData.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

struct ProfileViewData {
    let backgroundCellData: ProfileBackgroundCellData
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
        self.backgroundCellData = ProfileBackgroundCellData(
            backgroundImage: backgroundImage,
            profileImage: profileImage
        )
        self.loginCellData = ProfileLoginCellData(login: login)
        self.infoCellData = [
            ProfileInfoCellData(lastLogin: lastLogin, color: nil),
            ProfileInfoCellData(lastLogin: nil, color: color)
        ]
        self.logOutCellData = ProfileLogOutCellData(selectClosure: selectClosure)
    }
}
