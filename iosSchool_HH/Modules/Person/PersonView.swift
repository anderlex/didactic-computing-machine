//
//  PersonView.swift
//  iosSchoolHH
//
//  Created by student on 14.12.2023.
//

import UIKit

protocol PersonView: UIView {
    func setView()
    func update(data: PersonViewData)
    func updatePersonPhoto(with data: PersonPhotoCellData)
    func updateEpisode(index: Int, with data: PersonEpisodeCellData)
}

class PersonViewImp: UIView, PersonView {

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

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func update(data: PersonViewData) {
        sections = [
            Sections.photoSection.create(data: data),
            Sections.episodes.create(data: data)
        ]
        sections.forEach { $0.registrate(collectionView: collectionView) }
        collectionView.reloadData()
    }

    func updatePersonPhoto(with data: PersonPhotoCellData) {
        sections[0].updateCell(at: IndexPath(item: 0, section: 0), with: data)
        guard let cell = sections[0].cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: 0, section: 0)
        ) as? PersonPhotoCell else {
            return
        }
        cell.update(with: data)
    }

    func updateEpisode(index: Int, with data: PersonEpisodeCellData) {
        guard let sectionIndex = sections.firstIndex(where: { $0 is PersonEpisodeSection }) else {
            return
        }
        sections[sectionIndex].updateCell(at: IndexPath(item: index, section: sectionIndex), with: data)
        guard let cell = sections[sectionIndex].cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: index, section: sectionIndex)
        ) as? PersonEpisodeCell else {
            return
        }
        cell.update(with: data)
    }

// MARK: - Private methods

    private enum Sections: Int {
        case photoSection
        case episodes

        func create(data: PersonViewData) -> CoreSection {
            switch self {
            case .photoSection:
                PersonPhotoSection(cellsData: [data.photoCellData])
            case .episodes:
                PersonEpisodeSection(cellsData: data.episodeData, headerData: data.episodeHeader)
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

extension PersonViewImp: UICollectionViewDataSource {

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

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        sections[indexPath.section].reusableView(
            collectionView: collectionView,
            indexPath: indexPath,
            kind: kind
        ) ?? UICollectionReusableView()
    }
}

// MARK: - UICollectionViewDelegate

private extension PersonViewImp {
    typealias PersonPhotoSection = Section<PersonPhotoCell, EmptyReusableVIew, EmptyReusableVIew>
    typealias PersonEpisodeSection = Section<PersonEpisodeCell, PersonHeaderView, EmptyReusableVIew>
}
