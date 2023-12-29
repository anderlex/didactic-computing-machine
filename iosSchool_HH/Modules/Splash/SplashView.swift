//
//  SplashView.swift
//  iosSchool_HH
//
//  Created by student on 09.11.2023.
//

import UIKit

protocol SplashView: UIView {
    func setView()
}

class SplashViewImp: UIView, SplashView {

    @IBOutlet private var imageLogo: UIImageView!

    func setView() {}
}
