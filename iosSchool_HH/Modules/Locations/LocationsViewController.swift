//
//  LocationsViewController.swift
//  iosSchool_HH
//
//  Created by student on 18.11.2023.
//

import UIKit

class LocationsViewController<View: LocationsView>: BaseViewController<View> {

    var selectLocation: ((LocationsCellData) -> Void)?
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

        setupBar()
        rootView.setView()
        rootView.selectLocation = selectLocation
        getListOfLocations()
    }

    // MARK: - Private methods

    private func setupBar() {
        title = "Выбор планеты"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(named: "DarkBlue") ?? .black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .refresh,
//            target: self,
//            action: #selector(reload)
//        )
    }

    private func getListOfLocations() {
        dataProvider.getLocationsList { [weak self] locationList, error in
            guard let locationList else {
                print(error ?? "no error")
                return
            }
            self?.rootView.update(data: LocationsViewData(list: locationList))
        }
    }
}
