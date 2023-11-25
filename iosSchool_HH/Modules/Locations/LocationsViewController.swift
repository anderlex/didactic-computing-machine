//
//  LocationsViewController.swift
//  iosSchool_HH
//
//  Created by student on 18.11.2023.
//

import UIKit

class LocationsViewController: UIViewController {

    private let dataProvider: LocationsDataProvider

    init(dataProvider: LocationsDataProvider) {
        self.dataProvider = dataProvider

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
