//
//  CharactersView.swift
//  iosSchool_HH
//
//  Created by student on 16.11.2023.
//

import UIKit

protocol CharactersView: UIView {}

class CharactersViewImp: UIView, AuthView {
    var delegate: AuthViewDelegate?

    func setView() {}
}
