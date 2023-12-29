//
//  ProfileView.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

protocol ProfileView: UIView {
    func setView()
    func update(data: ProfileViewData)
}

class ProfileViewImp: UIView, ProfileView {
    private var sections: [CoreSection] = []

    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    func setView() {
        self.backgroundColor = UIColor(named: "silver")
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func update(data: ProfileViewData) {
        sections = [
            Sections.background.create(data: data),
            Sections.login.create(data: data),
            Sections.info.create(data: data),
            Sections.logOut.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

// MARK: - Private methods

    private enum Sections: Int {
        case background
        case login
        case info
        case logOut

        func create(data: ProfileViewData) -> CoreSection {
            switch self {
            case .background:
                ProfileBackgroundSection(cellsData: [data.backgroundCellData])
            case .login:
                ProfileLoginSection(cellsData: [data.loginCellData])
            case .info:
                ProfileInfoSection(cellsData: data.infoCellData)
            case .logOut:
                ProfileLogOutSection(cellsData: [data.logOutCellData])
            }
        }
    }

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let layoutSection = sections[section].sectionLayoutProvider?(section, env) else {
                return nil
            }
            return layoutSection
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileViewImp: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItem
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        sections[indexPath.section].cell(
            collectionView: collectionView,
            indexPath: indexPath
        ) ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileViewImp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].selectCell(at: indexPath.row)
    }
}

private extension ProfileViewImp {
    typealias ProfileBackgroundSection = Section<ProfileImageCell, EmptyReusableVIew, EmptyReusableVIew>
    typealias ProfileLoginSection = Section<ProfileLoginCell, EmptyReusableVIew, EmptyReusableVIew>
    typealias ProfileInfoSection = Section<ProfileInfoCell, EmptyReusableVIew, EmptyReusableVIew>
    typealias ProfileLogOutSection = Section<ProfileLogOutCell, EmptyReusableVIew, EmptyReusableVIew>
}
